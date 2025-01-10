package com.controller;

import com.Service.MailService;
import com.entity.UserEntity;
import com.repository.UserRepository;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.mail.MessagingException;

@Controller
@RequestMapping("/invitation")
public class InvitationController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MailService mailService;

    @GetMapping("/send")
    public String sendInvitation(@RequestParam String email, @RequestParam String role, @RequestParam Long teamId, Model model) {
        // Check if the user exists
        Optional<UserEntity> optionalUser = userRepository.findByEmail(email);
        if (optionalUser.isPresent()) {
            UserEntity user = optionalUser.get();
            try {
                mailService.sendHackathonInvitationEmail(null, email, user.getFirstName(), "Hackathon 2025", role, teamId);
                model.addAttribute("message", "Invitation sent successfully!");
                model.addAttribute("email", email);
                model.addAttribute("role", role);
                return "Invitation";
            } catch (MessagingException e) {
                model.addAttribute("error", "Failed to send email. Please try again later.");
                return "Invitation";
            }
        } else {
            model.addAttribute("error", "User with email " + email + " does not exist.");
            return "Invitation";
        }
    }
}