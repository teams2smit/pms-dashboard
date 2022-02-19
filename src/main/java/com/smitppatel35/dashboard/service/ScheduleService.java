package com.smitppatel35.dashboard.service;

import com.smitppatel35.dashboard.dto.ScheduleResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface ScheduleService {
    List<ScheduleResponse> getSchedule(HttpSession session);
}
