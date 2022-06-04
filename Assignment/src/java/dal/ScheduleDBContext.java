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
import model.Session;

public class ScheduleDBContext extends DBContext<Session> {

    @Override
    public ArrayList<Session> list() {
        ArrayList<Session> table = new ArrayList<>();
        try {
            String sql = "with t as (SELECT s.SessionID, s.GroupID, g.GroupName, g.CourseID, s.InstructorID, s.Slot, s.RoomName, s.DateFrom, s.DateTo \n"
                    + "FROM [Assignment].[dbo].[Session] s, [Assignment].[dbo].[Group] g\n"
                    + "where s.GroupId=g.GroupId)\n"
                    + "select * from t, [Assignment].[dbo].[Course] as c\n"
                    + "where t.CourseID=c.CourseID";
//                    + "and t.DateFrom <= ? and t.DateTo >= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setDate(1, Date.valueOf(LocalDate.now().toString()));
//            stm.setDate(2, Date.valueOf(LocalDate.now().toString()));
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session r = new Session();
                r.setSessionId(rs.getInt("SessionID"));
                Group g = new Group();
                g.setGroupId(rs.getInt("GroupID"));
                g.setGroupName(rs.getString("GroupName"));
                Course c = new Course();
                c.setCourseId(rs.getInt("CourseID"));
                c.setCourseName(rs.getString("CourseName"));
                g.setCourseId(c);
                r.setInstructorId(rs.getInt("InstructorID"));
                r.setSlot(rs.getInt("Slot"));
                r.setRoomName(rs.getString("RoomName"));
                r.setGroupId(g);
                table.add(r);
                System.out.println("ngu");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ScheduleDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return table;
    }

    @Override
    public Session get(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
