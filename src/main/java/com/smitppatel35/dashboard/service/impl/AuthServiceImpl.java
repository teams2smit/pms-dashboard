package com.smitppatel35.dashboard.service.impl;

import com.smitppatel35.dashboard.dto.JwtTokenResponseDTO;
import com.smitppatel35.dashboard.dto.LoginDto;
import com.smitppatel35.dashboard.feign.AuthenticationClient;
import com.smitppatel35.dashboard.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private AuthenticationClient authenticationClient;

    @Override
    public void login(LoginDto loginDto, HttpSession session) throws Exception {

        try {
            JwtTokenResponseDTO jwtTokenResponseDTO = authenticationClient.login(loginDto);

            String token = jwtTokenResponseDTO.getToken();

            session.setAttribute("username", loginDto.getUsername());
            session.setAttribute("token", token);

            session.setMaxInactiveInterval(2*60);
        }catch (Exception e){
            throw new Exception("Something wrong happened");
        }
    }
}
