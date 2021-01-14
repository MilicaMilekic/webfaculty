<%-- 
    Document   : adminStudent
    Created on : Sep 24, 2020, 1:58:54 PM
    Author     : Super User
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>Studenti</title>
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
<body style="background-color:lightgray; text-align: center; font: black;">
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
        <tr>
            <td>ID</td>
            <td>Ime</td>
            <td>Prezime</td>
            <td>Email</td>
            <td>Broj indeksa</td>
            <td></td>
            <td></td>
        </tr>
        <%
            try {
                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                statement = connection.createStatement();
                String sql = "SELECT * FROM fakultetzp.student";
                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
        %>
        <tr>
            <td><%=resultSet.getString("std_id")%></td>
            <td><%=resultSet.getString("std_ime")%></td>
            <td><%=resultSet.getString("std_prezime")%></td>
            <td><%=resultSet.getString("std_email")%></td>
            <td><%=resultSet.getString("std_index")%></td>
            <td><a href="updatestd.jsp?id=<%=resultSet.getString("std_id")%>"><button type="button" class="btn btn-outline-primary">AZURIRAJ</button></a></td>
            <td><button type="button" id="<%=resultSet.getString("std_id")%>" class="btn btn-outline-primary delete">IZBRISI</button></td>
        </tr>
        <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <script>
        $(document).ready(function () {
            $(".delete").click(function () {
                var id = +this.id;
                $.ajax({
                    url: "deletestd.jsp",
                    type: "post",
                    data: {
                        std_id: id
                    },
                    success: function (data) {
                        alert(data);
                        location.reload();
                    }
                });
            });
        });
    </script>
</body>
</html>
