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
                    + "where s.StudentID=a.StudentID and a.SessionID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, x);
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
        try {
            for (int i = 0; i < entity.size(); i++) {
                String sql = "UPDATE [dbo].[Attendance]\n"
                        + "   SET AttendanceStatus = ?\n"
                        + "      ,RecordTime = ?\n"
                        + "      ,Message = ?\n"
                        + " WHERE StudentID=? and SessionID=?";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, entity.get(i).getAttendanceStatus());
                stm.setDate(2, entity.get(i).getRecordTime());
                stm.setString(3, entity.get(i).getMessage());
                stm.setInt(4, entity.get(i).getStudentId().getStudentId());
                stm.setInt(5, entity.get(i).getSessionId());
                stm.executeUpdate();
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
    }
}
