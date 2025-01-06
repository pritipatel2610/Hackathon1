package com.controller;

import com.entity.UserEntity;
import com.repository.UserRepository;
import com.repository.CourseRepository;
import com.repository.LanguageRepository;
import com.repository.RoleRepository;
import com.entity.LanguageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private LanguageRepository languageRepository;
    
    @Autowired
    private CourseRepository courseRepository;
    
    @Autowired
    private RoleRepository roleRepository;

    @GetMapping("/users")
    public String getAllUsers(Model model) {
        model.addAttribute("users", userRepository.findAll());
        model.addAttribute("languages", languageRepository.findAll());
        model.addAttribute("courses", courseRepository.findAll());  // Add to model
        model.addAttribute("roles", roleRepository.findAll());  
        // Add to model
        return "user"; // Maps to user.jsp
    }

    @GetMapping("/editUser")
    public String editUser(@RequestParam("userId") UUID userId, Model model) {
        UserEntity user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user ID: " + userId));
        model.addAttribute("user", user);
        model.addAttribute("languages", languageRepository.findAll());
        model.addAttribute("courses", courseRepository.findAll());  // Add to model
        model.addAttribute("roles", roleRepository.findAll());      // Add to model
        return "editUser"; // Maps to editUser.jsp
    }

    @PostMapping("/addUser")
    public String addUser(UserEntity userEntity, @RequestParam("languageKnown") List<String> languages) {
        // Convert the list of selected languages to a comma-separated string
        String languageKnown = String.join(",", languages);
        userEntity.setLanguageKnown(languageKnown);
        userRepository.save(userEntity);
        return "redirect:/users";
    }

    @PostMapping("/updateUser")
    public String updateUser(UserEntity updatedUser, @RequestParam("languageKnown") List<String> languages) {
        // Convert the list of selected languages to a comma-separated string
        String languageKnown = String.join(",", languages);
        updatedUser.setLanguageKnown(languageKnown);
        userRepository.save(updatedUser);
        return "redirect:/users";
    }

    @GetMapping("/deleteUser")
    public String deleteUser(@RequestParam("userId") UUID userId) {
        userRepository.deleteById(userId);
        return "redirect:/users";
    }
}