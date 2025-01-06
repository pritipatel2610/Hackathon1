package com.entity;

import java.util.UUID;

import org.antlr.v4.runtime.misc.NotNull;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "users")
@Data
public class UserEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	private UUID userId;
	private String firstName;
	private String lastName;
	private String gender;
	private String email;
	private String password;
	private String contactNum;
	private String city;
	private String collegeName;
	private Integer courseId;//foreign key , dropdown
	private String semester;
	private String languageKnown; //take languages from languages table language column and push data in DB by comma separator , show all languages to user and user can Select multiple selection in Languages
	private String reference;
	private Integer roleId;// foreign key , dropdown
}