package com.br.appbrain.repository;

import org.springframework.data.repository.CrudRepository;

import com.br.appbrain.model.domain.Session;


public interface SessionRepository extends CrudRepository<Session, Integer>{
    
}
