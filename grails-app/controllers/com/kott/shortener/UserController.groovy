package com.kott.shortener

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import com.kott.shortener.user.exceptions.CannotCreateUserException

class UserController {

  static allowedMethods = [create: 'POST']

  def emailConfirmationService
  def userService

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
}
