package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.TeamMembersEntity;


public interface TeamMembersRepository extends JpaRepository<TeamMembersEntity, Long> {
    // Custom query methods can be added if needed
	List<TeamMembersEntity> findByTeam_TeamId(Long teamId);
}