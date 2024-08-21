/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.grade;

import controller.auth.BaseRequiredStudentAuthenticationController;
import dal.DBContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Assessment;
import model.Course;
import model.Exam;
import model.Grade;
import model.Lecturer;
import model.Semester;
import model.Student;
import model.Subject;
import model.User;

public class GradeReportServlet extends BaseRequiredStudentAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Student student)
            throws ServletException, IOException {
        int studentId = student.getId();

        try (Connection con = DBContext.initializeDatabase()) {

            String studentQuery = "SELECT sname FROM students WHERE sid = ?";
            try (PreparedStatement studentPs = con.prepareStatement(studentQuery)) {
                studentPs.setInt(1, studentId);
                try (ResultSet studentRs = studentPs.executeQuery()) {
                    if (studentRs.next()) {
                        student.setName(studentRs.getString(1));
                    }
                }
            }

            String courseQuery = "SELECT c.cid, c.cname, s.year, s.season, l.lid, l.lname, sub.subid, sub.subname, s.semid, s.year, s.season, s.active "
                    + "FROM courses c "
                    + "JOIN semester s ON c.semid = s.semid "
                    + "JOIN lecturers l ON c.lid = l.lid "
                    + "JOIN subjects sub ON c.subid = sub.subid "
                    + "JOIN students_courses sc ON c.cid = sc.cid "
                    + "WHERE sc.sid = ?";
            try (PreparedStatement coursePs = con.prepareStatement(courseQuery)) {
                coursePs.setInt(1, studentId);
                try (ResultSet courseRs = coursePs.executeQuery()) {
                    while (courseRs.next()) {
                        Course course = new Course();
                        course.setId(courseRs.getInt("cid"));
                        course.setName(courseRs.getString("cname"));

                        Lecturer lecturer = new Lecturer();
                        lecturer.setId(courseRs.getInt("lid"));
                        lecturer.setName(courseRs.getString("lname"));
                        course.setLecturer(lecturer);

                        Subject subject = new Subject();
                        subject.setId(courseRs.getInt("subid"));
                        subject.setName(courseRs.getString("subname"));
                        course.setSubject(subject);

                        Semester semester = new Semester();
                        semester.setSemid(courseRs.getInt("semid"));
                        semester.setYear(courseRs.getInt("year"));
                        semester.setSeason(courseRs.getString("season"));
                        semester.setActive(courseRs.getBoolean("active"));
                        course.setSemester(semester);

                        student.getCourses().add(course);
                    }
                }
            }

            String gradeQuery = "SELECT a.aid, a.aname, g.score, e.eid, e.duration, e.[from] "
                    + "FROM grades g "
                    + "JOIN exams e ON g.eid = e.eid "
                    + "JOIN assesments a ON e.aid = a.aid "
                    + "WHERE g.sid = ?";
            try (PreparedStatement gradePs = con.prepareStatement(gradeQuery)) {
                gradePs.setInt(1, studentId);
                try (ResultSet gradeRs = gradePs.executeQuery()) {
                    while (gradeRs.next()) {
                        Exam exam = new Exam();
                        exam.setId(gradeRs.getInt("eid"));
                        exam.setDuration(gradeRs.getInt("duration"));
                        exam.setFrom(gradeRs.getDate("from"));

                        Assessment assessment = new Assessment();
                        assessment.setId(gradeRs.getInt("aid"));
                        assessment.setName(gradeRs.getString("aname"));
                        exam.setAssessment(assessment);

                        Grade grade = new Grade();
                        grade.setExam(exam);
                        grade.setStudent(student);
                        grade.setScore(gradeRs.getFloat("score"));
                        exam.getGrades().add(grade);

                        for (Course course : student.getCourses()) {
                            if (course.getSubject().getId() == assessment.getId()) {
                                course.getExams().add(exam);
                            }
                        }
                    }
                }
            }

        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }
        request.setAttribute("student", student);
        request.getRequestDispatcher("view/student/gradeReport.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
