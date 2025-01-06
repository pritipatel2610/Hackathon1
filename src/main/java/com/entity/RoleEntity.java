package com.entity;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name="roles")
@Data
public class RoleEntity 
{
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Integer roleId;
	private String roleName;
	
	
}
