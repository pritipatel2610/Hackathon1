package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.ProblemStatementEntity;

@Repository
public interface ProblemStatementRepository extends JpaRepository<ProblemStatementEntity, Long> {
    // You can add custom query methods here if needed
}
