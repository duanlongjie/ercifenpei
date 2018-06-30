package com.controller;

import com.domain.Person;
import com.service.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class Hello {
    @Resource
    private PersonService personService;
    @RequestMapping("hello")
    public String hello(Model model){
        System.out.println(1/0);
        Person person = personService.getPersonById(1);
        model.addAttribute("person",person);
        return "hello";
    }
}
