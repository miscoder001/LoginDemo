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
import java.sql.*;
import javax.servlet.RequestDispatcher;

public class CheckLogin2 extends HttpServlet {

    Connection dbcon;
    DBConGenerator dbGen ;
    Statement stmt;
    ResultSet rs;
    String username, passwd, sql;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)      throws ServletException, IOException {        
        response.setContentType("text/html;charset=UTF-8");
        
        dbGen = new DBConGenerator();
        dbcon = dbGen.getConnction();
        //
        username = request.getParameter("username");
        passwd = request.getParameter("passwd");
        sql = "SELECT * FROM user WHERE NAME='" + username + "' AND passwd='" + passwd + "';";
        String message = "這是 LoginCheck2給的資料";
        // String message = "hello from CheckLogin2";
        try {
            stmt = dbcon.createStatement();
            rs = stmt.executeQuery(sql);
            if( rs.next() ) {
                // 在程式內 發送 request 給其他頁面   request 派發
                System.out.println(" 編碼後內容: " + java.net.URLEncoder.encode(message , "UTF-8"));                
                RequestDispatcher disp= request.getRequestDispatcher("paramPass.jsp?msg="+ java.net.URLEncoder.encode(message , "UTF-8"));
                disp.forward(request, response);
                // disp.include(request, response);
            } else {
                // 透過 request 夾帶資料送交給下一個頁面 進行處理
                System.out.println("透過 request 夾參數 setAttribute");
                request.setAttribute("errmsg", "請確認您的帳號密碼正確 或請洽本站管理者: admin@abc.com.tw");
                request.setAttribute("msg2", "或請於上班時間聯絡 04-3377123 分機 123");
                request.getRequestDispatcher("D.jsp").forward(request, response);
                //RequestDispatcher disp= request.getRequestDispatcher("D.jsp");
                //disp.include(request, response);
            }
        } catch( Exception e) {
            
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
