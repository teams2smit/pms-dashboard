package com.smitppatel35.dashboard.feign;

import com.smitppatel35.dashboard.dto.JwtTokenResponseDTO;
import com.smitppatel35.dashboard.dto.LoginDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;

@FeignClient(url = "${api-gateway-endpoint}" , name = "auth-service")
public interface AuthenticationClient {

    @PostMapping("/auth/login")
    JwtTokenResponseDTO login(LoginDto login);

}
