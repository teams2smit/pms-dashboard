package com.smitppatel35.dashboard.controller;

import com.smitppatel35.dashboard.dto.LoginDto;
import com.smitppatel35.dashboard.dto.MedicineDemand;
import com.smitppatel35.dashboard.dto.MedicineDemandContainer;
import com.smitppatel35.dashboard.service.ScheduleService;
import com.smitppatel35.dashboard.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.util.List;

@Controller
public class WebController {

    @Autowired
    private StockService stockService;

    @Autowired
    private ScheduleService scheduleService;

    @GetMapping
    public String home(HttpSession session, Model model) {
        if (session.getAttribute("token") == null) {
            return "login";
        }

        model.addAttribute("username", session.getAttribute("username"));

        return "home";
    }

    @GetMapping("/stock")
    public String stock(HttpSession session, Model model) {
        if (session.getAttribute("token") == null) {
            return "login";
        }

        model.addAttribute("stockList", stockService.getAllMedicinesList());
        return "stock";
    }

    @GetMapping("/schedule")
    public String schedule(HttpSession session, Model model) {
        if (session.getAttribute("token") == null) {
            return "login";
        }

        model.addAttribute("scheduleList", scheduleService.getSchedule(session));

        return "schedule";
    }

    @GetMapping("/supply")
    public String supply(HttpSession session, Model model) {
        if (session.getAttribute("token") == null) {
            return "login";
        }

        model.addAttribute("stockList", stockService.getAllMedicinesList());
        return "supply";
    }

    @PostMapping(value = "/demand")
    public void requestMedicines(@ModelAttribute MedicineDemandContainer container) {



//        for(String med: medicines){
//            System.out.println("DEBUG >>>>>>>>>>>>>>>>>>>>>>>>>>> " + med);
//        }
//
//        for(Integer e: demand){
//            System.out.println("DEBUG >>>>>>>>>>>>>>>>>>>>>>>>>>> Counts: " + e);
//        }

    }

    @GetMapping("login")
    public String login(Model model) {
        model.addAttribute("login", new LoginDto());
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.removeAttribute("token");
        session.removeAttribute("username");

        return "redirect:/login";
    }
}
