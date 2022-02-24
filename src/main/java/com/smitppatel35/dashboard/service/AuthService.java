package com.smitppatel35.dashboard.service;

import com.smitppatel35.dashboard.dto.LoginDto;

import javax.servlet.http.HttpSession;

public interface AuthService {
    boolean login(LoginDto loginDto, HttpSession session) throws Exception;
}
