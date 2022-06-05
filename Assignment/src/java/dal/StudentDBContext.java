/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;
import model.Student;

public class StudentDBContext extends DBContext<Student> {

    @Override
    public ArrayList<Student> get(int x) {
        ArrayList<Student> table = new ArrayList<>();
        try {
            String sql = "With t as(SELECT s.SessionID, g.GroupID\n" +
            "FROM [Assignment].[dbo].[Group] as g, [Assignment].[dbo].[Session] as s\n" +
            "where s.GroupID=g.GroupID and s.SessionID=?)\n" +
            "Select distinct stu.StudentID, stu.StudentCode, stu.SurName, stu.MidName, stu.GivenName\n" +
            "from [Assignment].[dbo].[Student] as stu, [Assignment].[dbo].[Enroll] as e, t\n" +
            "where stu.StudentID=e.StudentID and t.GroupID=e.GroupID\n" +
            "order by stu.StudentID asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, x); 
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Student r = new Student();
                r.setStudentId(rs.getInt("StudentID"));
                r.setStudentCode(rs.getString("StudentCode"));
                r.setSurName(rs.getString("SurName"));
                r.setMidName(rs.getString("MidName"));
                r.setGivenName(rs.getString("GivenName"));
                table.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return table;
    }



    @Override
    public void insert(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
