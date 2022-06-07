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
import model.Attendance;
import model.Student;

/**
 *
 * @author ASUS
 */
public class UpdateDBContext extends DBContext<Attendance> {

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attendance> get(int x) {
        ArrayList<Attendance> table = new ArrayList<>();
        try {
            String sql = "SELECT a.StudentID, a.SessionID, a.AttendanceStatus, a.RecordTime, a.Message, s.StudentCode, s.SurName, s.MidName, s.GivenName\n"
                    + "FROM [dbo].[Attendance] as a, [dbo].[Student] as s\n"
                    + "where s.StudentID=a.StudentID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance r = new Attendance();
                Student s = new Student();
                s.setStudentId(rs.getInt("StudentID"));
                s.setStudentCode(rs.getString("StudentCode"));
                s.setSurName(rs.getString("SurName"));
                s.setMidName(rs.getString("MidName"));
                s.setGivenName(rs.getString("GivenName"));
                r.setStudentId(s);
                r.setSessionId(rs.getInt("SessionID"));
                r.setRecordTime(rs.getDate("RecordTime"));
                r.setAttendanceStatus(rs.getString("AttendanceStatus"));
                r.setMessage(rs.getString("Message"));
                table.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return table;
    }

    @Override
    public void delete(Attendance entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(ArrayList<Attendance> entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(ArrayList<Attendance> entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
