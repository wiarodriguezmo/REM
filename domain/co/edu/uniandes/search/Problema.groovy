package co.edu.uniandes.search

class Problema extends Item
{
	String[] temas
	String dificultad
	
    static constraints = {
		dificultad blank: false
    }
}