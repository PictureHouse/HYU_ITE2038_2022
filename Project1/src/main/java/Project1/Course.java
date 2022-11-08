package Project1;

/*
과목 관련 정보들을 담는 클래스
웹사이트 구동을 할 때 사용되는 과목과 관련된 정보들을 멤버로 가지고, 각각에 대한 get, set method를 가짐
 */
public class Course {
    private String ClassNo;
    private String CourseID;
    private String Name;
    private String LecturerName;
    private String Day;
    private String Begin;
    private String End;
    private int MaxPerson;
    private String Building;
    private String Room;
    private String Difference;

    public String getClassNo() { return ClassNo; }

    public void setClassNo(String classNo) { ClassNo = classNo; }

    public String getCourseID() { return CourseID; }

    public void setCourseID(String courseID) { CourseID = courseID; }

    public String getName() { return Name; }

    public void setName(String name) { Name = name; }

    public String getLecturerName() { return LecturerName; }

    public void setLecturerName(String lecturerName) { LecturerName = lecturerName; }

    public String getDay() { return Day; }

    public void setDay(String time) {
        if (time.length() < 7) {
            Day = time;
        } else {
            String tmp = time.substring(9, 10);
            switch (tmp) {
                case "1":
                    Day = "월요일";
                    break;
                case "2":
                    Day = "화요일";
                    break;
                case "3":
                    Day = "수요일";
                    break;
                case "4":
                    Day = "목요일";
                    break;
                case "5":
                    Day = "금요일";
                    break;
                case "6":
                    Day = "토요일";
                    break;
                default:
                    Day = "";
            }
        }
    }

    public String getBegin() { return Begin; }

    public void setBegin(String begin) {
        if (begin.length() < 7) {
            Begin = begin;
        } else {
            Begin = begin.substring(11, 16);
        }
    }

    public String getEnd() { return End; }

    public void setEnd(String end) {
        if (end.length() < 7) {
            End = end;
        } else {
            End = end.substring(11, 16);
        }
    }

    public int getMaxPerson() { return MaxPerson; }

    public void setMaxPerson(int num) { MaxPerson = num; }

    public String getBuilding() { return Building; }

    public void setBuilding(String building) { Building = building; }

    public String getRoom() { return Room; }

    public void setRoom(String room) { Room = room; }

    public String getDifference() { return Difference; }

    public void setDifference(float difference) { Difference = String.format("%.5f", difference); }
}
