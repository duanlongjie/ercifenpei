package com.service;

import com.domain.Person;

import java.util.List;

public interface PersonService {
    /**
     *
     * @return
     */
      List<Person> getAllPersons();
      Person getPersonById(Integer id);
}
