function login() {
    $.ajax({
        url: "/userController/doLogin", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            name: $("#name").val(),
            email: $("#email").val(),
            telephone: $("#tel").val(),
            description: $("#description").val(),
            address: $("#address").val(),
            code: $("#code").val()
        }),
        //处理后端返回的数据
        success: function (data) {
            if (data.result == "success") {
                alert("Information submitted successfully, please wait for customer service contact!")
            } else if (data.result == "信息已提交,请勿重复提交!") {
                alert("Information has been submitted, please do not submit again!")
            } else if (data.result == "验证码错误") {
                changeImg();
                $("#divUser").html("");
                $("#divId").html("");
                $("#divAll").html("Verification code error!");
            } else {
                changeImg();
                $("#divUser").html("");
                $("#divId").html("");
                $("#divAll").html("Information cannot be empty!");
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







