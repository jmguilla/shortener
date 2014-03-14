package com.kott.shortener

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import com.kott.shortener.user.exceptions.CannotCreateUserException


class UserController {

  static allowedMethods = [create: 'POST', update: 'POST', updatePWD: 'POST']

  def emailConfirmationService
  def userService
  def springSecurityService
  def saltSource

  def getUser() {
    def result = [:]
    def user = null
    if(springSecurityService.isLoggedIn()){
      user = springSecurityService.getCurrentUser()
    }
    else{
      user = "not logged";
    }

    result.user = user
    render(result as JSON)
  }

  @Transactional
  @Secured(['permitAll'])
  def create(){
    def result = null
    if(request.post){
      //creating a new user
      String email = params.email
      String pwd = params.pwd
      if(!email || !pwd){
        result = [alert: 'danger', message: message(code: 'user.create.missingparams', default: 'Email and passwords are required.')]
      }else{
        try{
          User newUser = userService.create(email, pwd)
          emailConfirmationService.sendConfirmation(
              to:newUser.email,
              subject:"Please confirm!")
          result = [alert: 'success', message: message(code: 'user.create.success', default: 'User created!!')]
        }catch(CannotCreateUserException ccue){
          result = [alert: 'danger', message: message(code: 'user.create.failure', default: 'Cannot create user {0}', args:[
              "User errors: " + (ccue.user.errors as String) + '\nUserRole errors: ' + (ccue.userRole.errors as String)
            ])]
        }

      }
      //TODO maybe that can be moved at the bottom of the method
      if(request.xhr){
        render(result as JSON)
      }else{
        flash.result = result
      }
    }else{
    }
  }

  /**
   * To update a user's details. So far, only "username" can be updated.
   * curl -X POST -d "{'username': 'monusername'}" -> since authentication is required, doesn't work with curl...
   * 
   * @return
   */
  @Secured(['IS_AUTHENTICATED_FULLY'])
  @Transactional
  def update(){
    try{
      User me = springSecurityService.getCurrentUser()
      bindData(me, request.JSON, [include: ['username']])
      me.save(failOnError: true, flush: true)
      render ( [alert: 'success', message: message(code: 'user.update.success', default: 'Update performed successfully')] as JSON)
    }catch(Throwable t){
      //TODO log here!
      response.status = 400
      render ( [alert: 'danger', message: message(code: 'user.update.failure', args: [t.toString()], default: 'Cannot performe the update: {0}')] as JSON)
    }
  }

  /**
   * To update a user's password.
   * curl -X POST -d "{'current': 'currentPWD', 'newPWD': 'monNewPwd', 'newPWDAgain': 'monNewPwd'}" -> since authentication is required, doesn't work with curl...
   *
   * @return
   */
  @Secured(['IS_AUTHENTICATED_FULLY'])
  @Transactional
  def updatePWD(){
    def current = request.JSON.current
    def newPWD = request.JSON.newPWD
    def newPWDAgain = request.JSON.newPWDAgain
    if(!current || !newPWD || !newPWDAgain){
      response.status = 400
      render([alert: 'danger', message: message(code: 'user.pwd.update.paramsrequired')] as JSON)
      return
    }
    if(!newPWD.equals(newPWDAgain)){
      response.status = 400
      render([alert: 'danger', message: message(code: 'user.pwd.update.wrongconfirmation')] as JSON)
      return
    }
    def user = springSecurityService.getCurrentUser()
    def userDetails = springSecurityService.userDetailsService.loadUserByUsername(user.email)
    def salt = saltSource.getSalt(userDetails)
    if(!springSecurityService.passwordEncoder.isPasswordValid(userDetails.password, current, salt)){
      response.status = 400
      render([alert: 'danger', message: message(code: 'user.pwd.update.missmatch')] as JSON)
      return
    }
    user.password = newPWD
    try{
      user.save(failOnError: true)
      render([alert: 'success', message: message(code: 'user.pwd.update.success')] as JSON)
    }catch(Throwable t){
      //TODO log here!
      response.status = 400
      render ( [alert: 'danger', message: message(code: 'user.update.failure', args: [t.toString()], default: 'Cannot perform the update: {0}')] as JSON)
    }
  }
}
