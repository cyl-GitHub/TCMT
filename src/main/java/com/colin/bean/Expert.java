package com.colin.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Expert {

    private String expertName;//专家姓名
    private int expertId;//执业编号
    private String expertAddress;//所在地
    private String expertExcel;//医学擅长
    private String expertTelephone;//联系方式
    private String examine;//审核

}
