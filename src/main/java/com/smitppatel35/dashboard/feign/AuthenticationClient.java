package com.smitppatel35.dashboard.feign;

import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(url = "${api-gateway-endpoint}" , name = "auth-service")
public interface AuthenticationClient {


}
