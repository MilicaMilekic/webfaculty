<%-- 
    Document   : addStudent
    Created on : Sep 22, 2020, 8:13:19 PM
    Author     : Super User
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Dodaj studenta</title>
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
<body style="background-color:lightgray; font: black;">
    <form method="post">
        <table class="table table-striped table-dark">
            <thead>
                <tr>
                    <td scope="col">Ime:</td>
                    <td scope="col">Prezime:</td>
                    <td scope="col">Email:</td>
                    <td scope="col">Broj indeksa:</td>
                    <td scope="col"></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td scope="row"><input type="text" name="std_ime" id="std_ime"></td>
                    <td scope="row"><input type="text" name="std_prezime" id="std_prezime"></td>
                    <td scope="row"><input type="text" name="std_email" id="std_email"></td>
                    <td scope="row"><input type="text" name="std_index" id="std_index"></td>
                    <td scope="row" value="Dodaj" id="dodajS"><button type="button" class="btn btn-outline-primary">DODAJ</button></td>
                </tr>
            </tbody>
        </table>
    </form>
    <script>
        $(document).ready(function () {
            $("#dodajS").click(function () {
                alert("succeess");
                $.ajax({
                    url: "addStudentProcess.jsp",
                    type: "post",
                    data: {
                        std_ime: $('#std_ime').val(),
                        std_prezime: $('#std_prezime').val(),
                        std_email: $('#std_email').val(),
                        std_index: $('#std_index').val(),
                        success: function (data) {
                            alert(data);
                        }
                    }
                });
            });
        });
    </script>

</body>
</html>