<%@page import="java.time.LocalDate" %>
<%@page import="com.cinema.dto.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%
    String nomWeb = "CinemaDor";
    int anysAniversari = 30;
    LocalDate dataFundacio = LocalDate.of(1986, 3, 11);
    //Coordenades localització
    float x = 167.23f;
    float y = 168.23f;


    User usuari = (User) session.getAttribute("user");
    request.setAttribute("usuari", usuari);


%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cinema</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body class="container">

    <h1 class="text-center"><img src="https://www.gifmania.com/Gif-Animados-Peliculas-Cine/Imagenes-Elementos-Cine/Cines/Cine-Antiguo-82068.gif" alt="" style="width:7vw;height:5vw"> <a class="text-dark text-decoration-none" href="llista_films.jsp"><%=nomWeb %></a> <img src="https://www.gifmania.com/Gif-Animados-Peliculas-Cine/Imagenes-Elementos-Cine/Cines/Cine-Antiguo-82068.gif" alt="" style="width:7vw;height:5vw"></h1>
    <c:set var="avui" value="<%=new java.util.Date()%>"/>
    <p class="bg-light text-center">Avui: <c:out value="${avui}"/></p>

    <c:if test="${usuari==null}">
        <div style="text-align:right">
            <a class="btn btn-success" href="login/user-login.jsp">LOG in</a>
        </div>
    </c:if>
    <c:if test="${usuari!=null}">
        <div style="text-align:right">
            <c:out value="${usuari.nom}"/>
        </div>
    </c:if>
