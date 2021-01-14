<%-- 
    Document   : updateprocessstd
    Created on : Sep 23, 2020, 1:32:53 PM
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
    String id = request.getParameter("std_id");
    String ime = request.getParameter("std_ime");
    String prezime = request.getParameter("std_prezime");
    String email = request.getParameter("std_email");
    String indeks = request.getParameter("std_index");
    if (id != null) {
        Connection con = null;
        PreparedStatement ps = null;
        int personID = Integer.parseInt(id);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, psw);
            String sql = "UPDATE fakultetzp.student SET std_id=?,std_ime=?,std_prezime=?,std_email=?,std_index=? WHERE std_id=" + id;
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, ime);
            ps.setString(3, prezime);
            ps.setString(4, email);
            ps.setString(5, indeks);
            int i = ps.executeUpdate();
            
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>
