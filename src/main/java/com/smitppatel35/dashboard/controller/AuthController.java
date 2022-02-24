package com.smitppatel35.dashboard.controller;

import com.smitppatel35.dashboard.dto.LoginDto;
import com.smitppatel35.dashboard.service.AuthService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody LoginDto loginDto, HttpSession session, BindingResult result, Model model) {

        try {
            boolean res = authService.login(loginDto, session);

            if (res) {
                return ResponseEntity.ok("Success");
            } else {
                return new ResponseEntity<String>("Login Failed", HttpStatus.BAD_REQUEST);
            }

        } catch (Exception e) {
            log.debug(e.getMessage());
            return new ResponseEntity<String>("Login Failed", HttpStatus.BAD_REQUEST);
        }

    }
}
