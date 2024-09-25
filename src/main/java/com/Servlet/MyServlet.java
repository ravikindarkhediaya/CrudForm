package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MyServlet extends HttpServlet {

    public Connection con;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

//            Connection 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:9595/extra", "root", "root");
                System.out.println("Connection Ok...");
            } catch (Exception e) {
                e.printStackTrace();
            }

//            Get Input Text
            String email = request.getParameter("email");
            String password = request.getParameter("password");

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

//    INsert data
    public void insertData(String e, String p) throws SQLException {

        PreparedStatement ps = con.prepareStatement("insert into login (email, password) values (?,?)");
        ps.setString(1, e);
        ps.setString(2, p);
        int a = ps.executeUpdate();
        if(a>0){
            System.out.println("Data Inserted...");
        }else{
            System.out.println("Data Insert Failed...");
        }
    }
    
//    Delete Data
    public void deleteData(String e) throws SQLException {

        PreparedStatement ps = con.prepareStatement("delete from operation where email=?");
        ps.setString(1, e);
        int a = ps.executeUpdate();
        if(a>0){
            System.out.println("Data Deleted...");
        }else{
            System.out.println("Data Delete7 Failed...");
        }
    }
}
