package com.controller;

import com.entity.LanguageEntity;
import com.repository.LanguageRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LanguageController {

    @Autowired
    private LanguageRepository languageRepository;

    /**
     * Display all languages.
     */
    @GetMapping("/languages")
    public String getAllLanguages(Model model) {
        model.addAttribute("languages", languageRepository.findAll());
        return "language"; // Maps to language.jsp
    }

    /**
     * Show editLanguage.jsp for updating a language.
     */
    @GetMapping("/editLanguage")
    public String editLanguage(@RequestParam("languageId") Integer languageId, Model model) {
        LanguageEntity language = languageRepository.findById(languageId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid language ID: " + languageId));
        model.addAttribute("language", language);
        return "editLanguage"; // Maps to editLanguage.jsp
    }

    /**
     * Handle language update submission.
     */
    @PostMapping("/updateLanguage")
    public String updateLanguage(@RequestParam("languageId") Integer languageId,
                                  @RequestParam("language") String languageName) {
        LanguageEntity language = languageRepository.findById(languageId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid language ID: " + languageId));
        language.setLanguage(languageName);
        languageRepository.save(language);
        return "redirect:/languages";
    }

    /**
     * Add a new language.
     */
    @PostMapping("/addLanguage")
    public String addLanguage(@RequestParam("language") String languageName) {
        LanguageEntity newLanguage = new LanguageEntity();
        newLanguage.setLanguage(languageName);
        languageRepository.save(newLanguage);
        return "redirect:/languages";
    }

    /**
     * Delete a language.
     */
    @GetMapping("/deleteLanguage")
    public String deleteLanguage(@RequestParam("languageId") Integer languageId) {
        languageRepository.deleteById(languageId);
        return "redirect:/languages";
    }
}