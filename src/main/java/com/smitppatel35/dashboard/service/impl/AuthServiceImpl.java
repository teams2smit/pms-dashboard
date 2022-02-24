package com.smitppatel35.dashboard.service.impl;

import com.smitppatel35.dashboard.dto.JwtTokenResponseDTO;
import com.smitppatel35.dashboard.dto.LoginDto;
import com.smitppatel35.dashboard.feign.AuthenticationClient;
import com.smitppatel35.dashboard.service.AuthService;
import feign.FeignException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Slf4j
@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private AuthenticationClient authenticationClient;

    @Override
    public boolean login(LoginDto loginDto, HttpSession session) throws Exception {

        log.info("login method invoked");

        try {
            log.debug("Requesting to auth-service");
            JwtTokenResponseDTO jwtTokenResponseDTO = authenticationClient.login(loginDto);

            log.debug("Response received from auth-service");
            String token = jwtTokenResponseDTO.getToken();

            session.setAttribute("username", loginDto.getUsername());
            session.setAttribute("token", token);

            session.setMaxInactiveInterval(2 * 60 * 60);

            return true;
        } catch (FeignException.FeignClientException e) {
            log.debug(e.getMessage());

            return false;
        }
    }
}
