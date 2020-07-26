package com.colin.mapper;

import com.colin.bean.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    void insertUser(User user);

    User selectUser(User user);


    Integer selectCount();

    List<User> selectAllUser(int i, int pageCount);

    Integer selectCountExamine();

    List<User> selectUserExamine(int i, int pageCount);

    User selectUser1(String name, String email);

    void doExamine(String name, String email);

}
