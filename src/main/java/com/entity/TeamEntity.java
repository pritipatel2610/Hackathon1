package com.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "teams")
@Data
public class TeamEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long teamId;

    @Column(nullable = false, unique = true)
    private String teamName;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private TeamStatus status;
    
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserEntity user;

    @ManyToOne
    @JoinColumn(name = "hackathon_id", nullable = false)
    private HackathonEntity hackathon; // Assuming Hackathon entity exists

    public enum TeamStatus {
        IN_PROGRESS, ACCEPT, REJECT, DISQUALIFY
    }

    private String createdAt; 
    // Add more fields if needed, e.g., createdDate or createdBy
}