package com.controller;

import com.entity.LanguageEntity;
import com.entity.UserEntity;
import com.repository.CourseRepository;
import com.repository.LanguageRepository;
import com.repository.RoleRepository;
import com.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private LanguageRepository languageRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private CourseRepository courseRepository;

    @GetMapping("/signup")
    public String signupPage(Model model) {
        model.addAttribute("languages", languageRepository.findAll());
        model.addAttribute("roles", roleRepository.findAll());
        model.addAttribute("courses", courseRepository.findAll());
        return "Signup";
    }

    @PostMapping("/signup")
    public String registerUser(
            @ModelAttribute UserEntity user,
            @RequestParam(value = "languageIds", required = false) List<Integer> languageIds
, // Accept language IDs from form
            Model model) {
        // Check for existing email
        if (userRepository.findByEmail(user.getEmail()).isPresent()) {
            model.addAttribute("error", "Email already exists!");
            return "Signup";
        }

        // Retrieve selected languages
        List<LanguageEntity> selectedLanguages = languageRepository.findAllById(languageIds);
        // Convert the list to a comma-separated string for storage
        String languageNames = selectedLanguages.stream()
                .map(LanguageEntity::getLanguage)
                .reduce((a, b) -> a + "," + b)
                .orElse("");

        // Set languages to the user
        user.setLanguageKnown(languageNames);
        if (user.getRoleId() == null) {
            user.setRoleId(2); // Set to the default "Student" role ID.
        }

        // Save the user
        userRepository.save(user);

        model.addAttribute("message", "Registration successful!");
        return "Login";
    }
}