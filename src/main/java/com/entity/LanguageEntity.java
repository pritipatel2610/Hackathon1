package com.entity;
 
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "languages")
@Data
public class LanguageEntity
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Integer languageId; 
	private String language;

}
