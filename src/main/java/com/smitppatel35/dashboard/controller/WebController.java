package com.smitppatel35.dashboard.controller;

import com.smitppatel35.dashboard.dto.MedicineDemand;
import com.smitppatel35.dashboard.service.ScheduleService;
import com.smitppatel35.dashboard.service.StockService;
import com.smitppatel35.dashboard.service.SupplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class WebController {

    @Autowired
    private StockService stockService;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private SupplyService supplyService;

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
    public ResponseEntity<String> requestMedicines(HttpSession session, @RequestBody List<MedicineDemand> demandList, Model model) {

        supplyService.sendDemandRequest(session, demandList);

        return new ResponseEntity<String>("Success", HttpStatus.OK);
    }

    @GetMapping("/history")
    public String history(HttpSession session, Model model) {
        if (session.getAttribute("token") == null) {
            return "login";
        }

        model.addAttribute("history", supplyService.getDemandSupplyHistory(session));

        return "history";
    }


    @GetMapping("login")
    public String login(Model model) {
        //model.addAttribute("login", new LoginDto());
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.removeAttribute("token");
        session.removeAttribute("username");
        return "redirect:/login";
    }

    @GetMapping("/g")
    public String s(){
        return "error";
    }
}