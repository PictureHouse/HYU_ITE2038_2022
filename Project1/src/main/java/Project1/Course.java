package Project1;

public class Course {
    private String ClassNo;
    private String CourseID;
    private String Name;
    private String LecturerName;
    private String Begin;
    private String End;
    private int MaxPerson;
    private String Building;
    private String Room;

    public String getClassNo() {
        return ClassNo;
    }

    public void setClassNo(String classNo) { ClassNo = classNo; }

    public String getCourseID() {
        return CourseID;
    }

    public void setCourseID(String courseID) {
        CourseID = courseID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getLecturerName() {
        return LecturerName;
    }

    public void setLecturerName(String lecturerName) {
        LecturerName = lecturerName;
    }

    public String getBegin() { return Begin; }

    public void setBegin(String begin) { Begin = begin.substring(11, 16); }

    public String getEnd() { return End; }

    public void setEnd(String end) { End = end.substring(11, 16); }

    public int getMaxPerson() { return MaxPerson; }

    public void setMaxPerson(int num) { MaxPerson = num; }

    public String getBuilding() { return Building; }

    public void setBuilding(String building) { Building = building; }

    public String getRoom() { return Room; }

    public void setRoom(String room) { Room = room; }
}
