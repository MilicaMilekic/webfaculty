<%-- 
    Document   : deletestd
    Created on : Sep 28, 2020, 12:16:23 PM
    Author     : Super User
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String stdid = request.getParameter("std_id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fakultetzp?autoReconnect=true&useSSL=false", "root", "milicamilekic");
        Statement st = conn.createStatement();
        int i = st.executeUpdate("DELETE FROM fakultetzp.student WHERE std_id=" + stdid);
        out.println("Uspesno ste izbrisali studenta!");
    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>
