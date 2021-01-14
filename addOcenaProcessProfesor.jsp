<%-- 
    Document   : addOcenaProcessProfesor
    Created on : Sep 24, 2020, 6:15:09 PM
    Author     : Super User
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<%
   
    String oce_oce = request.getParameter("oce_ocena");
    String stdid = request.getParameter("std_id");
    String preid = request.getParameter("pre_id");
    String proid = request.getParameter("pro_id");
    try {

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fakultetzp?autoReconnect=true&useSSL=false", "root", "");
        Statement st = conn.createStatement();
        int i = st.executeUpdate("INSERT INTO fakultetzp.ocena(oce_ocena,std_id,pre_id,pro_id)values('" + oce_oce + "','" + stdid + "','" + preid + "','" + proid + "')");
       
    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>
