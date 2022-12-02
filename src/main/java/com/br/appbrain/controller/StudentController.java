package com.br.appbrain.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.appbrain.model.domain.Student;
import com.br.appbrain.model.domain.Subject;
import com.br.appbrain.service.StudentService;
import com.br.appbrain.service.SubjectService;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private SubjectService subjectService;


    @GetMapping(value="/student/new")
    public String getNewStudentPage(){
        return "/student/new";
    }
    
    @GetMapping(value="/student/main")
    public String getStudentPage(Model model, @ModelAttribute("message") String message, @ModelAttribute("messageType") String messageType){
        List<Student> studentList = (List<Student>) studentService.getStudents();
        List<Subject> subjectList = (List<Subject>) subjectService.getSubjects();
        model.addAttribute("studentList", studentList);
        model.addAttribute("subjectList", subjectList);
        model.addAttribute("message", message);
        model.addAttribute("messageType", messageType);
        return "/student/main";
    }

    @GetMapping(value="/student/{id}/delete")
    public String deleteStudent(@PathVariable Integer id, RedirectAttributes redAttr){
        try {
            studentService.deleteStudent(id);
            redAttr.addFlashAttribute("message", "Student deleted successfuly!");
            redAttr.addFlashAttribute("messageType", "alert-success");
            System.out.println("Student " + id + " deleted successfuly");
        } catch(Exception e){
            redAttr.addFlashAttribute("message", "Can't possible delete student");
            redAttr.addFlashAttribute("messageType", "alert-danger");
        }
        return "redirect:/student/main";
    }

    @PostMapping(value="/student")
    public String postNewStudent(Student student, RedirectAttributes redAttr){
        studentService.addStudent(student);
        redAttr.addFlashAttribute("message", "Student created successfuly");
        redAttr.addFlashAttribute("messageType", "alert-success");
        return "redirect:/student/main";
    }

    @PostMapping(value="/student/{id}/subscription")
    public String postNewSubscription(@PathVariable Integer id, @RequestParam Integer subjectId, RedirectAttributes redAttr){
        Student student = studentService.getStudentById(id);
        Subject subject = subjectService.getSubjectById(subjectId);

        if (student.getSubjectList().contains(subject)){
            redAttr.addFlashAttribute("message", "Subject already subscripted!");
            redAttr.addFlashAttribute("messageType", "alert-warning");
        } else if (student != null && subject != null){
            student.addSubject(subject);
            studentService.addStudent(student);
            redAttr.addFlashAttribute("message", "Subject subscribed successfuly");
            redAttr.addFlashAttribute("messageType", "alert-success");
        } else {
            redAttr.addFlashAttribute("message", "Subscription failed!");
            redAttr.addFlashAttribute("messageType", "alert-danger");
        }

        return "redirect:/student/main"; 
    }

    @GetMapping(value="/student/{studentId}/unsubscribe/{subjectId}")
    public String deleteSubject(@PathVariable Integer studentId, @PathVariable Integer subjectId, RedirectAttributes redAttr){
        Student student = studentService.getStudentById(studentId);
        Subject subject = subjectService.getSubjectById(subjectId);

        if (student != null && subject != null && student.getSubjectList().contains(subject)){
            student.removeSubject(subject);
            studentService.addStudent(student);
            redAttr.addFlashAttribute("message", "Subject unsubscribed!");
            redAttr.addFlashAttribute("messageType", "alert-success");
        } else {
            redAttr.addFlashAttribute("message", "Unsubscription failed!");
            redAttr.addFlashAttribute("messageType", "alert-danger");
        }

        return "redirect:/student/main"; 
    }


}
