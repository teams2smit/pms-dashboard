package com.smitppatel35.dashboard.feign;

import com.smitppatel35.dashboard.dto.ScheduleResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@FeignClient(url = "${api-gateway-endpoint}/schedule" , name = "schedule-service")
public interface ScheduleClient {

    @GetMapping(value = "/RepSchedule/{scheduleStartDate}")
    List<ScheduleResponse> getSchedule(@RequestHeader(value = "Authorization", required = true) String authorizationHeader, @PathVariable String scheduleStartDate);
}
