<%-- 
    Document   : addProfesorProcess
    Created on : Sep 24, 2020, 1:03:11 PM
    Author     : Super User
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String imee = request.getParameter("pro_ime");
    String prezimee = request.getParameter("pro_prezime");
    String emaill = request.getParameter("pro_email");
    String predmett = request.getParameter("pro_predmet");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fakultetzp?autoReconnect=true&useSSL=false", "root", "milicamilekic");
        Statement st = conn.createStatement();

        int i = st.executeUpdate("INSERT INTO fakultetzp.profesor(pro_ime,pro_prezime,pro_email,pro_predmet)VALUES('" + imee + "','" + prezimee + "','" + emaill + "','" + predmett + "')");
    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>