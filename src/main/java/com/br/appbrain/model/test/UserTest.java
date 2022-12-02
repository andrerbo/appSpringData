package com.br.appbrain.model.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.br.appbrain.model.domain.User;
import com.br.appbrain.service.UserService;

@Component
@Order(1)
public class UserTest implements ApplicationRunner{

    @Autowired
    UserService userService; 

    @Override
    public void run(ApplicationArguments args) throws Exception {

        User user = new User();
        user.setName("andre");
        user.setEmail("andre@andre.com");
        user.setPassword("andre123");
        userService.addUser(user);
        System.out.println(user);

        User user2 = new User();
        user2.setName("ribeiro");
        user2.setEmail("ribeiro@ribeiro.com");
        user2.setPassword("ribeiro123");
        userService.addUser(user2);
        System.out.println(user2);

    }

}
