/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AttendDBContext;
import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.Date;
import java.time.LocalDate;
import model.Attendance;
import model.Student;
/**
 *
 * @author ASUS
 */
public class AddAttendanceToDB extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TakeAttendance</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TakeAttendance at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int sessionid = Integer.parseInt(request.getParameter("sid"));
        ArrayList<Attendance> att = new ArrayList<>();
        Date ist= Date.valueOf(LocalDate.now());
        int dem=Integer.parseInt(request.getParameter("count"));
        for (int i=1;i<dem;i++) {
            String mess = request.getParameter("mess"+i);
            Attendance tmp = new Attendance();
            Student e = new Student();
            String id = request.getParameter("id"+i);
            String code = request.getParameter("code"+i);
            String sur = request.getParameter("sur"+i);
            String mid = request.getParameter("mid"+i);
            String given = request.getParameter("given"+i);
            e.setStudentId(Integer.parseInt(id));
            e.setStudentCode(code);
            e.setSurName(sur);
            e.setMidName(mid);
            e.setGivenName(given);
            tmp.setStudentId(e);
            tmp.setSessionId(sessionid);
            String cbox = request.getParameter("cbox"+i);
            tmp.setAttendanceStatus(cbox);
            tmp.setMessage(mess);
            tmp.setRecordTime(ist);
            att.add(tmp);
        }
        DBContext<Attendance> attenddbcontext =new AttendDBContext();
        attenddbcontext.insert(att);
        request.getRequestDispatcher("/insert_confirm.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
