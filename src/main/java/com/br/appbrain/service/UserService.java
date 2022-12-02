package com.br.appbrain.service;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.br.appbrain.model.domain.User;
import com.br.appbrain.repository.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    
    public User checkUser(String email, String password){
        List<User> userList = userRepository.findByEmail(email);
        
        if (userList.size() > 0){
            User user = userList.get(0);
            
            if(user != null && user.getPassword().equals(password)){
                user.setLastLogin(LocalDateTime.now());
                return user;
            } 

        }
        
        return null;
    }


    public void addUser(User user){
        userRepository.save(user);
        System.out.println("User added successfuly");
    }


    public Collection<User> getUsers(){
        return (Collection<User>) userRepository.findAll();
    }

}
