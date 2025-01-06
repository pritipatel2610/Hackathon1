package com.repository;

import com.entity.HackathonEntity;
import com.entity.TeamEntity;
import com.entity.UserEntity;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TeamRepository extends JpaRepository<TeamEntity, Long> {
    boolean existsByTeamName(String teamName); // To check if a team name is already in use

   Optional<TeamEntity> findByUserAndHackathon(UserEntity user,HackathonEntity hackathon);	
   Optional<TeamEntity> findByTeamName(String teamName);
}