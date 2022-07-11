/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import account.BaseRequiredAuthenticationController;
import dal.CourseDBContext;
import dal.GroupDBContext;
import dal.StudentReportDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Account;
import model.Course;
import model.Group;
import model.Student;

/**
 *
 * @author ASUS
 */
public class Report extends BaseRequiredAuthenticationController
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
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDBContext cdb = new CourseDBContext();
        Account acc= (Account) request.getSession().getAttribute("account");
        ArrayList<Course> course;
        if(acc.getInstructorID()>0) course = cdb.list(acc.getInstructorID());
        else course = cdb.list();
        request.setAttribute("course", course);
        int c = 1;
        if (request.getParameter("chooseCourse") != null) {
            c = Integer.parseInt((String) request.getParameter("chooseCourse"));
        }
        GroupDBContext gdb = new GroupDBContext();
        ArrayList<Group> g;
        if(acc.getInstructorID()>0) g = gdb.list(c,acc.getInstructorID());
        else g = gdb.list(c);
        request.setAttribute("group", g);
        request.setAttribute("choosedCourse", c);
        request.getRequestDispatcher("Attendance Report.jsp").forward(request, response);
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account acc= (Account) request.getSession().getAttribute("account");
        CourseDBContext cdb = new CourseDBContext();
        ArrayList<Course> course;
        if(acc.getInstructorID()>0) course = cdb.list(acc.getInstructorID());
        else course = cdb.list();
        request.setAttribute("course", course);
        int c = 1;
        if (request.getParameter("choosedCourse") != null) {
            c = Integer.parseInt((String) request.getParameter("choosedCourse"));
        }
        GroupDBContext gdb = new GroupDBContext();
        ArrayList<Group> group;
        if(acc.getInstructorID()>0) group = gdb.list(c,acc.getInstructorID());
        else group = gdb.list(c);
        request.setAttribute("group", group);
        int g = Integer.parseInt((String) request.getParameter("chooseGroup"));
        StudentReportDBContext sr = new StudentReportDBContext();
        ArrayList<Student> stu = sr.get(g);
        ArrayList<Integer> attendance = new ArrayList<>();
        ArrayList<Integer> attended = new ArrayList<>();
        for (Student student : stu) {
            attendance.add(sr.CountAttend(student.getStudentId(), g));
            attended.add(sr.CountAttended(student.getStudentId(), g));
        }
        request.setAttribute("choosedCourse", c);
        request.setAttribute("choosedGroup", g);
        request.setAttribute("studenlist", stu);
        request.setAttribute("attendance", attendance);
        request.setAttribute("attended", attended);
        request.getRequestDispatcher("Attendance Report.jsp").forward(request, response);
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
