package com.kott.shortener

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

class ShaddytemController {

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
	 * Return all urls of current user as JSON array
	 * @return
	 */
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def getListForUser() {
		
		def userId = null
		if(request.parameterMap.containsKey("userId"))
			userId = request.parameterMap.get("userId")
		
		println userId
		
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

}
