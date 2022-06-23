/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ScheduleDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import model.Session;

/**
 *
 * @author ASUS
 */
public class Schedule extends HttpServlet {

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
        String kt = (String) request.getParameter("year");
        int y;
        if (kt == null) {
            y = Calendar.getInstance().get(Calendar.YEAR);
        } else {
            y = Integer.parseInt(kt);
        }
        request.setAttribute("year", String.valueOf(y));
        Calendar ist = Calendar.getInstance();
        int j = ist.get(Calendar.DAY_OF_YEAR);
        Date day = Date.valueOf(LocalDate.ofYearDay(y, j));
        if (Calendar.getInstance().get(Calendar.YEAR) > y) {
            while (Calendar.getInstance().get(Calendar.YEAR) > y) {
                ist.add(Calendar.DATE, -365);
            }
        } else {
            while (Calendar.getInstance().get(Calendar.YEAR) < y) {
                ist.add(Calendar.DATE, 365);
            }
        }
        int doy = ist.get(Calendar.DAY_OF_YEAR);
        ist.add(Calendar.DATE, -doy);
        int dow = ist.get(Calendar.DAY_OF_WEEK);
        ist.add(Calendar.DATE, -dow +7);
        String kt1 = (String) request.getParameter("week");
        int w;
        if (kt1 == null) {
            w = Calendar.getInstance().get(Calendar.WEEK_OF_YEAR);
        } else {
            w = Integer.parseInt(kt1);
        }
        ist.add(Calendar.DATE, w*7);
        j = ist.get(Calendar.DAY_OF_YEAR);
        Date end = Date.valueOf(LocalDate.ofYearDay(y, j));

        ist.add(Calendar.DATE, -6);
        j = ist.get(Calendar.DAY_OF_YEAR);
        Date start = Date.valueOf(LocalDate.ofYearDay(y, j));
        ScheduleDBContext sch = new ScheduleDBContext();
        ArrayList<Session> list = sch.list(start, end);
        request.setAttribute("scheduleList", list);

        request.getRequestDispatcher("View Schedule.jsp").forward(request, response);
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
