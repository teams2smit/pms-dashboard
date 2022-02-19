package com.smitppatel35.dashboard.service.impl;

import com.smitppatel35.dashboard.dto.ScheduleResponse;
import com.smitppatel35.dashboard.feign.ScheduleClient;
import com.smitppatel35.dashboard.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    @Autowired
    private ScheduleClient scheduleClient;

    @Override
    public List<ScheduleResponse> getSchedule(HttpSession session) {
        String token = (String) session.getAttribute("token");
        List<ScheduleResponse> schedule = scheduleClient.getSchedule("Bearer " + token, getDate());

        System.out.println(schedule);
        return schedule;
    }

    private String getDate(){
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
        return sdf.format(new Date());
    }
}
