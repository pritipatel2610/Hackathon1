package com.controller;

import com.entity.CourseEntity;
import com.repository.CourseRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class CourseController {

	
    @Autowired
    private CourseRepository courseRepository;

    /**
     * Display all courses.
     */
    @GetMapping("/courses")
    public String getAllCourses(Model model) {
        model.addAttribute("courses", courseRepository.findAll());
        return "course"; // Maps to course.jsp
    }

    /**
     * Show editCourse.jsp for updating a course.
     */
    @GetMapping("/editCourse")
    public String editCourse(@RequestParam("courseid") Integer courseId, Model model) {
        CourseEntity course = courseRepository.findById(courseId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid course ID: " + courseId));
        model.addAttribute("course", course);
        return "editCourse"; // Maps to editCourse.jsp
    }

    /**
     * Handle course update submission.
     */
    @PostMapping("/updateCourse")
    public String updateCourse(@RequestParam("courseid") Integer courseId,
                                @RequestParam("courseName") String courseName) {
        CourseEntity course = courseRepository.findById(courseId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid course ID: " + courseId));
        course.setCourseName(courseName);
        courseRepository.save(course);
        return "redirect:/courses";
    }

    /**
     * Add a new course.
     */
    @PostMapping("/addCourse")
    public String addCourse(@RequestParam("courseName") String courseName) {
        CourseEntity newCourse = new CourseEntity();
        newCourse.setCourseName(courseName);
        courseRepository.save(newCourse);
        return "redirect:/courses";
    }

    /**
     * Delete a course.
     */
    @GetMapping("/deleteCourse")
    public String deleteCourse(@RequestParam("courseid") Integer courseId) {
        courseRepository.deleteById(courseId);
        return "redirect:/courses";
    }
}