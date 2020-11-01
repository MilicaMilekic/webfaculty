<%-- 
    Document   : checklogin
    Created on : Sep 22, 2020, 2:22:13 PM
    Author     : Super User
--%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %> <b>
    <%
         String name = request.getParameter("kor_ime");
         String pass = request.getParameter("kor_sifra");
         
         try{
             Class.forName("com.mysql.jdbc.Driver");
             String url = "jdbc:mysql://" + "localhost:3306" + "/" + "fakultetzp?autoReconnect=true&useSSL=false";
             Connection conn = DriverManager.getConnection(url, "root", "milicamilekic");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM fakultetzp.korisnik");
             ResultSetMetaData meta = rs.getMetaData();
             
             int x = 0;
             
             while(rs.next()) {
                 
                 if( rs.getString("kor_ime").equals(name) && rs.getString("kor_sifra").equals(pass)) {
                     
                     String stp = rs.getString("kor_tip");
                     
                     if(stp.equals("admin")) {
                         
                         x = 1;
                         
                         break;
                         
                     } else if(stp.equals("student")) {
                         
                         x = 2;
                         
                         break;
                         
                     } else if(stp.equals("profesor")) {
                         
                         x = 3;
                         
                         break;
                     }
                     
                     
                 }
             }
             
             if (x == 1) {
                 
                 response.sendRedirect("admin.jsp");
                 
             } else if (x == 2) {
                 
                 response.sendRedirect("student.jsp");
                 
             } else if (x == 3) {
                 
                 response.sendRedirect("profesor.jsp");
                 
             } else {
                 
                 out.println("Pogresno ste ukucali ime ili lozinku! <br> Molimo Vas,pokusajte ponovo.");
             }
             
           
    
    %>
    
    <jsp:include page="index.html" />
    
    <%
            } catch (Exception e) {

                 out.println(e);

            }   
      
            session.setAttribute("username", name);   
    
    
    %>