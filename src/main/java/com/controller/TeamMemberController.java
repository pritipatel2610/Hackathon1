package com.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Service.MailService;
import com.entity.TeamMembersEntity;
import com.entity.UserEntity;
import com.repository.TeamMembersRepository;
import com.repository.TeamRepository;
import com.repository.UserRepository;


@Controller
@RequestMapping("/teams")
public class TeamMemberController {
    @Autowired
    private TeamMembersRepository teamMembersRepository;
    @Autowired
    private TeamRepository teamRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private MailService mailService;

    @GetMapping("/list")
    public String listTeams(Model model) {
        model.addAttribute("teams", teamRepository.findAll());
        return "ListTeam";
    }
    @GetMapping("/addMember/{teamId}")
    public String showAddMemberForm(@PathVariable Long teamId, Model model) {
        model.addAttribute("teamId", teamId);
        return "AddTeamMember";
    }
    @PostMapping("/addMember")
    public String addMember(
            @RequestParam Long teamId,
            @RequestParam String email,
            @RequestParam String role,
            Model model) {
        // Check if the user exists
        UserEntity user = userRepository.findByEmail(email).orElse(null);
        if (user == null) {
            model.addAttribute("message", "User with email " + email + " does not exist.");
            return "AddTeamMember";
        }

        // Check if the team exists
        var team = teamRepository.findById(teamId).orElse(null);
        if (team == null) {
            model.addAttribute("message", "Team not found.");
            return "AddTeamMember";
        }

        // Check if the user is already part of another team for the same hackathon
        boolean isUserInAnotherTeam = teamMembersRepository.findByUser_UserId(user.getUserId())
                .stream()
                .anyMatch(member -> member.getTeam().getHackathon().getHackathonId().equals(team.getHackathon().getHackathonId()) &&
                        member.getStatus() == TeamMembersEntity.Status.ACCEPTED);
        if (isUserInAnotherTeam) {
            model.addAttribute("message", "User is already in another team for this hackathon.");
            return "AddTeamMember";
        }

        // Check if an invitation has already been sent
        boolean hasInvitation = teamMembersRepository.findByTeam_TeamId(teamId)
                .stream()
                .anyMatch(member -> member.getUser().getUserId().equals(user.getUserId()) &&
                        (member.getStatus() == TeamMembersEntity.Status.INVITED || member.getStatus() == TeamMembersEntity.Status.REJECTED));
        if (hasInvitation) {
            model.addAttribute("message", "Invitation has already been sent or rejected.");
            return "AddTeamMember";
        }

        // Create a new team member invitation
        TeamMembersEntity newMember = new TeamMembersEntity();
        newMember.setTeam(team);
        newMember.setUser(user);
        newMember.setRole(role);
        newMember.setStatus(TeamMembersEntity.Status.INVITED);
        teamMembersRepository.save(newMember);

        // Send an invitation email
        try {
            mailService.sendHackathonInvitationEmail(user.getUserId(), email, user.getFirstName(), "Hackathon 2025", role, teamId);
            model.addAttribute("message", "Invitation sent successfully to " + email);
        } catch (Exception e) {
            model.addAttribute("message", "Failed to send the email. Please try again.");
        }

        return "Invitation";
    }

    @GetMapping("/updateInvitation/{teamId}/{userId}/{status}")
    public String updateInvitation(
            @PathVariable Long teamId,
            @PathVariable UUID userId,
            @PathVariable int status,
            Model model) {
        try {
            TeamMembersEntity teamMember = teamMembersRepository
                    .findByTeam_TeamId(teamId)
                    .stream()
                    .filter(tm -> tm.getUser().getUserId().equals(userId))
                    .findFirst()
                    .orElse(null);

            if (teamMember == null) {
                model.addAttribute("message", "Invalid invitation or user.");
                return "Response";
            }

            if (status == 1) {
                teamMember.setStatus(TeamMembersEntity.Status.ACCEPTED);
                model.addAttribute("message", "You have accepted the invitation.");
            } else {
                teamMember.setStatus(TeamMembersEntity.Status.REJECTED);
                model.addAttribute("message", "You have rejected the invitation.");
            }

            teamMembersRepository.save(teamMember);
        } catch (Exception e) {
            model.addAttribute("message", "An error occurred while processing your response. Please try again.");
        }
        return "Response";
    }
    
    @GetMapping("/viewMembers/{teamId}")
    public String viewTeamMembers(@PathVariable Long teamId, Model model) {
        // Fetch all members of the specified team
        List<TeamMembersEntity> teamMembers = teamMembersRepository.findByTeam_TeamId(teamId);
        
        // Add team members to the model
        model.addAttribute("teamMembers", teamMembers);
        model.addAttribute("teamId", teamId);

        // Render the JSP for displaying team members
        return "TeamMembers";
    }
}