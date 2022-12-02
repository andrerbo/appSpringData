package com.br.appbrain.model.test;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.br.appbrain.model.domain.Session;
import com.br.appbrain.model.domain.Student;
import com.br.appbrain.model.domain.Subject;
import com.br.appbrain.service.SessionService;

@Component
@Order(4)
public class SessionTest implements ApplicationRunner {

    @Autowired
    private SessionService sessionService;

    @Override
    public void run(ApplicationArguments args) throws Exception {

        Subject subject = new Subject();
        subject.setId(1);

        Student student = new Student();
        student.setId(1);

        Session session = new Session();
        session.setEndDate(LocalDateTime.now());
        session.setSubject(subject);
        session.setStudent(student);
        sessionService.addSession(session);
        System.out.println(session);
    }
    
}
