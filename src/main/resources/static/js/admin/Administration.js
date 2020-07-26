window.onload = function () {
    selectUser();
}


function selectUser() {
    $.ajax({
        url: "/userController/selectUser", dataType: "json",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        //向后端传输的数据
        data: JSON.stringify({
            id: 1
        }),
        //处理后端返回的数据
        success: function (data) {
            var count = data.class3.length;


        },
        //处理失败返回的数据
        error: function (data) {
        }
    })

}