package co.edu.uniandes.login
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class UserRoleController {

    static scaffold=true
	
	def show(UserRole userRoleInstance) {
		redirect(action: "index")
	}
	
	def edit(UserRole userRoleInstance) {
		redirect(action: "index")
	}
	
	def delete(UserRole userRoleInstance) {
		redirect(action: "index")
	}
	
	def create() {
		redirect(action: "index")
	}

	def save() {
		redirect(action: "index")
	}

}
