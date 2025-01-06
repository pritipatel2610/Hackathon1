package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.HackathonJudgeEntity;

@Repository
public interface HackathonJudgeRepository extends JpaRepository<HackathonJudgeEntity, Long> {
    // You can add custom queries if needed
}
