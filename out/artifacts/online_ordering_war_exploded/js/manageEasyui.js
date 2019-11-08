var left_calalog = [{
    text: '系统属性',
    // iconCls: 'fa fa-wpforms',
    state: 'open',
    children: [{
        text: '<a href="../jsp/html/aSystem.jsp" >系统属性</a>'
    }]
},
    {
        text: '基本操作',
        // iconCls: 'fa fa-at',
        selected: true,
        children: [{
            text: '<a href="../jsp/html/AdminUpdatepwd.jsp" >密码修改</a >'
        }, {
            text: '<a href="../jsp/html/AdminMaintain.jsp" >管理员维护</a >'
        }]
    },
    {
        text: '会员管理',
        iconCls: 'fa fa-table',
        children: [{
            text: '<a href="../jsp/html/AdminUser.jsp">会员管理</a >'
        }]
    },
    {
        text: '菜品类别管理',
        // iconCls: 'fa fa-at',
        selected: true,
        children: [{
            text: '<a href="../jsp/html/foodCatalog.jsp">类别管理</a>'
        }]
    },
    {
        text: '菜品管理',
        // iconCls: 'fa fa-at',
        selected: true,
        children: [{
            text: '<a href="../jsp/html/foods.jsp">菜品管理</a>'
        }, {
            text: '<a href="../jsp/html/FoodsSpecial.jsp">特价区</a>'
        }]
    },
    {
        text: '订单管理',
        // iconCls: 'fa fa-at',
        selected: true,
        children: [{
            text: '<a href="../jsp/html/Ordering.jsp">订单管理</a>'
        }]
    },
    {
        text: '留言管理',
        // iconCls: 'fa fa-at',
        selected: true,
        children: [{
            text: '<a href="../jsp/html/Gustbook.jsp">留言管理</a>'
        }]
    },
    {
        text: '公告管理',
        // iconCls: 'fa fa-at',
        selected: true,
        children: [{
            text: '<a href="../jsp/html/Notice.jsp">公告管理</a>'
        }]
    },
    {
        text: '<a href="#" id="tc">安全退出系统</a>'
    }
];

$(function () {
    $("a").click(function () {
        var url = this.href;
        var args = {"time": new Date()};
        // 所有的 html 节点均可调用 load 方法将返回内容直接加入到目标标签内
        console.log("---------"+url+"--------"+(url != "#"))
        if (this.id != "tc") {
            console.log(11)
            $("#showView").load(url, args);
            //不让a标签跳转页面
            return false;
        }else {
            console.log(22)
            window.location.href="../index.jsp";
        }
    });

});

