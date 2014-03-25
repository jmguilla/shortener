package com.kott.shortener

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class MappingController {

  def springSecurityService
  def mappingService
  def analyticsService

  static allowedMethods = [create:['GET', 'PUT'], retrieve: 'GET', getStats: 'GET']

  def index() {
  }

  /**
   * Retrieves a {@link Mapping} from a shortId passed as an entry of params map.
   * See {@link UrlMappings} for the custom mapping. This method is <bold>format</bold> aware:
   * <ul>
   *    <li>
   *      JSON: renders the appropriate object as JSON if it exists, otherwise, response.status == 404.
   *    </li>
   *    <li>
   *      HTML: renders the appropriate view
   *    </li>
   * </ul
   * 
   */
  @Secured([
    'IS_AUTHENTICATED_ANONYMOUSLY'
  ])
  def retrieve() {
    def result = [status: 200]
    if(!params.shortId){
      result.status = 400
      result.alert = 'danger'
      result.message = 'shortId parameter is missing'
    }else{
      result.mapping = mappingService.retrieveFromShortId(params.shortId)
      if(!result.mapping){
        result.status = 404
        result.alert = 'danger'
        result.message = message(code: 'rest.mapping.notfound', default: "No mapping with such shortId: ${params.shortId}", args: [params.shortId])
      }
    }
    withFormat{
      html{
        if(result.mapping){
          render view: "redirect", model: [mapping: result.mapping]
        }else{
          response.sendError(result.status, result.message)
        }
      }
      json{
        response.status = result.status
        render(result as JSON)
      }
    }
  }

  /**
   * PUT: Creates a new {@link Mapping} and returns a JSON result with the following fields:
   * <ul>
   *   <li>alert: matching a value of <a href="http://getbootstrap.com/components/#alerts">http://getbootstrap.com/components/#alerts</a><li>
   *   <li>message: to describe what happened</a><li>
   *   <li>result: only in case of alert == 'success', the url of the newly created {@link Mappin}</li>
   * </ul>
   * params:
   * <ul>
   *  <li>target: the target url in a JSON object in request's body</li>
   * </ul>
   * 
   * GET: Renders the create view
   * 
   */
  @Secured([
    'IS_AUTHENTICATED_ANONYMOUSLY'
  ])
  def create() {
    if('get'.equalsIgnoreCase(request.method)){
      render view: 'create'
    }else if('put'.equalsIgnoreCase(request.method)){
      if(!request.JSON.target){
        response.status = 400
        render([
          alert: 'danger',
          message: message(code: 'rest.mapping.create.targetmissing', default: 'Target parameter required')
        ] as JSON)
      }else{
        Mapping result = new Mapping(target: request.JSON.target, user: springSecurityService.currentUser)
        if(!result.save(flush: true)){
          render([
            alert: 'danger',
            message: message(code: 'rest.mapping.create.failure', default: 'Mapping created', args: [result.errors as String])
          ] as JSON)
        }else{
          render([
            alert: 'success',
            message: message(code: 'rest.mapping.create.success', default: 'Mapping created'),
            result: g.createLink(absolute: true, uri: '/') + mappingService.getShortId(result)
          ] as JSON)
        }
      }
    }
  }
  
  /**
   * Retrieves the links' statistics for the authenticated user
   * @return the links' statistics for the authenticated user
   */
  @Secured(['IS_AUTHENTICATED_FULLY'])
  def stats(){
    Set<Mapping> mappings = mappingService.getUserMappings(springSecurityService.currentUser)
    def result = [:]
    if(mappings){
      result = analyticsService.retrieveStats(springSecurityService.currentUser, mappings)
    }
    withFormat{
      json{
        render([alert: 'success', message: message(code: 'rest.mapping.statistics.retrieved', default: 'Mappings statistics retrieved successfully'), result: result] as JSON)
      }
      '*'{
        render(result)
      }
    }
  }
}
