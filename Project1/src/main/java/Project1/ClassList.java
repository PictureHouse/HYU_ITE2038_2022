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

    public String test(String userID, String userPassword) {
        String test = userID + " " + userPassword;
        return test;
    }
/*
    public int search(String classID, String userPassword) {
        String SQL = "SELECT password FROM admin WHERE admin_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(userPassword)) {
                    return 1; //로그인 성공
                } else {
                    return 0; //비밀번호 불일치
                }
            }
            return -1; // 아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // 데이터베이스 오류
    }

    public ArrayList<Course> showInfo() {
        String SQL = "SELECT admin_id, name FROM admin WHERE admin_id = ?";
        ArrayList<Course> classList = new ArrayList<Course>();
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, );
            rs = pstmt.executeQuery();

            while(rs.next()) {
                Course course = new Course();
                course.setClassID(rs.getString("class_id"));
                course.setCourseID(rs.getString("course_id"));
                course.setName(rs.getString("name"));
                classList.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classList;
    }*/
}
