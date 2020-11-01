<%-- 
    Document   : admin
    Created on : Sep 22, 2020, 2:56:06 PM
    Author     : Super User
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.io.*" %>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>Admin Strana</title>
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
            <h1>Ovo je admin strana</h1>

            <%

                String str = (String) session.getAttribute("username");

                out.print("Zdravo  " + str);

            %>

            

    </body>   

</html>