/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;
import model.Attendance;

public class StudentReportDBContext extends DBContext<Student> {

    public int CountAttend(int x, int y) {
        int kq = 0;
        try {
            String sql = "SELECT COUNT ([AttendanceStatus])\n"
                    + "FROM [Assignment].[dbo].[Attendance] as a, [Assignment].[dbo].[Session] as s\n"
                    + "where a.StudentID=? and s.SessionID=a.SessionID and s.GroupID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, x);
            stm.setInt(2, y);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                kq = rs.getInt("Attend");
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return kq;
    }

    public int CountAttended(int x, int y) {
        int kq = 0;
        try {
            String sql = "SELECT COUNT ([AttendanceStatus])\n"
                    + "FROM [Assignment].[dbo].[Attendance] as a, [Assignment].[dbo].[Session] as s\n"
                    + "where a.StudentID=? and s.SessionID=a.SessionID and s.GroupID=? and Attendance='Attended'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, x);
            stm.setInt(2, y);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                kq = rs.getInt("Attend");
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return kq;
    }

    @Override
    public ArrayList<Student> get(int x) {
        ArrayList<Student> table = new ArrayList<>();
        try {
            String sql = "SELECT stu.[StudentID] ,stu.[StudentCode], stu.[SurName], stu.[MidName], stu.[GivenName]\n"
                    + "FROM [Assignment].[dbo].[Student] as stu, [Assignment].[dbo].[Enroll] as e\n"
                    + "where stu.StudentID=e.StudentID and e.GroupID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, x);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student r = new Student();
                r.setStudentId(rs.getInt("StudentID"));
                r.setStudentCode(rs.getString("StudentCode"));
                r.setSurName(rs.getString("SurName"));
                r.setMidName(rs.getString("MidName"));
                r.setGivenName(rs.getString("GivenName"));
                table.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentReportDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return table;
    }

    @Override
    public void delete(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(ArrayList<Student> entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(ArrayList<Student> entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
