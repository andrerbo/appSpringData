package com.br.appbrain.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.br.appbrain.model.domain.Session;
import com.br.appbrain.repository.SessionRepository;

@Controller
public class SessionController {

    @Autowired
    private SessionRepository sessionRepository;

    @GetMapping(value="/session/new")
    public String getNewSessionPage(){
        return "/session/new";
    }

    @GetMapping(value = "/session/main")
    public String getSessionPage(Model model){
        List<Session> sessionList = (List<Session>) sessionRepository.findAll();
        model.addAttribute("sessionList", sessionList);
        return "session/main";
    }

}
