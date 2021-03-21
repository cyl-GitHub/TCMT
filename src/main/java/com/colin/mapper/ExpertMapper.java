package com.colin.mapper;

import com.colin.bean.Expert;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExpertMapper {


    Expert selectExpert(Expert expert);

    void insertExpert(Expert expert);

    Integer selectCount();

    List<Expert> selectAllExpert(int i, int pageCount);

    Integer selectCountExamine();

    List<Expert> selectExpertExamine(int i, int pageCount);

}
