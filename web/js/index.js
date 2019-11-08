function sub() {
    console.log("saf");
    $.ajax({
        url: '/online_ordering/action/adminAction',
        dataType: 'text',
        type: 'GET',
        async: false,
        data: {
            "username": $("#username").val(),
            "password": $("#password").val()
        },
        success: function (result) {
            console.log("===============" + result + "=======");
            if (result.trim() == "登录成功") {
                window.location.href = 'jsp/manageEasyui.jsp';
            } else {
                alert("用户名或者密码不正确");
            }
            console.log(result);
        }
    });
}