package co.edu.uniandes.search

class Item
{
    String id
    String handle
    String nombre
    String curso
    Archivo[] archivos

    static constraints = {
        id blank: false
        handle blank: false
        nombre blank: false
        curso blank: false
        //archivos min: 1
    }
}