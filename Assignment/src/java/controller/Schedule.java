/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import account.BaseRequiredAuthenticationController;
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
public class Schedule extends BaseRequiredAuthenticationController
{

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
        String kt1 = (String) request.getParameter("choosedyear");
        int y = 0;
        if (kt == null && kt1 == null) {
            y = Calendar.getInstance().get(Calendar.YEAR);
        }
        if (kt != null && kt1 == null) {
            y = Integer.parseInt(kt);
        }
        if (kt == null && kt1 != null) {
            y = Integer.parseInt(kt1);
        }
        request.setAttribute("year", String.valueOf(y));
        Calendar ist = Calendar.getInstance();
        int j = ist.get(Calendar.DAY_OF_YEAR);
        Date day = Date.valueOf(LocalDate.ofYearDay(y, j));
        int currentyear = Calendar.getInstance().get(Calendar.YEAR);
        if (currentyear > y) {
            while (currentyear > y) {
                ist.add(Calendar.DATE, -365);
                currentyear--;
            }
        } else {
            while (currentyear < y) {
                ist.add(Calendar.DATE, 365);
                currentyear++;
            }
        }
        int doy = ist.get(Calendar.DAY_OF_YEAR);
        ist.add(Calendar.DATE, -doy);
        int dow = ist.get(Calendar.DAY_OF_WEEK);
        ist.add(Calendar.DATE, -dow + 7);
        String kt2 = (String) request.getParameter("week");
        int w;
        if (kt2 == null) {
            w = Calendar.getInstance().get(Calendar.WEEK_OF_YEAR) - 1;
        } else {
            w = Integer.parseInt(kt2);
        }
        ist.add(Calendar.DATE, w * 7);
        ist.add(Calendar.DATE, -6);
        j = ist.get(Calendar.DAY_OF_YEAR);
        Date start = Date.valueOf(LocalDate.ofYearDay(y, j));
        ist.add(Calendar.DATE, +6);
        int j1 = ist.get(Calendar.DAY_OF_YEAR);
        Date end = null;
        if(j1<j) end= Date.valueOf(LocalDate.ofYearDay(y+1, j1));
        else end= Date.valueOf(LocalDate.ofYearDay(y, j1));
        ScheduleDBContext sch = new ScheduleDBContext();
        ArrayList<Session> list = sch.list(start, end);
        request.setAttribute("scheduleList", list);
        request.getRequestDispatcher("View Schedule.jsp").forward(request, response);
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

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}
