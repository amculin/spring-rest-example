package com.demo.movie.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.movie.entities.Actor;

public interface ActorRepository extends JpaRepository<Actor, Long> {
    
}