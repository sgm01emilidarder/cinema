<%@ page import="java.util.Iterator"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.cinema.dto.Film"%>
<%@ page errorPage="error/error-page.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.cinema.service.FilmService" %>

<%-- 
Aquesta pàgina mostrarà la llista de pel·lícules i filtrarà per gènere

--%>

<%-- Bloc de declaracions de variables i mètodes --%>
<%!
    
    private enum genere { FICCIO, AVENTURES, TERROR, DIBUIXOS };
    private static final int NUM_FILM = 5;// màxim de pel·lícules a mostrar

    // Mètode per filtrar per genere
    private Map<Integer, Film> getFilmsPerGenere(String genere, Map<Integer, Film> llista) {
        if (genere==null){
            return llista; //Tornam totes els films.
        }else{
        	Map <Integer, Film> films = new HashMap <Integer, Film> ();
        	
            for (Map.Entry<Integer, Film> entry : llista.entrySet()) {
                if (genere.equals(entry.getValue().getGenere()))
                    films.put(entry.getKey(), entry.getValue());            
            }
            return films;
        }
    }


/*
Alternativas d'iterator
//expressió lamda: datos.forEach((k,v) -> System.out.println("Key: " + k + ": Value: " + v));

        for (Key k : llistaFilm.keySet()) {
            films.put(k, playerCooldowns.get(k) - 20);
        }

        Iterator it = llistaFilm.keySet().iterator();
        while(it.hasNext()){
          Integer key = (Integer)it.next();
          if (genere.equals(llistaFilm.get(key).getGenere()))
                films.put(key, llistaFilm.get(key));
        }
*/

%>
<%
	FilmService serveiFilm = new FilmService();
	HashMap<Integer, Film> llistaFilms = serveiFilm.getLlistaFilms();
	       
    String pGenere = request.getParameter("genere");
    System.out.println("genere:"+pGenere);
    Map<Integer, Film> llistaFilmsFiltrada= getFilmsPerGenere(pGenere, llistaFilms);
    request.setAttribute("llistaFilmsFiltrada", llistaFilmsFiltrada);  
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
    <%-- Enllaços cagegories/genere--%>
    <nav class="nav nav-pills flex-column flex-sm-row my-3">
         <a class="flex-sm-fill text-sm-center nav-link active mx-2" href="llista_films.jsp?genere=FICCIO">Ciència ficció</a>
         <a class="flex-sm-fill text-sm-center nav-link active mx-2" href="llista_films.jsp?genere=AVENTURES">Aventures</a>
         <a class="flex-sm-fill text-sm-center nav-link active mx-2" href="llista_films.jsp?genere=TERROR">Terror</a>
         <a class="flex-sm-fill text-sm-center nav-link active mx-2" href="llista_films.jsp?genere=DIBUIXOS">Dibuixos</a>
    </nav>
    
    <%-- Mostrar llista pel·lícules per gènere --%>
    <ul class="list-group">

        
        <%-- Mostrar màxim les pel·lícules de NUM_FILM --%>
        <c:set var="NUM_FILM" value="5" scope="page" />
        <c:forEach var="film" varStatus="loop" items="${llistaFilmsFiltrada}">
            <c:if test = "${loop.index < NUM_FILM}">
            <a class="list-group-item list-group-item-action list-group-item-primary" href="detall_film.jsp?codi=<c:out value="${film.key}"/>">
                    <c:out value="${film.value.nom}"/>
                </a>

            </c:if>
        </c:forEach>
            
    </ul>
<%@include file="footer.jsp" %>