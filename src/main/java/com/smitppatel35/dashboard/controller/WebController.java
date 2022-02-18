package com.smitppatel35.dashboard.controller;

import com.smitppatel35.dashboard.dto.LoginDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class WebController {

    @GetMapping
    public String home(HttpSession session, Model model){
        if (session.getAttribute("token") == null){
            return "login";
        }

        model.addAttribute("username", session.getAttribute("username"));

        return "home";
    }

    @GetMapping("/stock")
    public String stock(HttpSession session, Model model){
        if (session.getAttribute("token") == null){
            return "login";
        }

        return "stock";
    }

    @GetMapping("/schedule")
    public String schedule(HttpSession session, Model model){
        if (session.getAttribute("token") == null){
            return "login";
        }

        return "schedule";
    }

    @GetMapping("/supply")
    public String supply(HttpSession session, Model model){
        if (session.getAttribute("token") == null){
            return "login";
        }

        return "supply";
    }

    @GetMapping("login")
    public String login(Model model){
        model.addAttribute("login", new LoginDto());
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, Model model){
        session.removeAttribute("token");
        session.removeAttribute("username");

        return "redirect:/login";
    }
}
