package com.service.impl;

import com.domain.Person;
import com.mapper.PersonMapper;
import com.service.PersonService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {
    @Resource
    private PersonMapper personMapper;
    @Override
    public List<Person> getAllPersons() {
        return null;
    }
    @Override
    public Person getPersonById(Integer id) {
        Person person = personMapper.selectByPrimaryKey(id);
        return person;
    }
}
