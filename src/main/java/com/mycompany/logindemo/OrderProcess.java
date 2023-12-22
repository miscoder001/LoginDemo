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
import java.util.ArrayList;
import javax.servlet.http.HttpSession;


public class OrderProcess extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // 資料庫的前置作業
        DBConGenerator dbGen = new DBConGenerator();
        Connection con = dbGen.getConnction();
        Statement stmt;
        String sql;
        //買家 的 寄送 與付款資訊
        String recipient = request.getParameter("recipient");
        String address  = request.getParameter("address");
        String payment = request.getParameter("payment");
        String shipping = request.getParameter("shipping");
        // 取出買家的 購物清單
        HttpSession session = request.getSession();  // Servlet 要自行取得 session
        ArrayList<CartItem> cart = (ArrayList) session.getAttribute("cart");       
        String member = (String) session.getAttribute("username");
        if( member == null ) {
            member = "快速出貨會員";
        }
        // Data 新增資料表
        try {
            stmt = con.createStatement();
            for(CartItem ci : cart ) {
                sql = "INSERT INTO webdb.order_item(member,pcode,qty,recipient,adddr,payment) " +
                    "VALUES('" + member + "','"+ ci.getProductCode() + "'," + ci.getQty() + ",'" +
                    recipient + "','" + address + "','" + payment + "');";
                System.out.println("SQL:  " + sql);
                stmt.execute(sql);
            }
            // 清除購物車
            cart.clear();
            
        }catch(SQLException e) {
           // inser into 發生異常
           System.err.print("新增發生錯誤" + e.getMessage());
        }
        // 處理後續作業
          // 1 成功寫入資料表後  清除 購物車
          // 2. 將畫面轉到 另一個負責顯示結果的  JSP 頁面 (將處理結果訊息 傳遞給該頁面 )
        
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
