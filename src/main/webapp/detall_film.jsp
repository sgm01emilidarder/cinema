<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.cinema.dto.Film" %>
<%@ page errorPage="error/error-page.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="com.cinema.service.FilmService" %>
<%
    FilmService serveiFilm = new FilmService();
    HashMap<Integer, Film> llistaFilms = serveiFilm.getLlistaFilms();

    // Recuperam el codi de la pel·lícula
    Integer codiFilm = Integer.parseInt(request.getParameter("codi"));
    System.out.println("Codi film:" + codiFilm);
    FilmService film = new FilmService();
    System.out.println(film.getFilm(codiFilm).toString());

    //Comprovam si es troba a la 
    boolean trobada = false;
    if (llistaFilms.containsKey(codiFilm)) {
        // Recuperam els objecte pel·lícula amb totes les dades
        Film pelicula = llistaFilms.get(codiFilm);
        // Necessari per ser processat per JSLT
        request.setAttribute("pelicula", pelicula);
        trobada = true;
    }

    request.setAttribute("exist", trobada);

%>
<%-- capçalera --%>
<jsp:include page="header.jsp"/>
<c:if test="${exist}">
    <%-- Presentació de les dades de la pel·lícula --%>

    <div class="d-flex justify-content-center">
        <div class="card text-center" style="width: 20vw;">
            <img src="<c:out value="${pelicula.caratula}"/>" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><c:out value="${pelicula.nom}"/></h5>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Sinopsis : <c:out value="${pelicula.sinopsis}"/></li>
                <li class="list-group-item">Genere : <c:out value="${pelicula.genere}"/></li>
                <li class="list-group-item">Estreno : <c:out value="${pelicula.estreno}"/></li>

                    <%-- Transformació de LocaleData a Date i després al format català --%>
                <fmt:parseDate value="${pelicula.dataEstreno}" pattern="yyyy-MM-dd" var="dataEstrenoParse" type="date"/>
                <fmt:formatDate value="${dataEstrenoParse}" var="data_estreno" pattern="dd-MM-yyyy"/>

                    <%-- Missatge segons si és pel·licula d'estrena --%>
                <c:if test="${pelicula.estreno}">
                <li class="list-group-item">Data estrena: <c:out value="${data_estreno==null ?'Proximament':data_estreno}"/></li>
                    </c:if>

                        <%-- Missatge segons l'edat recomanada --%>
                    <c:choose>
                    <c:when test="${pelicula.edatRec eq 18}">
                        <c:out value="${'<li class=\"list-group-item\">Edat recomanora a partir de 18</li>'}"
                               escapeXml="false"/>
                        <c:out value="${'<li class=\"list-group-item\">Conté contigut que pot especialment sensible</li>'}"
                               escapeXml="false"/>
                    </c:when>
                    <c:when test="${pelicula.edatRec eq 16}">
                        <c:out value="${'<li class=\"list-group-item\">Edat recomanora a partir de 16</li>'}"
                               escapeXml="false"/>
                        <c:out value="${'<li class=\"list-group-item\">Pot contenir escenes i vocabulari violent</li>'}"
                               escapeXml="false"/>
                    </c:when>
                    <c:otherwise>
                        <c:out value="${'<li class=\"list-group-item\">Tots els públicos</li>'}"
                               escapeXml="false"/>
                        <c:out value="${'<li class=\"list-group-item\">Divertida per tota la família</li>'}"
                               escapeXml="false"/>
                    </c:otherwise>
                    </c:choose>

                        <%-- Es mostra horari del cinema si no hi es d'estreno o si la data d'avui és igual que l'actual --%>
                        <fmt:formatDate value="${now}" var="avui" pattern="dd-MM-yyyy"/>
                    <c:if test="${!pelicula.estreno || (data_estreno eq avui)}">


                    <c:forEach var="hora" varStatus="loop" items="${pelicula.horari}">
                        <h5 class="card-title mt-1">Sesión <c:out value="${hora.key}"/></h5>
                        <li class="list-group-item">
                            <p>Hora Inicio : <c:out value="${hora.value.horaInici}"/></p>
                            <p>Hora Fin : <c:out value="${hora.value.horaFin}"/></p>
                        </li>
<%--                         Dibuix de n ","--%>
<%--                         <c:if test = "${loop.index < ((pelicula.horari)-1)}">,</c:if>--%>
                    </c:forEach>

                </c:if>


            </ul>
        </div>
    </div>

</c:if>

<%-- Missatge d'avís controlat si no s'ha de trobat cap pel·licula amb el codi especificat --%>
<c:if test="${!exist}">
    <jsp:forward page="codi_incorrecte.jsp"/>
</c:if>
<%-- Inclou el resultat de la URL --%>
<jsp:include page="footer.jsp"/>
                   

