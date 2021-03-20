function Join() {
    $.ajax({
        url: "/expertController/doLogin", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            expertName: $("#expertName").val(),
            expertId: $("#expertId").val(),
            expertAddress: $("#expertAddress").val(),
            expertExcel: $("#expertExcel").val(),
            expertTelephone: $("#expertTel").val()
        }),
        //处理后端返回的数据
        success: function (data) {
            if (data.result == "success") {
                $("#divAll").html("");
                alert("审核提交成功,请等待客服联系!")
            } else if (data.result == "审核已提交,请勿重复提交!") {
                $("#divAll").html("");
                alert("审核已提交,请勿重复提交!")
            } else {
                $("#divAll").html(data.result);
            }
        },
        //处理失败返回的数据
        error: function (data) {
            changeImg();
            $("#divAll").html(data.result);
        }
    })
}

function KeyDown() {
    if (event.keyCode == 13) {
        var btn_login = document.getElementById("user-btn1");//id为登录按钮id
        btn_login.focus();
        btn_login.click();
    }
}







