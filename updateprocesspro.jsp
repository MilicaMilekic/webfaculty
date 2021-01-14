<%-- 
    Document   : updateprocesspro
    Created on : Sep 24, 2020, 2:59:15 PM
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
    String idd = request.getParameter("pro_id");
    String imee = request.getParameter("pro_ime");
    String prezimee = request.getParameter("pro_prezime");
    String emaill = request.getParameter("pro_email");
    String predmett = request.getParameter("pro_predmet");
    if (idd != null) {
        Connection con = null;
        PreparedStatement ps = null;
        int personID = Integer.parseInt(idd);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, psw);
            String sql = "UPDATE fakultetzp.profesor SET pro_id=?,pro_ime=?,pro_prezime=?,pro_email=?,pro_predmet=? WHERE pro_id=" + idd;
            ps = con.prepareStatement(sql);
            ps.setString(1, idd);
            ps.setString(2, imee);
            ps.setString(3, prezimee);
            ps.setString(4, emaill);
            ps.setString(5, predmett);
            int i = ps.executeUpdate();
            
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>
