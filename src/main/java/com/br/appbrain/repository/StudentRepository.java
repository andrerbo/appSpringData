package com.br.appbrain.repository;

import org.springframework.data.repository.CrudRepository;

import com.br.appbrain.model.domain.Student;

public interface StudentRepository extends CrudRepository<Student, Integer>{
    
}
