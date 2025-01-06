package com.controller;

import com.entity.HackathonParticipationEntity;
import com.repository.HackathonParticipationRepository;
import com.repository.HackathonRepository;
import com.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/hackathonParticipations")
public class HackathonParticipationController {

    @Autowired
    private HackathonParticipationRepository hackathonparticipationRepository;

    @Autowired
    private HackathonRepository hackathonRepository;

    @Autowired
    private UserRepository userRepository;

    // Display list of all Hackathon Participations
    @GetMapping
    public String viewHackathonParticipations(Model model) {
        List<HackathonParticipationEntity> participations = hackathonparticipationRepository.findAll();
        model.addAttribute("participations", participations);
        return "hackathonParticipations";  // View to show all participations
    }

    // Show form to add a new HackathonParticipation
    @GetMapping("/new")
    public String addHackathonParticipationForm(Model model) {
        model.addAttribute("hackathons", hackathonRepository.findAll()); // Hackathon list
        model.addAttribute("users", userRepository.findAll()); // User list
        model.addAttribute("participation", new HackathonParticipationEntity()); // Empty entity for form binding
        return "editHackathonParticipation";  // View for adding/editing Hackathon Participation
    }

    // Save a new or updated HackathonParticipation
    @PostMapping
    public String saveHackathonParticipation(@ModelAttribute HackathonParticipationEntity participation, Model model) {
        // Fetch HackathonEntity and UserEntity using the provided IDs
        if (participation.getHackathon() != null && participation.getHackathon().getHackathonId() != null) {
            participation.setHackathon(hackathonRepository.findById(participation.getHackathon().getHackathonId()).orElse(null));
        }
        if (participation.getUser() != null && participation.getUser().getUserId() != null) {
            participation.setUser(userRepository.findById(participation.getUser().getUserId()).orElse(null));
        }

        // Save the HackathonParticipationEntity
        hackathonparticipationRepository.save(participation);
        return "redirect:/hackathonParticipations";  // Redirect to list after saving
    }

    // Show form to edit an existing HackathonParticipation
    @GetMapping("/edit/{id}")
    public String editHackathonParticipationForm(@PathVariable Long id, Model model) {
        Optional<HackathonParticipationEntity> participation = hackathonparticipationRepository.findById(id);
        if (participation.isPresent()) {
            model.addAttribute("participation", participation.get());
            model.addAttribute("hackathons", hackathonRepository.findAll());
            model.addAttribute("users", userRepository.findAll());
            return "editHackathonParticipation";  // View for editing Hackathon Participation
        }
        return "redirect:/hackathonParticipations";  // Redirect if the participation doesn't exist
    }

    // Delete a HackathonParticipation
    @GetMapping("/delete/{id}")
    public String deleteHackathonParticipation(@PathVariable Long id) {
    	hackathonparticipationRepository.deleteById(id);  // Delete from repository
        return "redirect:/hackathonParticipations";  // Redirect to list after delete
    }

    // View details of a HackathonParticipation
    @GetMapping("/view/{id}")
    public String viewHackathonParticipation(@PathVariable Long id, Model model) {
        Optional<HackathonParticipationEntity> participation = hackathonparticipationRepository.findById(id);  // Corrected
        if (participation.isPresent()) {
            model.addAttribute("participation", participation.get());
            return "viewHackathonParticipation";  // View for showing participation details
        }
        return "redirect:/hackathonParticipations";  // Redirect if the participation doesn't exist
    }
}
