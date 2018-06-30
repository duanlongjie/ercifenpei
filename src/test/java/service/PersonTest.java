package service;


import com.domain.Person;
import com.service.PersonService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试
@ContextConfiguration(locations={"classpath*:config/*/spring-mybatis.xml"})
public class PersonTest {
    @Resource
    private PersonService personService;
    @Test
    public void findByIdTest(){
        Person person =
                personService.getPersonById(1);
        System.out.println(person.getName());
    }
}
