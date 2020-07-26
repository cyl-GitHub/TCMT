package com.colin.mapper;

import com.colin.bean.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {


    Admin selectAdmin(Admin admin);

}
