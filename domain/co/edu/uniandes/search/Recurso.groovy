package co.edu.uniandes.search

class Recurso extends Item 
{
	String formato
	String descripcion
	String url

    static constraints = {			
		formato blank: false
		descripcion blank: false
		url blank: false
    }
}
