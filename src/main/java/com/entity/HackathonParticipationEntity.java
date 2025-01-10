package com.entity;

import java.time.LocalDate;

import org.antlr.v4.runtime.misc.NotNull;

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
@Table(name = "hackathon_participation")
@Data
public class HackathonParticipationEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "hackathon_participation_id")
    private Long hackathonParticipationId;

    @ManyToOne
    @JoinColumn(name = "hackathon_id", nullable = false)
    private HackathonEntity hackathon;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserEntity user;
    
    
    private String role;
    

    @NotNull
    private LocalDate registrationDate;

    @NotNull // Ensure the paymentStatus cannot be null
    private PaymentStatus paymentStatus;
    	public enum PaymentStatus {
    		 PAID,
    		    NOT_PAID,
    		    PENDING
        }
    	
}