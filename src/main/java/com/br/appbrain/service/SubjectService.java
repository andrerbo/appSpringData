package com.br.appbrain.service;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.appbrain.model.domain.Subject;
import com.br.appbrain.repository.SubjectRepository;


@Service
public class SubjectService {
    
    @Autowired
    private SubjectRepository subjectRepository;

    public void deleteSubject(Integer id){
        subjectRepository.deleteById(id);
        System.out.println("Subject deleted successfuly");
    }

    public void addSubject(Subject subject){
        subjectRepository.save(subject);
        System.out.println(subject);
        System.out.println("Subject added successfuly");
    }

    public Collection<Subject> getSubjects(){
        return (Collection<Subject>) subjectRepository.findAll();
    }

    public Subject getSubjectById(Integer id){
        Optional<Subject> opSubject = subjectRepository.findById(id);
        
        if(opSubject.isPresent()){
            Subject subject = opSubject.get();
            return subject;
        }
        
        return null;
    }

}
