package co.edu.uniandes.search

class Archivo
{
    String id
    String nombre
    String urlDescarga
    String urlVisualizacion
    String formato
    String descripcion
    String mimeType
    String tamBytes

    static constraints = {
        id blank: false
        nombre blank: false
        urlDescarga blank: false
        urlVisualizacion blank: false
        formato blank: false
        mimeType blank: false
        tamBytes blank: false
    }
}