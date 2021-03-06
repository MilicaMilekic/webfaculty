<%-- 
    Document   : profesor
    Created on : Sep 22, 2020, 2:57:43 PM
    Author     : Super User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>

<html>

    <head>
        <title>Profesor</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: gray;">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="http://localhost:8080/fakultetZP/profesor.jsp">Pocetna strana</a>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:8080/fakultetZP/ispisStudenata.jsp">Studenti<span class="sr-only">(current)</span></a>
                </li>
            
            <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dodaj
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="http://localhost:8080/fakultetZP/addOcenaProfesor.jsp">Ocenu</a>
                        </div>
            </li>
            </ul>
        </div>
    </nav>

</head>

<body style="background-color:lightgray;"><font color="black" >



    <%

        String str = (String) session.getAttribute("username");

        out.print("Dobrodosao/la " + str);

    %>
    


    
    <%           String id = request.getParameter("id");
        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String database = "fakultetzp?autoReconnect=true&useSSL=false";
        String userid = "root";
        String password = "";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
    %>

    <table class="table table-striped table-dark">
        <thead>
            <tr>
                <td scope="col">ID</td>
                <td scope="col">Ime</td>
                <td scope="col">Prezime</td>
                <td scope="col">Email</td>
                <td scope="col">Predmet</td>
                
                
            </tr>
        </thead>
        <%
            try {
                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                statement = connection.createStatement();
                String sql = "SELECT * FROM fakultetzp.profesor";
                        
                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
        %>
        <tbody>
            <tr>
                <td scope="row"><%=resultSet.getString("pro_id")%></td>
                <td scope="row"><%=resultSet.getString("pro_ime")%></td>
                <td scope="row"><%=resultSet.getString("pro_prezime")%></td>
                <td scope="row"><%=resultSet.getString("pro_email")%></td>
                <td scope="row"><%=resultSet.getString("pro_predmet")%></td>
               
                
            </tr>
        </tbody>
        <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>


    </font>

</body>

</html>
