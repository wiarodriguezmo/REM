package co.edu.uniandes.dspace

import co.edu.uniandes.search.Archivo
import co.edu.uniandes.search.Examen
import co.edu.uniandes.search.Item
import co.edu.uniandes.search.Problema
import co.edu.uniandes.search.Recurso
import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.JSONElement
import org.springframework.http.HttpHeaders
import org.springframework.util.LinkedMultiValueMap
import org.springframework.util.MultiValueMap

@Transactional
class RepositorioService
{
    final static String HOST = 'http://157.253.9.78:8080'
    final static String PWD = '12345Fea$lidie'
    final static String USER = 'soportelidie@uniandes.edu.co'
    final static String COLECCION_PENTAGONO = 'f2c91e15-418e-47ef-960e-9329821ba2cb'

    /**
     * Tipos de ítems que maneja la colección.
     */
    enum TipoItem
    {
        EXAMEN('Examen'), PROBLEMA('Problema'), RECURSO('Recurso')
        TipoItem(String value) { this.valor = value }
        private final String valor
        String getValor() { valor }
    }

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // POST
    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------

    /**
     * Hace login a un dspace con un usuario administrador. Cuando status es 401 implica que no se pudo autenticar.
     * @return id de la sesión para efectuar llamados a los servicios.
     */
    String loginDSpace()
    {
        RestResponse resp
        RestBuilder rest = new RestBuilder()
        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>()
        form.add("email", USER)
        form.add("password", PWD)
        resp = rest.post(HOST + "/rest/login") { accept("application/json") contentType("application/x-www-form-urlencoded") body(form) }
        return resp.headers["Set-Cookie"][0].substring(11,43)
    }

    /**
     * Permite realizar búsqueda exacta de ítems por metadato.
     * @param  idSesion
     *         Identificador de la sesión abierta.
     * @param  metadato
     *         Metadato sobre el cual se debe efectuar la búsqueda.
     * @param  valor
     *         Valor exacto de búsqueda.
     * @return Arreglo de ítems, con metadatos e información de bitstreams, encontrados tras la búsqueda.
     */
    Item[] buscarItems(String idSesion, String metadato, String valor)
    {
        Item[] items
        RestBuilder rest = new RestBuilder()
        JSONElement json

        json = rest.post(HOST + "/rest/items/find-by-metadata-field") {  headers["Cookie"] = "JSESSIONID=" + idSesion + ""; accept("application/json") contentType("application/json") json '{ "key": "' + metadato + '", "value": "' + valor + '", "language": "en_US" }' }.json
        items = new Item[json.collect().size()]
        json.collect().eachWithIndex { it, index ->
            items[index] = getItemMetadata(idSesion, (String) it.uuid, (String) it.handle)
            items[index].archivos = getItemBitstreams(idSesion, (String) it.uuid, (String) it.handle)
        }

        return items
    }

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // GET
    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------

    /**
     * Retorna todos los ítems de una colección, con todos sus metadatos e información de bitstreams.
     * @param  idSesion
     *         Identificador de la sesión abierta.
     * @param  idColeccion
     *         Identificador de la colección en DSpace.
     * @return Arreglo de ítems de la colección.
     */
    Item[] getItemsColeccion(String idSesion, String idColeccion)
    {
        Item[] items
        RestBuilder rest = new RestBuilder()
        JSONElement json

        json = rest.get(HOST + "/rest/collections/" + idColeccion + "/items") { headers["Cookie"] = "JSESSIONID=" + idSesion + ""; accept("application/json") contentType("application/json") }.json
        items = new Item[json.collect().size()]
        json.collect().eachWithIndex { it, index ->
            items[index] = getItemMetadata(idSesion, (String) it.uuid, (String) it.handle)
            items[index].archivos = getItemBitstreams(idSesion, (String) it.uuid, (String) it.handle)
        }

        return items
    }

    /**
     * Retorna todos los metadatos de un ítem.
     * @param  idSesion
     *         Identificador de la sesión abierta.
     * @param  idItem
     *         Identificador en DSpace del ítem a consultar.
     * @param  handleItem
     *         Handle en DSpace del ítem a consultar.
     * @return Item con todos sus metadatos.
     */
    Item getItemMetadata(String idSesion, String idItem, String handleItem)
    {
        String tipo
        Item item
        RestBuilder rest = new RestBuilder()
        JSONElement json
        Collection temas

        json = rest.get(HOST + "/rest/items/" + idItem + "/metadata") { headers["Cookie"] = "JSESSIONID=" + idSesion + ""; accept("application/json") contentType("application/json") }.json
        tipo = json.find{it.key == 'dc.type'}.value
        if(tipo == TipoItem.EXAMEN.valor)
        {
            item = new Examen()
            item.fecha = json.find{it.key == 'dc.date.issued'}.value
            item.periodo = json.find{it.key == 'dc.periodo'}.value
            item.parcial = json.find{it.key == 'dc.parcial'}.value
            item.profesor = json.find{it.key == 'dc.profesor'}.value
        }
        else if(tipo == TipoItem.PROBLEMA.valor)
        {
            item = new Problema()
            temas = json.findAll{it.key == 'dc.subject'}
            item.temas = new String[temas.size()]
            temas.eachWithIndex{it, index -> item.temas[index] = it.value}
            item.dificultad = json.find{it.key == 'dc.dificultad'}.value
        }
        else if(tipo == TipoItem.RECURSO.valor)
        {
            item = new Recurso()
            item.formato = json.find{it.key == 'dc.format'}.value
            item.descripcion = json.find{it.key == 'dc.description.abstract'}.value
            item.url = json.find{it.key == 'dc.description.uri'}.value
        }
        item.nombre = json.find{it.key == 'dc.title'}.value
        item.curso = json.find{it.key == 'dc.curso'}.value
        item.id = idItem
        item.handle = handleItem

        return item
    }

    /**
     * Retorna la información de bitstreams de un ítem.
     * @param  idSesion
     *         Identificador de la sesión abierta.
     * @param  idItem
     *         Identificador en DSpace del ítem a consultar.
     * @param  handleItem
     *         Handle en DSpace del ítem a consultar.
     * @return
     *         Arreglo de archivos (sólo información descriptiva sin binarios) del ítem.
     */
    Archivo[] getItemBitstreams(String idSesion, String idItem, String handleItem)
    {
        int numArchivos
        Archivo archivo
        Archivo[] archivos = []
        RestBuilder rest = new RestBuilder()
        JSONElement json

        json = rest.get(HOST + "/rest/items/" + idItem + "/bitstreams") { headers["Cookie"] = "JSESSIONID=" + idSesion + ""; accept("application/json") contentType("application/json") }.json
        numArchivos = json.collect.size()
        if(numArchivos > 0)
        {
            archivos = new Archivo[numArchivos]
            json.eachWithIndex { it, index ->
                archivo = new Archivo()
                archivo.id = it.uuid
                archivo.nombre = it.name
                archivo.urlDescarga = HOST + (String) it.retrieveLink
                archivo.urlVisualizacion = HOST + '/xmlui/bitstream/handle/' + handleItem + '/' + archivo.nombre + '?sequence=1&isAllowed=y'
                archivo.formato = it.format
                archivo.descripcion = it.description
                archivo.mimeType = it.mimeType
                archivo.tamBytes = it.sizeBytes
                archivos[index] = archivo
            }
        }

        return archivos
    }

    /**
     * Obtiene el listado de comunidades de DSpace.
     * @param  idSesion
     *         Identificador de la sesión abierta.
     * @return JSON
     */
    JSONElement getComunidades(String idSesion)
    {
        RestBuilder rest = new RestBuilder()
        return rest.get(HOST + "/rest/communities") { headers["Cookie"] = "JSESSIONID=" + idSesion + ""; accept("application/json") }.json
    }

    /**
     * Obtiene el listado de colecciones de DSpace.
     * @param  idSesion
     *         Identificador de la sesión abierta.
     * @return JSON
     */
    JSONElement getColecciones(String idSesion)
    {
        RestBuilder rest = new RestBuilder()
        return rest.get(HOST + "/rest/collections") { headers["Cookie"] = "JSESSIONID=" + idSesion + ""; accept("application/json") }.json
    }

    /**
     * Verifica el estado de una conexión a DSpace, requiere que el login se haya realizado y tener un id de sesión. Cuando el status es 405 es porque su cookie de sesión tiene problemas.
     * @param  idSesion
     *         Identificador de la sesión abierta.
     * @return
     */
    def verifyStatus(String idSesion)
    {
        RestBuilder rest = new RestBuilder()
        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>()
        def resp = rest.get(HOST + "/rest/status") { headers["Cookie"] = "JSESSIONID=" + idSesion + ""; accept("application/json") }
    }

    /**
     * Permite hacer logout de DSpace.
     * @param  idSesion
     *         Identificador de la sesión abierta.
     * @return
     */
    def logout(String idSesion)
    {
        RestBuilder rest = new RestBuilder()
        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>()
        def resp = rest.get(HOST + "/rest/logout") { headers["Cookie"] = "JSESSIONID=" + idSesion + ""; accept("application/json") }
    }
}