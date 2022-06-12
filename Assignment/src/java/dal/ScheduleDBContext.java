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
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Group;
import model.Instructor;
import model.Session;

public class ScheduleDBContext extends DBContext<Session> {

    @Override
    public ArrayList<Session> list() {
        ArrayList<Session> table = new ArrayList<>();
        try {
            String sql = "with t as (SELECT s.SessionID, s.GroupID, g.GroupName, g.CourseID, s.InstructorID, s.Slot, s.RoomName, s.Date\n"
                    + "FROM [dbo].[Session] s, [dbo].[Group] g\n"
                    + "where s.GroupId=g.GroupId)\n"
                    + "select * from t, [dbo].[Course] as c\n"
                    + "where t.CourseID=c.CourseID\n"
                    + "and t.Date >= ? and t.Date <= ?";
            Calendar ist= Calendar.getInstance();
            int y =ist.get(Calendar.YEAR);
            int d = ist.get(Calendar.DAY_OF_YEAR);
            int d1 = ist.get(Calendar.DAY_OF_WEEK);
            Date from = Date.valueOf(LocalDate.ofYearDay(y, d-d1+1));
            Date to = Date.valueOf(LocalDate.ofYearDay(y, d-d1+7));
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, from);
            stm.setDate(2, to);
//            stm.setInt(1, 10);
//            stm.setInt(2, 20);
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
                Instructor i = new Instructor();
                i.setInstructorId(rs.getInt("InstructorID"));
                r.setInstructorId(i);
                r.setSlot(rs.getInt("Slot"));
                r.setRoomName(rs.getString("RoomName"));
                r.setGroupId(g);
                r.setDate(rs.getDate("Date"));
                table.add(r);
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
    public void delete(Session entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Session> get(int x) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
