package com.demo.movie.services;

import java.util.List;
import com.demo.movie.entities.Actor;

public interface ActorService {
    
    List<Actor> findAll();
    Actor findById(Short id);
    Actor update(Short id, Actor actor);
    Actor create(Actor actor);
    void delete(Short id);
}