package com.entity;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "ProblemStatement")
@Data
public class ProblemStatementEntity
{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long problemStatementId;

    @ManyToOne
    @JoinColumn(name = "hackathonId", nullable = false)
    private HackathonEntity hackathon;  // Assuming Hackathon is another entity class

    private String title;
    private String description;
    // Enum type for difficulty level, with default value set

    private String refDocUrl;
    private String techStack;
    private boolean visible;

    
   
}
