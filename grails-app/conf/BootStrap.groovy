import org.codehaus.groovy.grails.web.json.JSONObject

import com.kott.shortener.Role

class BootStrap {

  def init = { servletContext ->
    JSONObject.NULL.metaClass.asBoolean = {-> false}

    //initializing data
    Role admin = null
    if(Role.count() < 3){
      new Role(authority: "ROLE_USER").save(failOnError: true)
      new Role(authority: "ROLE_ADMIN").save(failOnError: true)
      new Role(authority: "ROLE_FACEBOOK").save(failOnError: true)
    }

  }
  def destroy = {
  }
}
