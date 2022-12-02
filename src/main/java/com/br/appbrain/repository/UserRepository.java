package com.br.appbrain.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.br.appbrain.model.domain.User;

public interface UserRepository extends CrudRepository<User, Integer>{
    
    @Query("from User us where us.email = :email")
    List<User> findByEmail(String email);

}
