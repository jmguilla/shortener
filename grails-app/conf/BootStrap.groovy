import org.codehaus.groovy.grails.web.json.JSONObject

import com.kott.shortener.Role
import com.kott.shortener.User
import com.kott.shortener.UserRole

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
	
	def userRole = Role.findByAuthority('ROLE_USER_2') ?: new Role(authority: 'ROLE_USER_2').save(failOnError: true)
	def adminRole = Role.findByAuthority('ROLE_ADMIN_2') ?: new Role(authority: 'ROLE_ADMIN_2').save(failOnError: true)
	
	//add an admin and default user
	def adminUser = User.findByUsername('admin') ?: new User(
			email: "admin@yahoo.fr",
			username: 'admin',
			password: 'admin',  
			enabled:true, 
			accountExpired:false, 
			accountLocked:false, 
			passwordExpired:false).save(failOnError: true)

	def basicUser = User.findByUsername('guest') ?: new User(
			email: "user@yahoo.fr",
			username: 'guest',
			password: 'guest', 
			enabled:true, 
			accountExpired:false, 
			accountLocked:false, 
			passwordExpired:false).save(failOnError: true)

	if (!adminUser.authorities.contains(adminRole)) {
		UserRole.create adminUser, adminRole
	}
	if (!basicUser.authorities.contains(userRole)) {
		UserRole.create basicUser, userRole
	}
	
	/*
	 *  String email
  String username
  String password
  boolean enabled
  boolean accountExpired
  boolean accountLocked
  boolean passwordExpired
	 * 
	 */
	def test = new User( email: "test@yahoo.fr", username: "testuser", password:"testpass", 
		enabled:true, accountExpired:false, accountLocked:false, passwordExpired:false ).save(failOnError: true)

  }
  def destroy = {
  }
}
