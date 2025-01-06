package com.controller;

import com.entity.HackathonEntity;
import com.repository.HackathonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/hackathons")
public class HackathonController {

    @Autowired
    private HackathonRepository hackathonRepository;

    // Display list of hackathons
    @GetMapping
    public String viewHackathons(Model model) {
        model.addAttribute("hackathons", hackathonRepository.findAll());
        return "hackathon";
    }

    // Show form to add a new hackathon
    @GetMapping("/new")
    public String addHackathonForm(Model model) {
        model.addAttribute("hackathon", new HackathonEntity());
        return "editHackathon";
    }

    // Save a new or updated hackathon
    @PostMapping
    public String saveHackathon(@ModelAttribute HackathonEntity hackathon) {
        hackathonRepository.save(hackathon);
        return "redirect:/hackathons";
    }

    // Edit an existing hackathon
    @GetMapping("/edit/{id}")
    public String editHackathonForm(@PathVariable Long id, Model model) {
        Optional<HackathonEntity> hackathon = hackathonRepository.findById(id);
        if (hackathon.isPresent()) {
            model.addAttribute("hackathon", hackathon.get());
            return "editHackathon";
        }
        return "redirect:/hackathons";
    }

    // Delete a hackathon
    @GetMapping("/delete/{id}")
    public String deleteHackathon(@PathVariable Long id) {
        hackathonRepository.deleteById(id);
        return "redirect:/hackathons";
    }

    // View hackathon details
    @GetMapping("/view/{id}")
    public String viewHackathon(@PathVariable Long id, Model model) {
        Optional<HackathonEntity> hackathon = hackathonRepository.findById(id);
        if (hackathon.isPresent()) {
            model.addAttribute("hackathon", hackathon.get());
            return "viewHackathon";
        }
        return "redirect:/hackathons";
    }
}