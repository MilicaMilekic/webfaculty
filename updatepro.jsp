<%-- 
    Document   : updatepro
    Created on : Sep 24, 2020, 2:51:47 PM
    Author     : Super User
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String id = request.getParameter("id");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "fakultetzp?autoReconnect=true&useSSL=false";
    String userid = "root";
    String password = "milicamilekic";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        String sql = "SELECT * FROM fakultetzp.profesor WHERE pro_id=" + id;
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AZURIRANJE</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <nav class="navbar navbar-expand-lg navbar-dark justify-content-between" style="background-color: gray;">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="http://localhost:8080/fakultetZP/admin.jsp">Pocetna strana</a>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/fakultetZP/adminProfesor.jsp">Profesori<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/fakultetZP/adminStudent.jsp">Studenti<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/fakultetZP/adminOcena.jsp">Ocene<span class="sr-only">(current)</span></a>
                </li>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Funkcije
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="http://localhost:8080/fakultetZP/addStudent.jsp">Dodaj studenta</a>
                        <a class="dropdown-item" href="http://localhost:8080/fakultetZP/addProfesor.jsp">Dodaj profesora</a>
                        <a class="dropdown-item" href="http://localhost:8080/fakultetZP/addOcena.jsp">Dodaj ocenu</a>
                    </div>
                </li>

            </ul>
        </div>
    </nav>

</head>
<body style="background-color:lightgray; font: black">

    <form method="post">
        <table class="table table-striped table-dark">
            <thead>
            <td scope="col">ID</td>
            <td scope="col">Ime</td>
            <td scope="col">Prezime</td>
            <td scope="col">Email</td>
            <td scope="col">Predmet</td>
            <td scope="col"></td>
            </thead>
            <tbody>
            <td scope="row"><input type="hidden" name="pro_id" id="pro_id" value="<%=resultSet.getString("pro_id")%>"></td>
            <td scope="row"><input type="text" name="pro_ime" id="pro_ime" value="<%=resultSet.getString("pro_ime")%>"></td>
            <td scope="row"><input type="text" name="pro_prezime" id="pro_prezime" value="<%=resultSet.getString("pro_prezime")%>"></td>
            <td scope="row"><input type="email" name="pro_email" id="pro_email" value="<%=resultSet.getString("pro_email")%>"></td>
            <td scope="row"><input type="text" name="pro_predmet" id="pro_predmet" value="<%=resultSet.getString("pro_predmet")%>"></td>
            <td scope="row" name="azurirajp" id="azurirajp" value="AZURIRAJ"><button type="button" class="btn btn-outline-primary">AZURIRAJ</button></td>
            
            </tbody>


        </table>
    </form>
    <script>
        $(document).ready(function () {
            $("#azurirajp").click(function () {
                alert("succeess");
                $.ajax({
                    url: "updateprocesspro.jsp",
                    type: "post",
                    data: {
                        pro_id: $('#pro_id').val(),
                        pro_ime: $('#pro_ime').val(),
                        pro_prezime: $('#pro_prezime').val(),
                        pro_email: $('#pro_email').val(),
                        pro_predmet: $('#pro_predmet').val(),
                        success: function (data) {
                            alert(data);
                        }
                    }
                });
            });
        });
    </script>
    <%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>