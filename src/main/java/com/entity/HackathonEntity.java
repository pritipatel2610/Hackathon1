package com.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "hackathon")
@Data
public class HackathonEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long hackathonId;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private Integer minTeam;

    @Column(nullable = false)
    private LocalDate startDate;

    @Column(nullable = false)
    private LocalDate endDate;

    @Column(nullable = false)
    private LocalDate registrationDeadline;

    @Column(nullable = false)
    private String location;

    @Column(nullable = false)
    private Integer maxTeamSize;

    @Column(nullable = false)
    private Integer minTeamSize;

    @Column
    private String rules;

    @Column
    private String prizes;

    @Column
    private String judgingCriteria;

    @Column
    private String sponsors;

    @Column(nullable = false)
    private String contact;

    @Column(nullable = false)
    private Integer totalSubmission = 0;

    @Column(nullable = false)
    private Boolean submissionAllow = true;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Status status;

    @Column(nullable = false)
    private Double registrationFee;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private EventType eventType;

    @Column(nullable = false)
    private Integer totalTeams = 0;

    @ElementCollection
    private List<String> externalLinks;

    @Column(nullable = false)
    private Integer maxRegistrations;

    public enum Status {
        UPCOMING, ONGOING, COMPLETED
    }

    public enum EventType {
        ONLINE, OFFLINE, HYBRID
    }
}