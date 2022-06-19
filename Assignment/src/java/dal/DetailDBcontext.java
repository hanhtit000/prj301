/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Group;
import model.Instructor;
import model.Session;

public class DetailDBcontext extends DBContext<Session> {

    @Override
    public ArrayList<Session> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Session> get(int x) {
        ArrayList<Session> table = new ArrayList<>();
        try {
            String sql = "with t as (SELECT s.SessionID, s.SessionNumber, s.GroupID, g.GroupName, g.CourseID, s.InstructorID, s.Slot, s.RoomName\n"
                    + "FROM [dbo].[Session] s, [dbo].[Group] g\n"
                    + "where s.GroupId=g.GroupId)\n"
                    + "select * from t, [dbo].[Course] as c, [dbo].[Instructor] as i\n"
                    + "where t.CourseID=c.CourseID and t.InstructorID=i.InstructorID and t.SessionID =?";
//                    + "and t.DateFrom <= ? and t.DateTo >= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, x);
//            stm.setDate(1, Date.valueOf(LocalDate.now().toString()));
//            stm.setDate(2, Date.valueOf(LocalDate.now().toString()));
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session r = new Session();
                r.setSessionId(rs.getInt("SessionID"));
                Group g = new Group();
                r.setSessionNumber(rs.getInt("SessionNumber"));
                g.setGroupId(rs.getInt("GroupID"));
                g.setGroupName(rs.getString("GroupName"));
                Course c = new Course();
                c.setCourseId(rs.getInt("CourseID"));
                c.setCourseName(rs.getString("CourseName"));
                g.setCourseId(c);
                Instructor i = new Instructor();
                i.setInstructorId(rs.getInt("InstructorID"));
                i.setSurName(rs.getString("SurName"));
                i.setMidName(rs.getString("MidName"));
                i.setGivenName(rs.getString("GivenName"));
                r.setInstructorId(i);
                r.setSlot(rs.getInt("Slot"));
                r.setRoomName(rs.getString("RoomName"));
                r.setGroupId(g);
                table.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DetailDBcontext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(DetailDBcontext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return table;
    }

    @Override
    public void insert(ArrayList<Session> entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(ArrayList<Session> entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
