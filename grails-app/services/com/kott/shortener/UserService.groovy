package com.kott.shortener

import grails.events.Listener
import grails.transaction.Transactional

import org.springframework.transaction.annotation.Propagation

import com.kott.shortener.user.exceptions.CannotCreateUserException

@Transactional
class UserService {

  @Transactional(propagation = Propagation.MANDATORY)
  def create(String email, String pwd) {
    User newUser = new User(email: email, password: pwd, enabled: false)
    UserRole newUserRole = new UserRole(user: newUser, role: Role.findByAuthority("ROLE_USER"))
    if(!newUser.save() || !newUserRole.save()){
      throw new CannotCreateUserException("Cannot create user", newUser, newUserRole)
    }
    return newUser
  }

  //  @grails.events.Listener(topic:'confirmed', namespace:'plugin.emailConfirmation')
  //  def userConfirmed(info) {
  //    log.info "User ${info.email} successfully confirmed with application id data ${info.id}"
  //    return [controller:'userProfile', action:'welcomeNewUser']
  //  }

  @Listener
  def userConfirmed(info){
    log.info "User ${info.email} successfully confirmed with application id data ${info.id}"
    return [controller:'user', action:'welcomeNewUser']
  }
}
