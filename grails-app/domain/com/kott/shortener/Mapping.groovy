package com.kott.shortener


class Mapping {

  def mappingService

  def long id

  def String target

  def String description

  def String shortId
  
  static transients = ["shortId"]
  static belongsTo = [user: User]

  static constraints = {
    user nullable: true;
	description nullable: true;
    target blank: false, nullable: false, size: 1..20000, validator: {val, obj, errors ->
      try{
        new URL(val)
        return true
      }catch(Throwable t){
        errors.rejectValue('target', 'mapping.target.url.error', 'Target must be a valid URL')
      }
    }
  }
  
  /**
   * Create JSON version of current object with only necessary values
   * @return
   */
  def jsonReady() {
	  return ["id" : this.id, "target" : this.target, "description" : this.description, "shortId" : this.shortId]
  }
  
  def afterInsert(){
    computeShortId()
  }

  def afterUpdate(){
    computeShortId()
  }

  def onLoad(){
    computeShortId()
  }

  def computeShortId(){
    this.shortId = mappingService.getShortId(this)
  }
}
