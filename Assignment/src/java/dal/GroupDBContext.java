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
import model.Session;

public class GroupDBContext extends DBContext<Session> {

    @Override
    public ArrayList<Session> list() {
        ArrayList<Session> table = new ArrayList<>();
//        try {
//            String sql = "SELECT SessionID, GroupID, InstructorID, Slot, RoomName FROM Session";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            ResultSet rs = stm.executeQuery();
//            while(rs.next())
//            {
//                Session r = new Session();
//                r.setSessionId(rs.getInt("SessionID"));
//                r.setGroupId(rs.getInt("GroupID"));
//                r.setInstructorId(rs.getInt("InstructorID"));
//                r.setSlot(rs.getInt("Slot"));
//                r.setRoomName(rs.getInt("RoomName"));
//                table.add(r);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        finally
//        {
//            try {
//                connection.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
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
