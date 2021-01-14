<%-- 
    Document   : updateprocessoce
    Created on : Sep 24, 2020, 6:00:19 PM
    Author     : Super User
--%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" 
        pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>

<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/fakultetzp?autoReconnect=true&useSSL=false";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
    String ido = request.getParameter("oce_id");
    String ocena = request.getParameter("oce_ocena");
    String ids = request.getParameter("std_id");
    String idp = request.getParameter("pre_id");
    String idpr = request.getParameter("pro_id");
    if (ido != null) {
        Connection con = null;
        PreparedStatement ps = null;
        int personID = Integer.parseInt(ido);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, psw);
            String sql = "UPDATE fakultetzp.ocena SET oce_id=?,oce_ocena=?,std_id=?,pre_id=?,pro_id=? WHERE oce_id=" + ido;
            ps = con.prepareStatement(sql);
            ps.setString(1, ido);
            ps.setString(2, ocena);
            ps.setString(3, ids);
            ps.setString(4, idp);
            ps.setString(5, idpr);
            int i = ps.executeUpdate();
            
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>
