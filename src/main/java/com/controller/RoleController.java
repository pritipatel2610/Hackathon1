package com.controller;

import com.entity.RoleEntity;
import com.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class RoleController {

    @Autowired
    private RoleRepository roleRepository;

    // Display all roles
    @GetMapping("/roles")
    public String getAllRoles(Model model) {
        model.addAttribute("roles", roleRepository.findAll());
        return "role";
    }

    // Save a new role
    @PostMapping("/saveRole")
    public String saveRole(@ModelAttribute RoleEntity role) {
        roleRepository.save(role);
        return "redirect:/roles";
    }

    // Edit a role
    @GetMapping("/editRole")
    public String editRole(@RequestParam Integer id, Model model) {
        RoleEntity role = roleRepository.findById(id).orElse(null);
        model.addAttribute("role", role);
        model.addAttribute("roles", roleRepository.findAll());
        return "editRole";
    }

    // Update a role
    @PostMapping("/updateRole")
    public String updateRole(@ModelAttribute RoleEntity role) {
        roleRepository.save(role);
        return "redirect:/roles";
    }

    // Delete a role
    @GetMapping("/deleteRole")
    public String deleteRole(@RequestParam Integer id) {
        roleRepository.deleteById(id);
        return "redirect:/roles";
    }
}