package com.smitppatel35.dashboard.controller;

import com.smitppatel35.dashboard.dto.LoginDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("login") LoginDto loginDto, BindingResult result, Model model){

        if(result.hasErrors()){
            return "login";
        }
        return null;
    }
}
