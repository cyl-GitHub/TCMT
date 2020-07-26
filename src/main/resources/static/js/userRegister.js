function userRegister() {
    $.ajax({
        url: "/userController/userRegister", dataType: "json",
        async: false,
        type: "POST",
        contentType: "application/x-www-form-urlencoded",
        //向后端传输的数据
        data: {
            name: $("#name").val(),
            password: $("#password").val(),
            email:$("#email").val(),
            code: $("#code").val()
        },

        //处理后端返回的数据
        success: function (data) {
            if (data.result == "success") {
                alert("ok");
                $("#nameTips").html("");
                $("#passwordTips").html("");
                $("#emailTips").html("");
                $("#codeTips").html("");
                $("#submitTips").html("success");
                window.location.href = '/jspController/userLogin';
            } else if (data.result == "User name cannot be empty") {
                $("#nameTips").html(data.result);
                $("#passwordTips").html("");
                $("#emailTips").html("");
                $("#codeTips").html("");
                $("#submitTips").html("");

            } else if (data.result == "Password cannot be empty") {
                $("#passwordTips").html(data.result);
                $("#nameTips").html("");
                $("#emailTips").html("");
                $("#codeTips").html("");
                $("#submitTips").html("");

            } else if (data.result == "Password must be six or six digits More than") {
                $("#passwordTips").html(data.result);
                $("#nameTips").html("");
                $("#emailTips").html("");
                $("#codeTips").html("");
                $("#submitTips").html("");

            } else if (data.result == "Email cannot be empty") {
                $("#emailTips").html(data.result);
                $("#passwordTips").html("");
                $("#nameTips").html("");
                $("#codeTips").html("");
                $("#submitTips").html("");

            }else if (data.result == "Email format error") {
                $("#emailTips").html(data.result);
                $("#passwordTips").html("");
                $("#nameTips").html("");
                $("#codeTips").html("");
                $("#submitTips").html("");

            }else if (data.result == "Code cannot be empty") {
                $("#codeTips").html(data.result);
                $("#emailTips").html("");
                $("#passwordTips").html("");
                $("#nameTips").html("");
                $("#submitTips").html("");

            }else if (data.result == "Email registered") {
                $("#submitTips").html(data.result);
                $("#codeTips").html("");
                $("#emailTips").html("");
                $("#passwordTips").html("");
                $("#nameTips").html("");

            }
        },
        //处理失败返回的数据
        error: function (data) {
            // changeImg();
            $("#divAll").html(data.result);
        }
    })
}