package com.kott.shortener

import grails.plugin.springsecurity.annotation.Secured

class RootController {

  def index() {
    render view: '/index.gsp'
  }

  def retrieve() {
    println 'retrieve'
    withFormat{
      html{
        
      }
      json{
        
      }
    }
  }

  def create() {
    println 'create'
    withFormat{
      html{
        
      }
      json{
        
      }
    }
  }
}
