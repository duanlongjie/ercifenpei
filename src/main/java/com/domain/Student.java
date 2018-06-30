package com.domain;

public class Student {
    private String studentId;

    private String password;

    private String studentName;

    public Student(String studentId, String password, String studentName) {
        this.studentId = studentId;
        this.password = password;
        this.studentName = studentName;
    }

    public Student() {
        super();
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId == null ? null : studentId.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName == null ? null : studentName.trim();
    }
}