package com.colin.service;

import com.colin.bean.User;

import java.util.List;

public interface UserService {
    void insertUser(User user);

    User selectUser(User user);

    Integer selectCount();

    List<User> selectAllUser(int i, int pageCount);

    List<User> selectUserExamine(int i, int pageCount);

    Integer selectCountExamine();

    User selectUser1(String name, String email);

    void doExamine(String name, String email);

    void userDelete(String name, String email);

}
