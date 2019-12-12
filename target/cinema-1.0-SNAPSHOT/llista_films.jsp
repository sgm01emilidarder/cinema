<%@ page import="java.util.Iterator"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.cinema.dto.Film"%>
<%@ page errorPage="error/error-page.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.cinema.service.FilmService" %>
<%@ page import="com.cinema.enums.Genere" %>

<%-- 
Aquesta pàgina mostrarà la llista de pel·lícules i filtrarà per gènere

--%>

<%-- Bloc de declaracions de variables i mètodes --%>

<%

	       
    String pGenere = request.getParameter("genere");
    Genere genere = null;
    if (pGenere != null) {
        genere = Genere.valueOf(pGenere);
    }
    System.out.println("genere:"+pGenere);
    FilmService serveiFilm = new FilmService();
    Map<Integer, Film> llistaFilmsFiltrada= serveiFilm.getFilmsPerGenere(genere);
    request.setAttribute("llistaFilmsFiltrada", llistaFilmsFiltrada);
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
    <%-- Enllaços cagegories/genere--%>
    <nav class="nav nav-pills flex-column flex-sm-row my-3">
         <a class="flex-sm-fill text-sm-center nav-link active mx-2" href="llista_films.jsp">Mostrar todas</a>
         <a class="flex-sm-fill text-sm-center nav-link active mx-2" href="llista_films.jsp?genere=FICCIO">Ciència ficció</a>
         <a class="flex-sm-fill text-sm-center nav-link active mx-2" href="llista_films.jsp?genere=AVENTURES">Aventures</a>
         <a class="flex-sm-fill text-sm-center nav-link active mx-2" href="llista_films.jsp?genere=TERROR">Terror</a>
         <a class="flex-sm-fill text-sm-center nav-link active mx-2" href="llista_films.jsp?genere=DIBUIXOS">Dibuixos</a>
        <a class="flex-sm-fill text-sm-center nav-link active mx-2" href="bd_llista_films.jsp">BD</a>
    </nav>
    
    <%-- Mostrar llista pel·lícules per gènere --%>
    <ul class="list-group">

        
        <%-- Mostrar màxim les pel·lícules de NUM_FILM --%>
        <c:set var="NUM_FILM" value="10" scope="page" />
        <c:forEach var="film" varStatus="loop" items="${llistaFilmsFiltrada}">
            <c:if test = "${loop.index < NUM_FILM}">
            <a class="list-group-item list-group-item-action list-group-item-primary" href="detall_film.jsp?codi=<c:out value="${film.key}"/>">
                    <c:out value="${film.value.nom}"/>
                </a>

            </c:if>
        </c:forEach>
            
    </ul>
<%@include file="footer.jsp" %>