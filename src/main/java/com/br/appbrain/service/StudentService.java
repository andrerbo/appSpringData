package com.br.appbrain.service;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.appbrain.model.domain.Student;
import com.br.appbrain.repository.StudentRepository;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;
    
    public void deleteStudent(Integer id){
        studentRepository.deleteById(id);
        System.out.println("Student deleted successfuly");
    }

    public void addStudent(Student student){
        studentRepository.save(student);
        System.out.println("Student added successfuly");
    }

    public Collection<Student> getStudents(){
        return (Collection<Student>) studentRepository.findAll();
    }
    
    public Student getStudentById(Integer id){
        Optional<Student> opStudent = studentRepository.findById(id);
        
        if(opStudent.isPresent()){
            Student student = opStudent.get();
            return student;
        }
        
        return null;
    }

}
