<%-- 
    Document   : addStudentProcess
    Created on : Sep 24, 2020, 12:25:40 PM
    Author     : Super User
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String ime = request.getParameter("std_ime");
    String prezime = request.getParameter("std_prezime");
    String email = request.getParameter("std_email");
    String brojIndexa = request.getParameter("std_index");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fakultetzp?autoReconnect=true&useSSL=false", "root", "milicamilekic");
        Statement st = conn.createStatement();

        int i = st.executeUpdate("INSERT INTO fakultetzp.student(std_ime,std_prezime,std_email,std_index)VALUES('" + ime + "','" + prezime + "','" + email + "','" + brojIndexa + "')");
    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>

