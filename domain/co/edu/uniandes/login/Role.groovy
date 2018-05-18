package co.edu.uniandes.login

class Role {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
	
	String toString() { 
		return(authority)
	}
	
}
