<%@ page import="java.util.Iterator"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.List"%>
<%@ page import="com.cinema.dto.Film"%>
<%@ page errorPage="error/error-page.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.cinema.bd.FilmBDService"%>

<%--  Aquesta pàgina mostrarà la llista de pel·lícules des de la base de dades --%>
<%
	FilmBDService serveiFilm = new FilmBDService();
	List<Film> llistaFilms = serveiFilm.getListFims();
	request.setAttribute("llistaFilms", llistaFilms);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<c:forEach var="film" varStatus="loop" items="${llistaFilms}">
	<div>
		<c:out value="${film.id}" />
		-
		<c:out value="${film.nom}" />
	</div>
</c:forEach>

<%@include file="footer.jsp"%>


