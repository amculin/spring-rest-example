package com.demo.movie.entities;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter //Untuk Set Paramater
@Getter //Untuk Get Paramater
@Entity //Untuk Memberikan Identitas Data yang mengakses ke Database

public class Actor {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE) // Untuk Menggenerate AutoIncrement
    private Short id;
	
	@Column(name = "first_name")
	private String first_name;

	@Column(name = "last_name")
	private String last_name;
}
