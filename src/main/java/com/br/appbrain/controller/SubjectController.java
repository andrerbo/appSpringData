package com.br.appbrain.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.appbrain.model.domain.Subject;
import com.br.appbrain.service.SubjectService;


@Controller
public class SubjectController {

    @Autowired
    private SubjectService subjectService;
    
    @GetMapping(value="/subject/main")
    public String getSubjectPage(Model model, @ModelAttribute("message") String message, @ModelAttribute("messageType") String messageType){
        List<Subject> subjectList = (List<Subject>) subjectService.getSubjects();
        model.addAttribute("subjectList", subjectList);
        model.addAttribute("message", message);
        model.addAttribute("messageType", messageType);
        return "/subject/main";
    }

    @GetMapping(value="/subject/new")
    public String getNewSubjectPage(){
        return "/subject/new";
    }

    @GetMapping(value = "/subject/{id}/delete")
    public String deleteSubject(@PathVariable Integer id, RedirectAttributes redAttr){
        try {
            subjectService.deleteSubject(id);
            redAttr.addFlashAttribute("message", "Subject deleted successfuly!");
            redAttr.addFlashAttribute("messageType", "alert-success");
            System.out.println("Subject " + id + " deleted successfuly");
        } catch(Exception e){
            redAttr.addFlashAttribute("message", "Can't possible delete subject");
            redAttr.addFlashAttribute("messageType", "alert-danger");
        }
        return "redirect:/subject/main";
    }

    @PostMapping(value="/subject")
    public String postNewSubject(Subject subject, RedirectAttributes redAttr){
        subjectService.addSubject(subject);
        redAttr.addFlashAttribute("message", "Subject created successfuly");
        redAttr.addFlashAttribute("messageType", "alert-success");
        return "redirect:/subject/main";
    }
    
}
