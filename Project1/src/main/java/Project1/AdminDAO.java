package Project1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
DB와 연결을 하고, 로그인을 수행하는 클래스
 */
public class AdminDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    /*
    클래스의 생성자
    미리 입력된 DB 주소와 DB 사용자의 ID와 비밀번호를 이용해서 DB와 connection을 만듦
     */
    public AdminDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/DB2019030400?serverTimezone=Asia/Seoul";
            String dbID = "root";
            String dbPassword = "yune0604";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
    사용자의 ID와 비밀번호로 매개변수로 받아 로그인을 수행하는 method
    입력한 ID에 해당하는 비밀번호를 DB에서 불러와서 사용자가 입력한 비밀번호와 같은지 확인하는 과정을 거친 후 일치하면 1을 리턴, 일치하지 않으면 0을 리턴
    사용자가 입력한 ID의 정보가 없으면 -1을 리턴하고, 과정 중에 예외상황 발생시 -2를 리턴
     */
    public int login(String userID, String userPassword) {
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
}
