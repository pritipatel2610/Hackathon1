package com.repository;

import com.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<RoleEntity, Integer> {
	 RoleEntity findByRoleName(String roleName);
}
