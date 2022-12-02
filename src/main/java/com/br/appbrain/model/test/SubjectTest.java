package com.br.appbrain.model.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.br.appbrain.model.domain.Subject;
import com.br.appbrain.service.SubjectService;

@Component
@Order(2)
public class SubjectTest implements ApplicationRunner{
    
    @Autowired
    private SubjectService subjectService;

    @Override
    public void run(ApplicationArguments args) throws Exception {

        Subject subject = new Subject("CCNA", "200-301");
        subjectService.addSubject(subject);
        System.out.println(subject);

        Subject subject2 = new Subject("CCNP", "300-401");
        subjectService.addSubject(subject2);
        System.out.println(subject2);
    }
    
}
