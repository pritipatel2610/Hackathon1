package com.controller;

import com.repository.ProblemStatementRepository;
import com.entity.HackathonEntity;
import com.entity.ProblemStatementEntity;
import com.repository.HackathonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/problemStatements")
public class ProblemStatementController {

    @Autowired
    private ProblemStatementRepository problemStatementRepository;

    @Autowired
    private HackathonRepository hackathonRepository;

    // Display list of all Problem Statements
    @GetMapping
    public String viewProblemStatements(Model model) {
        List<ProblemStatementEntity> problemStatements = problemStatementRepository.findAll();
        model.addAttribute("problemStatements", problemStatements);
        return "ProblemStatement";  // View to show all problem statements
    }

    // Show form to add a new Problem Statement
    @GetMapping("/new")
    public String addProblemStatementForm(Model model) {
        model.addAttribute("hackathons", hackathonRepository.findAll()); // Hackathon list
        model.addAttribute("problemStatement", new ProblemStatementEntity()); // Empty entity for form binding
        return "editProblemStatement";  // View for adding/editing Problem Statement
    }

    // Save a new or updated Problem Statement
    @PostMapping
    public String saveProblemStatement(@ModelAttribute ProblemStatementEntity problemStatement) {
        // Here, Spring will automatically bind the selected hackathonId to the hackathon object
        // Ensure that the hackathon repository is used to fetch the Hackathon entity
        Optional<HackathonEntity> selectedHackathon = hackathonRepository.findById(problemStatement.getHackathon().getHackathonId());
        selectedHackathon.ifPresent(problemStatement::setHackathon);
        
        // Save the ProblemStatementEntity
        problemStatementRepository.save(problemStatement);
        return "redirect:/problemStatements";  // Redirect to list after saving
    }

    // Show form to edit an existing Problem Statement
    @GetMapping("/edit/{id}")
    public String editProblemStatementForm(@PathVariable Long id, Model model) {
        Optional<ProblemStatementEntity> problemStatement = problemStatementRepository.findById(id);
        if (problemStatement.isPresent()) {
            model.addAttribute("problemStatement", problemStatement.get());
            model.addAttribute("hackathons", hackathonRepository.findAll());
            return "editProblemStatement";  // View for editing Problem Statement
        }
        return "redirect:/problemStatements";  // Redirect if the problem statement doesn't exist
    }

    // Delete a Problem Statement
    @GetMapping("/delete/{id}")
    public String deleteProblemStatement(@PathVariable Long id) {
        problemStatementRepository.deleteById(id);  // Delete from repository
        return "redirect:/problemStatements";  // Redirect to list after delete
    }

    // View details of a Problem Statement
    @GetMapping("/view/{id}")
    public String viewProblemStatement(@PathVariable Long id, Model model) {
        Optional<ProblemStatementEntity> problemStatement = problemStatementRepository.findById(id);
        if (problemStatement.isPresent()) {
            model.addAttribute("problemStatement", problemStatement.get());
            return "viewProblemStatement";  // View for showing problem statement details
        }
        return "redirect:/problemStatements";  // Redirect if the problem statement doesn't exist
    }
}
