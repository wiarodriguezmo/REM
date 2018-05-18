package co.edu.uniandes.search

class Tema {
	
	String nombre
	Integer nivel
	
	static hasMany = [subtemas: Tema, subtemas2: Tema, subtemas3: Tema ]
	

    static constraints = {
		nombre blank: false
		nivel min: 1
    }
	
	String toString(){
		return nombre
	}
}