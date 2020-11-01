<%-- 
    Document   : deletepro
    Created on : Sep 25, 2020, 2:05:27 PM
    Author     : Super User
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String proid = request.getParameter("pro_id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fakultetzp?autoReconnect=true&useSSL=false", "root", "milicamilekic");
        Statement st = conn.createStatement();
        int i = st.executeUpdate("DELETE FROM fakultetzp.profesor WHERE pro_id=" + proid);
        out.println("Uspesno ste izbrisali profesora!");
    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>