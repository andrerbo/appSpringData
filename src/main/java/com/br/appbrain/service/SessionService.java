package com.br.appbrain.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.appbrain.model.domain.Session;
import com.br.appbrain.repository.SessionRepository;


@Service
public class SessionService {
    
    @Autowired
    private SessionRepository sessionRepository;
    

    public void addSession(Session session){
        sessionRepository.save(session);
        System.out.println("Session added successfuly");
    }


    public Collection<Session> getSessions(){
        return (Collection<Session>) sessionRepository.findAll();
    }

}
