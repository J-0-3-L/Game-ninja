package com.joel.ninja.controllers;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

import org.springframework.ui.Model;
import java.util.Date;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index(Model model, HttpSession session) {
        if (session.getAttribute("gold") == null) {
            session.setAttribute("gold", 0);
        }
        if (session.getAttribute("activities") == null) {
            session.setAttribute("activities", new ArrayList<>());
        }

        model.addAttribute("gold", session.getAttribute("gold"));
        model.addAttribute("activities", session.getAttribute("activities"));

        return "index";
    }

    @PostMapping("/process_money")
    public String processMoney(@RequestParam("location") String location, HttpSession session,
                               RedirectAttributes redirectAttributes) {
        int earned;
        String action;

        switch (location) {
            case "farm":
                earned = generateRandomGold(10, 20);
                action = "farm";
                break;
            case "cave":
                earned = generateRandomGold(5, 10);
                action = "cave";
                break;
            case "house":
                earned = generateRandomGold(2, 5);
                action = "house";
                break;
            case "casino":
                earned = generateRandomGold(-50, 50);
                action = "casino";
                break;
            default:
                return "redirect:/";
        }

        int currentGold = (int) session.getAttribute("gold");
        session.setAttribute("gold", currentGold + earned);

        List<String> activities = (List<String>) session.getAttribute("activities");
        activities.add(0, formatActivity(action, earned, location));
        session.setAttribute("activities", activities);

        redirectAttributes.addFlashAttribute("earnedGold", earned);

        return "redirect:/";
    }

    @PostMapping("/reset")
    public String reset(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    private int generateRandomGold(int min, int max) {
        Random random = new Random();
        return random.nextInt(max - min + 1) + min;
    }

    private String formatActivity(String action, int gold, String location) {
        LocalDateTime timestamp = LocalDateTime.now();
        return String.format("%s %d from the %s!", action, gold, location, timestamp);
    }

}
