package Project1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClassList {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public ClassList() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/DB2019030400?serverTimezone=Asia/Seoul";
            String dbID = "root";
            String dbPassword = "yune0604";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public ArrayList search1(int classNo) {
        String SQL1 = "SELECT class_no, course_id, class.name, lecturer.name, time.begin, time.end, person_max, building.name, room_id FROM ((class join lecturer using (lecturer_id)) natural join room natural join time) join building using (building_id) WHERE class_no = ?";
        ArrayList<Course> classList = new ArrayList<Course>();
        try {
            pstmt = conn.prepareStatement(SQL1);
            pstmt.setInt(1, classNo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setClassNo(rs.getString("class_no"));
                course.setCourseID(rs.getString("course_id"));
                course.setName(rs.getString("class.name"));
                course.setLecturerName(rs.getString("lecturer.name"));
                course.setBegin(rs.getString("begin"));
                course.setEnd(rs.getString("end"));
                course.setMaxPerson(rs.getInt("person_max"));
                course.setBuilding(rs.getString("building.name"));
                course.setRoom(rs.getString("room_id"));
                classList.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classList;
    }

    public ArrayList search2(String courseID) {
        String SQL2 = "SELECT class_no, course_id, class.name, lecturer.name, time.begin, time.end, person_max, building.name, room_id FROM ((class join lecturer using (lecturer_id)) natural join room natural join time) join building using (building_id) WHERE course_id = ?";
        ArrayList<Course> classList = new ArrayList<Course>();
        try {
            pstmt = conn.prepareStatement(SQL2);
            pstmt.setString(1, courseID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setClassNo(rs.getString("class_no"));
                course.setCourseID(rs.getString("course_id"));
                course.setName(rs.getString("class.name"));
                course.setLecturerName(rs.getString("lecturer.name"));
                course.setBegin(rs.getString("begin"));
                course.setEnd(rs.getString("end"));
                course.setMaxPerson(rs.getInt("person_max"));
                course.setBuilding(rs.getString("building.name"));
                course.setRoom(rs.getString("room_id"));
                classList.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classList;
    }

    public ArrayList search3(String name) {
        String SQL3 = "SELECT class_no, course_id, class.name, lecturer.name, time.begin, time.end, person_max, building.name, room_id FROM ((class join lecturer using (lecturer_id)) natural join room natural join time) join building using (building_id) WHERE class.name like ?";
        ArrayList<Course> classList = new ArrayList<Course>();
        try {
            pstmt = conn.prepareStatement(SQL3);
            pstmt.setString(1, '%'+name+'%');
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setClassNo(rs.getString("class_no"));
                course.setCourseID(rs.getString("course_id"));
                course.setName(rs.getString("class.name"));
                course.setLecturerName(rs.getString("lecturer.name"));
                course.setBegin(rs.getString("begin"));
                course.setEnd(rs.getString("end"));
                course.setMaxPerson(rs.getInt("person_max"));
                course.setBuilding(rs.getString("building.name"));
                course.setRoom(rs.getString("room_id"));
                classList.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classList;
    }
}
