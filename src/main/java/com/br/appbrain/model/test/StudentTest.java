package com.br.appbrain.model.test;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.br.appbrain.model.domain.Student;
import com.br.appbrain.model.domain.Subject;
import com.br.appbrain.service.StudentService;

@Component
@Order(3)
public class StudentTest implements ApplicationRunner {

    @Autowired
    private StudentService studentService;

    @Override
    public void run(ApplicationArguments args) throws Exception {

        Set<Subject> subjectList = new HashSet<Subject>();

        Subject subject1 = new Subject();
        subject1.setId(1);
        Subject subject2 = new Subject();
        subject2.setId(2);

        subjectList.add(subject1);
        subjectList.add(subject2);

        Student student = new Student();
        student.setName("André Ribeiro");
        student.setEmail("ribeiro@gmail.com");
        student.setSubjectList(subjectList);
        studentService.addStudent(student);
        System.out.println(student);

        Student studentTwo = new Student();
        studentTwo.setName("Anderson Lima");
        studentTwo.setEmail("lima@lima.com");
        studentService.addStudent(studentTwo);
        System.out.println(studentTwo);
    }

}
