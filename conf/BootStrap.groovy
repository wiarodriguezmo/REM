import co.edu.uniandes.login.Role
import co.edu.uniandes.login.User
import co.edu.uniandes.login.UserRole
import co.edu.uniandes.search.Tema

class BootStrap {
	// Rol de administrador
	private static final ADMIN_ROLE="ROLE_ADMIN"
	
	// Lista de roles: Adicione todos los roles que cree como constantes en la siguiente lista para que se creen autom�ticamente
	def rolesList = [ADMIN_ROLE]
	
    def init = { servletContext ->
		def roles=createRoles()
		def superUsers=createSuperUsers()
		cargarTemas()
    }
    def destroy = {
    }

    def cargarTemas()
    {
        Tema tema
        Tema subtema
		Tema subtema2
		Tema subtema3

        tema = new Tema()
        tema.nombre = 'Sistema de ecuaciones lineales'
        tema.nivel = 1

        subtema = new Tema()
        subtema.nombre = 'Representación'
        subtema.nivel = 2
        tema.addToSubtemas(subtema)

        subtema = new Tema()
        subtema.nombre = 'Resolución'
        subtema.nivel = 2
        tema.addToSubtemas(subtema)
		
		subtema = new Tema()
		subtema.nombre = 'Sistemas homogeneos'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)

        tema.save(flush: true)

        tema = new Tema()
        tema.nombre = 'Matrices'
        tema.nivel = 1

        subtema = new Tema()
        subtema.nombre = 'Definición de propiedades'
        subtema.nivel = 2
        tema.addToSubtemas(subtema)
		
		subtema = new Tema()
		subtema.nombre = 'Operación matrices'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		subtema2 = new Tema()
		subtema2.nombre = 'A-1'
		subtema2.nivel = 3
		subtema.addToSubtemas2(subtema2)
		
		subtema.save(flush: true)
		
		subtema = new Tema()
		subtema.nombre = 'Tipos de matrices'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		subtema = new Tema()
		subtema.nombre = 'Determinantes'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		subtema2 = new Tema()
		subtema2.nombre = 'Definición de propiedades'
		subtema2.nivel = 3
		subtema.addToSubtemas2(subtema2)
		
		subtema2 = new Tema()
		subtema2.nombre = 'Aplicaciones'
		subtema2.nivel = 3
		subtema.addToSubtemas2(subtema2)
		
		subtema3 = new Tema()
		subtema3.nombre = 'Geometria'
		subtema3.nivel = 4
		subtema2.addToSubtemas3(subtema3)
		
		subtema3 = new Tema()
		subtema3.nombre = '???'
		subtema3.nivel = 4
		subtema2.addToSubtemas3(subtema3)
		
		subtema2.save(flush: true)
		
		subtema.save(flush: true)
		
		/*Nuevos*/
		
		subtema = new Tema()
		subtema.nombre = 'Subespacios de matrices'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		/*Fin nuevos*/
		
		tema.save(flush: true)
		
		/*Nuevos*/
		
		tema = new Tema()
		tema.nombre = 'R2,R3, Rn'
		tema.nivel = 1
		
		subtema = new Tema()
		subtema.nombre = 'Representación definición'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)

		subtema = new Tema()
		subtema.nombre = 'Operaciones'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		subtema = new Tema()
		subtema.nombre = 'Relaciones geométricas'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)		
		
		tema.save(flush: true)
		
		tema = new Tema()
		tema.nombre = 'Subespacios'
		tema.nivel = 1
		
		tema.save(flush: true)
		
		tema = new Tema()
		tema.nombre = 'Base'
		tema.nivel = 1
		
		subtema = new Tema()
		subtema.nombre = 'Combinación lineal espacio general'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)

		subtema = new Tema()
		subtema.nombre = 'Independencia lineal'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		subtema = new Tema()
		subtema.nombre = 'Dimensión coodenadas cambios de base'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		subtema = new Tema()
		subtema.nombre = 'Tipo de base octonormal'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		tema.save(flush: true)
		
		tema = new Tema()
		tema.nombre = 'Ejemplos de aplicacion'
		tema.nivel = 1
		
		subtema = new Tema()
		subtema.nombre = 'Funciones-Polinomios'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)

		subtema = new Tema()
		subtema.nombre = 'Mínimos cuadrados'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		tema.save(flush: true)
		
		tema = new Tema()
		tema.nombre = 'Transformaciones lineales'
		tema.nivel = 1
		
		subtema = new Tema()
		subtema.nombre = 'Definición de propiedades'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)

		subtema = new Tema()
		subtema.nombre = 'Representación matriicial de TL'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		subtema = new Tema()
		subtema.nombre = 'Progresiones'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		tema.save(flush: true)
		
		tema = new Tema()
		tema.nombre = 'Valores y vectores propios'
		tema.nivel = 1
		
		subtema = new Tema()
		subtema.nombre = 'Definición y propiedades'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)

		subtema = new Tema()
		subtema.nombre = 'Aplicaciones'
		subtema.nivel = 2
		tema.addToSubtemas(subtema)
		
		subtema2 = new Tema()
		subtema2.nombre = 'Diagonalización'
		subtema2.nivel = 3
		subtema.addToSubtemas2(subtema2)
		
		subtema2 = new Tema()
		subtema2.nombre = 'Formas cuadráticas'
		subtema2.nivel = 3
		subtema.addToSubtemas2(subtema2)
		
		subtema.save(flush: true)
		
		tema.save(flush: true)
		
		/*Fin nuevos*/
        

        
    }
	
	/**
	 * Crea los roles definidos en roleList, retornando los que pudo crear
	 * @return ret la lista de roles creados
	 */
	def createRoles() {
		def ret=[]
		rolesList.each { role ->
			if(Role.find{authority==role}==null) {
				Role newRole=new Role(authority: role)
				newRole.save(flush: true)
				ret.add(newRole)
			}
		}
	}
	
	/**
	 * Crea los usuarios administradores asign�ndoles el rol ADMIN_ROLE de la constante
	 * @return ret la lista de administradores creados
	 */
	def createSuperUsers() {
		def ret=[]
		def usersList=["cr.calle","se-busto","mf.higuera","gcortes"]
		Role role=Role.find{authority==ADMIN_ROLE}
		usersList.each { user->
			if(User.find{username==user}==null) {
				User newUser=new User(username:user, password: "a,fj7ueui73")
				newUser.save(flush:true)
				UserRole.create newUser, role
			}
		}
	}
}
