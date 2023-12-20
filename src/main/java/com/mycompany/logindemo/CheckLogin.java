/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.logindemo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author student
 */
public class CheckLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //  取出 使用者表單 帳密  與資料庫比對
        java.sql.Connection con;
        java.sql.Statement stmt;
        java.sql.ResultSet rs;       
        String username, passwd, sql;
        
        username = request.getParameter("username");
        passwd = request.getParameter("passwd");
        sql = "SELECT * FROM user WHERE NAME='" + username + "' AND passwd='" + passwd + "';";
        // 1. 載入資料庫驅動
        try{
            Class.forName("org.mariadb.jdbc.Driver");            
        }catch(Exception e ) {            
        }
        // 2. 建立連線        
        try {
        
            con = DriverManager.getConnection("jdbc:mariadb://127.0.0.1/webdb", "root", "12345");                
            
        // 3. 建立SQL 對應的查詢物件
           stmt = con.createStatement();
        // 4. 執行查詢後取得結果
          
           rs = stmt.executeQuery(sql);
           
        // 6. 結束
        
        }catch(SQLException e) {
                out.print("連線失敗:" + e.getMessage() + "<br>");
        }
        //
        try (PrintWriter out = response.getWriter()) {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

}
