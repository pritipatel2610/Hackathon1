package com.entity;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "hackathonJudges")
@Data
public class HackathonJudgeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long hackathonJudgeId;

    @ManyToOne
    @JoinColumn(name = "hackathonId", nullable = false)
    private HackathonEntity hackathon;
    
    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    private UserEntity user; // Assuming User is another entity

    @Column(nullable = false)
    private String role; // Role of the judge (e.g., lead judge, technical judge)
}