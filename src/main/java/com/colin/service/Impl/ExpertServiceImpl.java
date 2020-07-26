package com.colin.service.Impl;

import com.colin.bean.Admin;
import com.colin.bean.Expert;
import com.colin.mapper.AdminMapper;
import com.colin.mapper.ExpertMapper;
import com.colin.service.AdminService;
import com.colin.service.ExpertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExpertServiceImpl implements ExpertService {

    @Autowired
    ExpertMapper expertMapper;

    @Override
    public Expert selectExpert(Expert expert) {
        return expertMapper.selectExpert(expert);
    }

    @Override
    public void insertExpert(Expert expert) {
        expertMapper.insertExpert(expert);
    }

    @Override
    public Integer selectCount() {
        return expertMapper.selectCount();
    }

    @Override
    public List<Expert> selectAllExpert(int i, int pageCount) {
        return expertMapper.selectAllExpert(i, pageCount);
    }

}
