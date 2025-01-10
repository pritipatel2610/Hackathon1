package com.controller;

import com.entity.HackathonEntity;
import com.entity.TeamEntity;
import com.entity.UserEntity;
import com.repository.HackathonRepository;
import com.repository.TeamRepository;

import jakarta.servlet.http.HttpSession;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/teams")
public class TeamController {

	@Autowired
	private TeamRepository teamRepository;

	@Autowired
	private HackathonRepository hackathonRepository; // Add this line to access Hackathons

	// GET - Render Create Team Page
	@GetMapping("/create")
	public String showCreateTeamPage(Model model) {
		// Fetch all hackathons from the repository
		List<HackathonEntity> hackathons = hackathonRepository.findAll();

		// Add the hackathons list to the model so it can be accessed in the JSP
		model.addAttribute("hackathons", hackathons);

		return "CreateTeam"; // Corresponds to CreateTeam.jsp
	}

	// POST - Handle Create Team Form Submission
	@PostMapping("/create")
	public String createTeam(@RequestParam("teamName") String teamName, @RequestParam("hackathonId") Long hackathonId,
			Model model, HttpSession session) {
		 
		UserEntity user = (UserEntity) session.getAttribute("user");
		
		HackathonEntity selectedHackathon = hackathonRepository.findById(hackathonId).orElse(null);

		Optional<TeamEntity> optaionalTeam = teamRepository.findByUserAndHackathon(user, selectedHackathon);
		
		model.addAttribute("teamName",teamName);
		
		if (optaionalTeam.isPresent()) 
		{
			model.addAttribute("error", "Team Already Created For Selected Hackathon");
			
			List<HackathonEntity> hackathons = hackathonRepository.findAll();

			// Add the hackathons list to the model so it can be accessed in the JSP
			model.addAttribute("hackathons", hackathons);
			
			return "CreateTeam";
		}
		optaionalTeam = teamRepository.findByTeamName(teamName);
		
		if (optaionalTeam.isPresent()) {
			model.addAttribute("error", "Team Name Already Taken By Other Team");
			
			List<HackathonEntity> hackathons = hackathonRepository.findAll();

			// Add the hackathons list to the model so it can be accessed in the JSP
			model.addAttribute("hackathons", hackathons);
			
			return "CreateTeam";
		}
		// Create and save the new team
		TeamEntity team = new TeamEntity();
		team.setTeamName(teamName);
		team.setUser(user);
		team.setCreatedAt(LocalDate.now().toString());
//        team.setCurrentMembers(1); // Assume the creator is the first member
//        team.setMaxMembers(5); // Default max members, can be adjusted dynamically
		team.setStatus(TeamEntity.TeamStatus.IN_PROGRESS);
		// Set the hackathon for the team (you can adjust this logic as needed)
		team.setHackathon(selectedHackathon);

		teamRepository.save(team);

		model.addAttribute("success", "Team created successfully!");
		return "redirect:/Dashboard"; // Redirect to dashboard after successful creation
	}
	
	@GetMapping("/Dashboard")
    public String showDashboard(Model model) {
        // Add any necessary attributes to the model
        return "Dashboard"; // Make sure the "Dashboard" view exists (either Dashboard.jsp or Dashboard.html)
    }
}