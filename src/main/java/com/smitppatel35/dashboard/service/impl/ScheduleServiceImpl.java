package com.smitppatel35.dashboard.service.impl;

import com.smitppatel35.dashboard.dto.ScheduleResponse;
import com.smitppatel35.dashboard.feign.ScheduleClient;
import com.smitppatel35.dashboard.service.ScheduleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class ScheduleServiceImpl implements ScheduleService {

    @Autowired
    private ScheduleClient scheduleClient;

    @Override
    public List<ScheduleResponse> getSchedule(HttpSession session) {
        log.info("[ScheduleServiceImpl] getSchedule() invoked");

        String token = (String) session.getAttribute("token");

        log.debug("Requesting to schedule-service");
        List<ScheduleResponse> schedule = scheduleClient.getSchedule("Bearer " + token, getDate());

        log.debug("Response received from schedule-service");
        return schedule;
    }

    private String getDate(){
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
        return sdf.format(new Date());
    }
}
