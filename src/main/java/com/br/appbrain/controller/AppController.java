package com.br.appbrain.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.br.appbrain.model.domain.User;
import com.br.appbrain.service.UserService;

@SessionAttributes("user")
@Controller
public class AppController {

    @Autowired
    private UserService userService;
        

    @GetMapping(value="/")
    public String getHomePage(){
        return "home";
    }

    @GetMapping(value="/login")
    public String getLoginPage(Model model, @ModelAttribute("message") String message){
        model.addAttribute("message", message);
        return "login";
    }

    @PostMapping(value="/login")
    public String login(Model model, RedirectAttributes redAttr, @RequestParam String email, @RequestParam String password){
        User user = userService.checkUser(email, password);
        if (user != null){
            model.addAttribute("user", user);
            return "redirect:/";
        }
        redAttr.addFlashAttribute("message", "User not found or incorrect password!");
        return "redirect:/login";
    }
    
    @GetMapping(value="/logout")
    public String logout(HttpSession session, SessionStatus status) {
        status.setComplete();
        session.removeAttribute("user");
        return "redirect:/";
    }

    @GetMapping(value="/profile")
    public String profile(){
        return "profile";
    }
}
