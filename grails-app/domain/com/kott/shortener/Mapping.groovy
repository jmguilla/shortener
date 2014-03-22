package com.kott.shortener

class Mapping {

  def long id

  def String target
  
  static belongsTo = [user: User]

  static constraints = {
    user nullable: true
  }
}
