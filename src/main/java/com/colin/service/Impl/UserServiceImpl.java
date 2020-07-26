package com.colin.service.Impl;

import com.colin.bean.User;
import com.colin.mapper.UserMapper;
import com.colin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    @Override
    public User selectUser(User user) {
      return  userMapper.selectUser(user);
    }

    @Override
    public Integer selectCount() {
        return userMapper.selectCount();
    }

    @Override
    public List<User> selectAllUser(int i, int pageCount) {
        return userMapper.selectAllUser( i, pageCount);
    }

    @Override
    public List<User> selectUserExamine(int i, int pageCount) {
        return userMapper.selectUserExamine( i, pageCount);
    }

    @Override
    public Integer selectCountExamine() {

        return userMapper.selectCountExamine();
    }

    @Override
    public User selectUser1(String name, String email) {
        return  userMapper.selectUser1(name,email);
    }

    @Override
    public void doExamine(String name, String email) {
        userMapper.doExamine(name, email);
    }


}
