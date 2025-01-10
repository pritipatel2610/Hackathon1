package com.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "team_members")
public class TeamMembersEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long teamMemberId;

    @ManyToOne
    @JoinColumn(name = "team_id", nullable = false)
    private TeamEntity team;

    private String role; 
    
    
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserEntity user;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Status status;

    public enum Status {
        INVITED,
        ACCEPTED,
        REJECTED
    }
}