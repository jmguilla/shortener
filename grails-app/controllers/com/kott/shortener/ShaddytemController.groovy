package com.kott.shortener

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

class ShaddytemController {
	
	def springSecurityService
	
	/**
	 * Display view of user urls
	 * @return 
	 */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def list() {
		String view = 'list'
		respond(view: view)
	}
	
	/**
	 * Display details of shaddytem
	 * @return
	 */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def show() {
		String id = params.id
		
		String view = 'show'
		
		render view: view, model: [shaddytemId: id]
	}
	
	/**
	 * Return Shaddytem identified by id given as parameter if current user is shaddytem owner
	 * 
	 * @return
	 */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def getShaddytem() {
		
		def id = null;
		
		if(request.parameterMap.containsKey("id"))
			id = request.parameterMap.get("id")[0]
		
		println "get item for id : <" + id + "> TODO "
			
		User me = springSecurityService.getCurrentUser()
		
		def Shaddytem shaddytem = null
		// get it from database

		// mock
		shaddytem = new Shaddytem();
		shaddytem.id = id;
		shaddytem.shortUrl = "http://sha.dy/" + "not available" + "V" + id;
		shaddytem.longUrl = "http://www.google.com/longUrlVersion" + id;
		shaddytem.numClicks  = 10;
		shaddytem.urlOwnerId = "admin@yahoo.Fr"
		
		if(testUserAcces(shaddytem)){
			render(shaddytem as JSON)
		}
		else{
			response.status = 400
			render ( [alert: 'danger', message: message(code: 'shaddytem.get.failure', args: [], default: "You can't access this data")] as JSON)
		}
	} 
	
	/**
	 * Return all urls of given user as JSON array
	 * @return
	 */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def getListForUser() {
		
		def userId = null
		if(request.parameterMap.containsKey("userId"))
			userId = request.parameterMap.get("userId")
		
		def result = []
		for (int i=0; i<10;i++) {
		  Shaddytem item = new Shaddytem();
		  item.id = i;
		  item.shortUrl = "http://sha.dy/" + userId + "V" + i;
		  item.longUrl = "http://www.google.com/longUrlVersion" + i;
		  item.numClicks  = 10 * i;
		  result.push(item)
		}
		render(result as JSON)
	}
	
	/**
	 * Return all urls of current user as JSON array
	 * @return
	 */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def getListForCurrentUser() {
		
		def result = []
		
		
		def user = null
		def userId = null
		if(springSecurityService.isLoggedIn()){
			user = springSecurityService.getCurrentUser()
			userId = user.email
		
			println userId
			
			
			for (int i=0; i<10;i++) {
			  Shaddytem item = new Shaddytem();
			  item.id = i;
			  item.shortUrl = "http://sha.dy/" + userId + "V" + i;
			  item.longUrl = "http://www.google.com/longUrlVersion" + i;
			  item.numClicks  = 10 * i;
			  result.push(item)
			}
		}
		render(result as JSON)
	}
	
	/**
	 * Verify if current user can access given shaddytem
	 * @param item
	 * @return
	 */
	boolean testUserAcces(Shaddytem item){
		User me = springSecurityService.getCurrentUser()
		if(me != null && item != null
			&& item.urlOwnerId.toLowerCase().equals(me.email.toLowerCase())){
			return true;
		}
		return false;
	}

}
