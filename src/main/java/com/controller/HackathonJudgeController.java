package com.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.HackathonJudgeEntity;
import com.repository.HackathonJudgeRepository;
import com.repository.HackathonRepository;
import com.repository.UserRepository;

@Controller
@RequestMapping("/hackathonJudges")
public class HackathonJudgeController {

    @Autowired
    private HackathonJudgeRepository hackathonJudgeRepository;

    @Autowired
    private HackathonRepository hackathonRepository;

    @Autowired
    private UserRepository userRepository;

    // Display list of judges
    @GetMapping
    public String viewHackathonJudges(Model model) {
        List<HackathonJudgeEntity> judges = hackathonJudgeRepository.findAll();
        System.out.println("Judges List: " + judges);  // Add this line for debugging
        model.addAttribute("judges", judges);
        return "hackathonJudges";
    }
    
   

    // Show form to add a new judge
    @GetMapping("/new")
    public String addHackathonJudgeForm(Model model) {
        model.addAttribute("hackathons", hackathonRepository.findAll()); // Hackathon list
        model.addAttribute("users", userRepository.findAll()); // User list
        return "editHackathonJudges";  // This JSP should expect the right property names
    }

    // Save a new or updated judge
    @PostMapping
    public String saveHackathonJudge(@ModelAttribute HackathonJudgeEntity judge, Model model) {
        // Fetch HackathonEntity and UserEntity using the provided IDs
        if (judge.getHackathon() != null && judge.getHackathon().getHackathonId() != null) {
            judge.setHackathon(hackathonRepository.findById(judge.getHackathon().getHackathonId()).orElse(null));
        }
        if (judge.getUser() != null && judge.getUser().getUserId() != null) {
            judge.setUser(userRepository.findById(judge.getUser().getUserId()).orElse(null));
        }

        // Save the HackathonJudgeEntity
        hackathonJudgeRepository.save(judge);
        return "redirect:/hackathonJudges";
    }

    // Edit an existing judge
    @GetMapping("/edit/{id}")
    public String editHackathonJudgeForm(@PathVariable Long id, Model model) {
        Optional<HackathonJudgeEntity> judge = hackathonJudgeRepository.findById(id);
        if (judge.isPresent()) {
            model.addAttribute("judge", judge.get());
            model.addAttribute("hackathons", hackathonRepository.findAll());
            model.addAttribute("users", userRepository.findAll());
            return "editHackathonJudges";
        }
        return "redirect:/hackathonJudges";
    }

    // Delete a judge
    @GetMapping("/delete/{id}")
    public String deleteHackathonJudge(@PathVariable Long id) {
        hackathonJudgeRepository.deleteById(id);
        return "redirect:/hackathonJudges";
    }

    // View judge details
    @GetMapping("/view/{id}")
    public String viewHackathonJudge(@PathVariable Long id, Model model) {
        Optional<HackathonJudgeEntity> judge = hackathonJudgeRepository.findById(id);
        if (judge.isPresent()) {
            model.addAttribute("judge", judge.get());
            return "viewHackathonJudge";
        }
        return "redirect:/hackathonJudges";
    }
}