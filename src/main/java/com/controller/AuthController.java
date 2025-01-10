package com.controller;

import com.entity.LanguageEntity;
import com.entity.UserEntity;
import com.repository.CourseRepository;
import com.repository.LanguageRepository;
import com.repository.RoleRepository;
import com.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

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
            @RequestParam(value = "languageIds", required = false) List<Integer> languageIds,
            Model model) {

        // Check for existing email
        if (userRepository.findByEmail(user.getEmail()).isPresent()) {
            model.addAttribute("error", "Email already exists!");
            return "Signup";
        }

        // Handle null or empty languageIds
        String languageNames = "";
        if (languageIds != null && !languageIds.isEmpty()) {
            List<LanguageEntity> selectedLanguages = languageRepository.findAllById(languageIds);
            languageNames = selectedLanguages.stream()
                    .map(LanguageEntity::getLanguage)
                    .reduce((a, b) -> a + "," + b)
                    .orElse("");
        }

        // Set languages to the user
        user.setLanguageKnown(languageNames);

        // Set default role if not provided
        if (user.getRoleId() == null) {
            user.setRoleId(2); // Default "Student" role ID
        }

        // Save the user
        userRepository.save(user);

        model.addAttribute("message", "Registration successful!");
        return "Login";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "Login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {
        UserEntity user = userRepository.findByEmail(email)
                .orElse(null);

        if (user != null && user.getPassword().equals(password)) {
            model.addAttribute("user", user);
            session.setAttribute("user", user);
            return "Dashboard";
        } else {
            model.addAttribute("error", "Invalid email or password!");
            return "Login";
        }
    }
}