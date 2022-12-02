package com.br.appbrain.repository;

import org.springframework.data.repository.CrudRepository;

import com.br.appbrain.model.domain.Subject;


public interface SubjectRepository extends CrudRepository<Subject, Integer>{
    
}
