<%-- 
    Document   : addOcenaProcess
    Created on : Sep 23, 2020, 5:59:08 PM
    Author     : Super User
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
   
    String oce_ocena = request.getParameter("oce_ocena");
    String std_id = request.getParameter("std_id");
    String pre_id = request.getParameter("pre_id");
    String pro_id = request.getParameter("pro_id");
    try {

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fakultetzp?autoReconnect=true&useSSL=false", "root", "milicamilekic");
        Statement st = conn.createStatement();
        int i = st.executeUpdate("INSERT INTO fakultetzp.ocena(oce_ocena,std_id,pre_id,pro_id)values('" + oce_ocena + "','" + std_id + "','" + pre_id + "','" + pro_id + "')");
        out.println("Uspesno ste dodali ocenu!");
    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>