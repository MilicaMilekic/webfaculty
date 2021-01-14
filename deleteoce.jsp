<%-- 
    Document   : deleteoce
    Created on : Sep 28, 2020, 12:27:01 PM
    Author     : Super User
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String oceid = request.getParameter("oce_id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fakultetzp?autoReconnect=true&useSSL=false", "root", "");
        Statement st = conn.createStatement();
        int i = st.executeUpdate("DELETE FROM fakultetzp.ocena WHERE oce_id=" + oceid);
        out.println("Uspesno ste izbrisali ocenu!");
    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>

