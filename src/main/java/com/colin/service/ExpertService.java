package com.colin.service;

import com.colin.bean.Admin;
import com.colin.bean.Expert;
import com.colin.bean.User;

import java.util.List;

public interface ExpertService {


    Expert selectExpert(Expert expert);

    void insertExpert(Expert expert);

    Integer selectCount();

    List<Expert> selectAllExpert(int i, int pageCount);

    Integer selectCountExamine();

    List<Expert> selectExpertExamine(int i, int pageCount);

}
