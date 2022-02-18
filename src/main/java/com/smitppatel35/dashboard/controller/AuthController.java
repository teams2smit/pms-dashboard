package com.smitppatel35.dashboard.controller;

import com.smitppatel35.dashboard.dto.LoginDto;
import com.smitppatel35.dashboard.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("login") LoginDto loginDto, HttpSession session, BindingResult result, Model model){

        if(result.hasErrors()){
            return "login";
        }

        try {
            authService.login(loginDto, session);

            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            return "login";
        }

    }
}
