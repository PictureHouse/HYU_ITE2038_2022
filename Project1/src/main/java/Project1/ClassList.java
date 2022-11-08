package Project1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/*
DB에서 과목과 관련된 정보들을 가져오거나 수정할 때 사용하는 method들을 포함하는 클래스
 */
public class ClassList {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    /*
    클래스의 생성자
    미리 입력된 DB 주소와 DB 사용자의 ID, 비밀번호를 이용해서 DB와의 connection을 만듦
     */
    public ClassList() {
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
    수강편람에서 수업번호로 검색할 때 사용하는 method
    사용자로부터 입력받은 수업번호를 쿼리문의 where 절에 set해서 검색을 수행함
    쿼리문의 결과는 순서대로 돌면서 ArrayList 타입의 classList에 넣고 method가 모두 수행되면 classList를 리턴
     */
    public ArrayList search1(int classNo) {
        String SQL = "SELECT class_no, course_id, class.name, lecturer.name, time.begin, time.end, person_max, building.name, room_id FROM ((class join lecturer using (lecturer_id)) natural join room natural join time) join building using (building_id) WHERE class_no = ?";
        ArrayList<Course> classList = new ArrayList<Course>();
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, classNo);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setClassNo(rs.getString("class_no"));
                course.setCourseID(rs.getString("course_id"));
                course.setName(rs.getString("class.name"));
                course.setLecturerName(rs.getString("lecturer.name"));
                course.setDay(rs.getString("begin"));
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

    /*
    수강편람에서 학수번호로 검색할 때 사용하는 method
    사용자로부터 입력받은 학수번호를 쿼리문의 where 절에 set해서 검색을 수행함
    쿼리문의 결과는 순서대로 돌면서 ArrayList 타입의 classList에 넣고 method가 모두 수행되면 classList를 리턴
     */
    public ArrayList search2(String courseID) {
        String SQL = "SELECT class_no, course_id, class.name, lecturer.name, time.begin, time.end, person_max, building.name, room_id FROM ((class join lecturer using (lecturer_id)) natural join room natural join time) join building using (building_id) WHERE course_id = ?";
        ArrayList<Course> classList = new ArrayList<Course>();
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, courseID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setClassNo(rs.getString("class_no"));
                course.setCourseID(rs.getString("course_id"));
                course.setName(rs.getString("class.name"));
                course.setLecturerName(rs.getString("lecturer.name"));
                course.setDay(rs.getString("begin"));
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

    /*
    수강편람에서 교과목명으로 검색할 때 사용하는 method
    사용자로부터 입력받은 교과목명을 쿼리문의 where 절에 set해서 검색을 수행함
    쿼리문의 결과는 순서대로 돌면서 ArrayList 타입의 classList에 넣고 method가 모두 수행되면 classList를 리턴
     */
    public ArrayList search3(String name) {
        String SQL = "SELECT class_no, course_id, class.name, lecturer.name, time.begin, time.begin, time.end, person_max, building.name, room_id FROM ((class join lecturer using (lecturer_id)) natural join room natural join time) join building using (building_id) WHERE class.name like ?";
        ArrayList<Course> classList = new ArrayList<Course>();
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, '%'+name+'%');
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setClassNo(rs.getString("class_no"));
                course.setCourseID(rs.getString("course_id"));
                course.setName(rs.getString("class.name"));
                course.setLecturerName(rs.getString("lecturer.name"));
                course.setDay(rs.getString("begin"));
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

    /*
    OLAP 결과를 가져올 때 사용하는 method
    검색조건(평점 평균과 특정 과목의 학점 간 차이가 가장 큰 10과목 추출)에 해당하는 쿼리문을 이용해서 검색을 수행함
    쿼리문의 결과는 순서대로 돌면서 ArrayList 타입의 classList에 넣고 method가 모두 수행되면 classList를 리턴
     */
    public ArrayList olap() {
        String SQL = "SELECT course_id, name, (SELECT avg(point) FROM (credits natural join grades) natural join course) - avg(point) AS difference FROM (credits natural join grades) natural join course GROUP BY course_id HAVING (SELECT avg(point) FROM (credits natural join grades) natural join course) - avg(point) ORDER BY difference DESC limit 10";
        ArrayList<Course> classList = new ArrayList<Course>();
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setCourseID(rs.getString("course_id"));
                course.setName(rs.getString("name"));
                course.setDifference(rs.getFloat("difference"));
                classList.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classList;
    }

    /*
    강좌 개설을 할 때 사용하는 method
    매개변수로 받은 강좌의 정보들을 쿼리문에 순서대로 set한 후 insert 쿼리문을 수행
    insert에 성공하면 1을 리턴, 중간에 예외상황 발생시 0을 리턴
     */
    public int insert(String classID, String classNO, String courseID, String className, String majorID, String year, String credit, String lecturerID, String personMax, String opened, String roomID) {
        String SQL = "INSERT INTO class VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(classID));
            pstmt.setInt(2, Integer.parseInt(classNO));
            pstmt.setString(3, courseID);
            pstmt.setString(4, className);
            pstmt.setInt(5, Integer.parseInt(majorID));
            pstmt.setInt(6, Integer.parseInt(year));
            pstmt.setInt(7, Integer.parseInt(credit));
            pstmt.setInt(8, Integer.parseInt(lecturerID));
            pstmt.setInt(9, Integer.parseInt(personMax));
            pstmt.setInt(10, Integer.parseInt(opened));
            pstmt.setInt(11, Integer.parseInt(roomID));
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /*
    강좌 삭제를 할 때 사용하는 method
    매개변수로 받은 삭제할 강좌의 ID를 쿼리문에 set한 후 delete 쿼리문을 수행
    delete에 성공하면 1을 리턴, 중간에 예외상황 발생시 0을 리턴
     */
    public int delete(String classID) {
        String SQL = "DELETE FROM class WHERE class_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, Integer.parseInt(classID));
            pstmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /*
    수강편람에 있는 강좌의 정보를 희망 수업 목록 테이블로 옮기는 method
    매개변수로 받은 강좌의 정보들을 쿼리문에 set한 후 쿼리문을 수행
    희망 수업 목록 테이블로 insert에 성공하면 1을 리턴, 중간에 예외상황 발생시 0을 리턴
     */
    public int toWishlist(int classNO, String courseID, String className, String lecturerName, String day, String begin, String end, int personMax, String buildingName, int roomID) {
        String SQL = "INSERT INTO wishlist VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, classNO);
            pstmt.setString(2, courseID);
            pstmt.setString(3, className);
            pstmt.setString(4, lecturerName);
            pstmt.setString(5, day);
            pstmt.setString(6, begin);
            pstmt.setString(7, end);
            pstmt.setInt(8, personMax);
            pstmt.setString(9, buildingName);
            pstmt.setInt(10, roomID);
            rs = pstmt.executeQuery();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /*
    희망 수업 목록 테이블에 있는 정보를 가져올 때 사용하는 method
    쿼리문을 이용해서 희망 수업 목록 테이블의 정보들을 가져옴
    쿼리문의 결과는 순서대로 돌면서 ArrayList 타입의 classList에 넣고 method가 모두 수행되면 classList를 리턴
     */
    public ArrayList wishlist() {
        String SQL = "SELECT class_no, course_id, class_name, lecturer_name, day, begin, end, person_max, building_name, room_id FROM wishlist";
        ArrayList<Course> classList = new ArrayList<Course>();
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setClassNo(String.valueOf(rs.getInt("class_no")));
                course.setCourseID(rs.getString("course_id"));
                course.setName(rs.getString("class_name"));
                course.setLecturerName(rs.getString("lecturer_name"));
                course.setDay(rs.getString("wishlist.day"));
                course.setBegin(rs.getString("wishlist.begin"));
                course.setEnd(rs.getString("wishlist.end"));
                course.setMaxPerson(Integer.parseInt(rs.getString("person_max")));
                course.setBuilding(rs.getString("building_name"));
                course.setRoom(rs.getString("room_id"));
                classList.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classList;
    }

    /*
    수강편람 또는 희망 수업 목록 테이블에 있는 강좌의 정보를 수강 신청 목록 테이블로 옮기는 method
    매개변수로 받은 강좌의 정보들을 쿼리문에 set한 후 쿼리문을 수행
    수강 신청 목록 테이블로 insert에 성공하면 1을 리턴, 중간에 예외상황 발생시 0을 리턴
     */
    public int toEnrolment(int classNO, String courseID, String className, String lecturerName, String day, String begin, String end, int personMax, String buildingName, int roomID) {
        String SQL = "INSERT INTO enrolment VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, classNO);
            pstmt.setString(2, courseID);
            pstmt.setString(3, className);
            pstmt.setString(4, lecturerName);
            pstmt.setString(5, day);
            pstmt.setString(6, begin);
            pstmt.setString(7, end);
            pstmt.setInt(8, personMax);
            pstmt.setString(9, buildingName);
            pstmt.setInt(10, roomID);
            rs = pstmt.executeQuery();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /*
    수강 신청 목록 테이블에 있는 정보를 가져올 때 사용하는 method
    쿼리문을 이용해서 수강 신청 목록 테이블의 정보들을 가져옴
    쿼리문의 결과는 순서대로 돌면서 ArrayList 타입의 classList에 넣고 method가 모두 수행되면 classList를 리턴
     */
    public ArrayList enrolment() {
        String SQL = "SELECT class_no, course_id, class_name, lecturer_name, day, begin, end, person_max, building_name, room_id FROM enrolment";
        ArrayList<Course> classList = new ArrayList<Course>();
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setClassNo(String.valueOf(rs.getInt("class_no")));
                course.setCourseID(rs.getString("course_id"));
                course.setName(rs.getString("class_name"));
                course.setLecturerName(rs.getString("lecturer_name"));
                course.setDay(rs.getString("day"));
                course.setBegin(rs.getString("begin"));
                course.setEnd(rs.getString("end"));
                course.setMaxPerson(Integer.parseInt(rs.getString("person_max")));
                course.setBuilding(rs.getString("building_name"));
                course.setRoom(rs.getString("room_id"));
                classList.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return classList;
    }
}
