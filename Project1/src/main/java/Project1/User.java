package Project1;

/*
사용자 정보를 담는 User 클래스
UserID, UserPassword, UserName을 멤버로 가지고 각각에 대한 get, set method를 가짐
*/
public class User {
    private String UserID;
    private String UserPassword;
    private String UserName;

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String userID) {
        UserID = userID;
    }

    public String getUserPassword() {
        return UserPassword;
    }

    public void setUserPassword(String userPassword) {
        UserPassword = userPassword;
    }

    public String getUserName() { return UserName; }

    public void setUserName(String userName) {
        UserName = userName;
    }
}
