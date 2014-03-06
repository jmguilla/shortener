package com.kott.shortener

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class MappingController {

  def mappingService

  static allowedMethods = [create:['GET', 'PUT'], retrieve: 'GET']

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
    withFormat{
      html{
      }
      json{
        if(!params.shortId){
          response.status = 400
          render([alert: 'danger', message: 'shortId parameter is missing'] as JSON)
          return
        }else{
          Mapping mapping = mappingService.retrieveFromShortId(params.shortId)
          if(!mapping){
            response.sendError(404, message(code: 'rest.mapping.notfound', default: "No mapping with such shortId: ${params.shortId}", args: [params.shortId]))
            return
          }else{
            render([(params.shortId): mapping] as JSON)
            return
          }
        }
      }
    }
  }

  /**
   * PUT: Creates a new {@link Mapping} and returns a JSON result with the following fields:
   * <ul>
   *   <li>alert: mathing a value of <a href="http://getbootstrap.com/components/#alerts">http://getbootstrap.com/components/#alerts</a><li>
   *   <li>message: to describe what happened</a><li>
   *   <li>result: only in case of alert == 'success', the url of the newly created {@link Mappin}</li>
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
      Mapping result = new Mapping(target: "http://www.google.com")
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