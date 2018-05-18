package co.edu.uniandes.search

class Examen extends Item
{
	String fecha
	String periodo
	String parcial
	String profesor
	
    static constraints = {
        fecha blank: false
		periodo blank: false
		parcial blank: false
		profesor blank: false
    }
}