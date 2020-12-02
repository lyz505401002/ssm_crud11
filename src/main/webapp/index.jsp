<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/26
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="static/js/jquery-1.12.4.min.js"></script>
    <%--引入bootstrap的样式--%>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <%--引入引入bootstrap的js文件--%>
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<%-- 修改用户模态框 --%>
<div class="modal fade" id="my_update_emp_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myUpdateModel">修改员工</h4>
            </div>
            <%--模态框的内容--%>
            <div class="modal-body">
                <%--复制一个表单进来 给每个表单项添加name 属性 属性值要和员工类的属性名保持一致--%>
                <form class="form-horizontal" id="emp_form_update">
                    <div class="form-group">
                        <label for="emp_name_input" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <%--使用一个静态组件，只用来展示姓名--%>
                            <p class="form-control-static" id="update_emp_name"></p>
                            <%--添加一个span标签，用来展示校验的文字信息 class="help-block" 这属性必须要有，文字信息提示信息，我们代码动态添加--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emp_email_input" class="col-sm-2 control-label">员工邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="update_emp_email_input"
                                   placeholder="请输入你的邮箱">
                            <%--添加一个span标签，用来展示校验的文字信息 class="help-block" 这属性必须要有，文字信息提示信息，我们代码动态添加--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--复制一个性别的内联单选按钮--%>
                    <div class="form-group">
                        <label for="emp_email_input" class="col-sm-2 control-label">员工性别</label>
                        <div class="col-sm-10">
                            <%--把单选按钮的代码复制到这里 M 代表男 F 代表女--%>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio3" value="M"
                                       checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio4" value="F">
                                女
                            </label>
                        </div>
                    </div>
                    <%--复制下拉框--%>
                    <div class="form-group">
                        <label for="emp_email_input" class="col-sm-2 control-label">员工部门</label>
                        <div class="col-sm-10">
                            <%--把下拉按钮粘贴到这里 这里保存部门id即可--%>
                            <select class="form-control" name="dId" id="update_deptsInfo_select">
                                <%-- <option>这里的部门名称option项是从数据库查询出来展示的</option>--%>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_emp_btn">修改</button>
            </div>
        </div>
    </div>
</div>

<%--我们用来保存用户的模态框--%>
<div class="modal fade" id="my_add_emp_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="emp_form">
                    <div class="form-group">
                        <label for="emp_name_input" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input name="empName" type="text" class="form-control" id="emp_name_input"
                                   placeholder="请输入姓名">
                            <%--表单校验的提示文字--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emp_email_input" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input name="email" type="email" class="form-control" id="emp_email_input"
                                   placeholder="Email">
                            <%--表单校验的提示文字--%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">

                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input name="gender" type="radio" name="inlineRadioOptions" id="inlineRadio1"
                                       value="M" checked>
                                男
                            </label>
                            <label class="radio-inline">
                                <input name="gender" type="radio" name="inlineRadioOptions" id="inlineRadio2"
                                       value="N">
                                女
                            </label>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="deptsInfo_select" name="dId">
                                <%--  <option>开发部</option>
                                  <option>测试部</option>--%>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save_emp_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CROD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <button type="button" class="btn btn-success" id="add_emp_btn">添加</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row" style="margin-top: 10px">
        <div class="col-md-12">
            <table class="table table-striped table-hover table-bordered" id="emps_table">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <%--这里面的员工信息内容通过代码动态生成--%>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info_text">
            <%--分页文字信息动态生成--%>
        </div>
        <div class="col-md-6 col-md-offset-6" id="page_info_bar">
            <%--分页按钮信息动态生成--%>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function () {
        to_page(1);
//添加员工
        $('#add_emp_btn').click(function () {
            //alert("来了")
            //0. 在打开模态框的时候，先清除掉表单中的旧信息
            document.getElementById("emp_form").reset(); //使用原生的js重置一下表单
            //清除旧的文字提示信息
            $("#emp_name_input").next("span").text("");
            $("#emp_email_input").next("span").text("");
            //清除表单的样式
            $("#emp_name_input").parent().removeClass("has-error has-success");
            $("#emp_email_input").parent().removeClass("has-error has-success");

            //1.当模态框弹出的时候，去发送ajax请求，查询部门信息，显示在下拉列表中，我们抽取一个方法
            getDepts();
            $('#my_add_emp_Modal').modal({
                backdrop: false  //这个是模态框的设置的属性，表示点击背景模态框不消失
            })
        });
//跳转到哪一页
        function to_page(pageNum) {
            $.ajax({
                url: "${pageContext.request.contextPath}/emps",
                data: "pageNum=" + pageNum, //拼接上传进来的页码
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    //解析员工的信息展示，抽取个方法
                    parseEmpsInfo(result);
                    //解析分页数据，抽取个方法
                    parseLimitInfo(result)
                    //解析分页条的信息
                    parseLimitBarInfo(result)
                }
            });
        }
//解析员工的信息展示
        function parseEmpsInfo(result) {
            $("#emps_table tbody").empty();
            //取出员工的数据
            var emps = result.pageInfoMap.pageInfo.list;
            //alert(emps);
            //遍历员工数组
            $.each(emps, function (index, item) {
                //创建td单元格，给单元格中添加员工的信息
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender == 'M' ? "男" : "女");
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                //创建一个修改的按钮
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm btn-info edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                //我们给编辑按钮，添加一个属性，把id值给这个属性，为了在查询员工时，能拿到这个员工的id
                editBtn.attr('emp_id', item.empId);
                //创建一个删除的按钮
                var delBtn = $("<button></button>").addClass("btn btn-primary btn-sm btn-warning")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                //创建一个单元格，把编辑按钮和删除按钮放到td中
                var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                //把上面的td 添加到tr中
                //append方法执行完成以后还是返回原来的元素
                $("<tr></tr>")
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    //把这个tr放到tbody标签中 给table标签添加一个id属性值是emps_table
                    .appendTo("#emps_table tbody");
            })
        }
//解析分页数据parseLimitInfo(result)
        function parseLimitInfo(result) {
            $("#page_info_text").empty();
            //给分页信息的div 加个id属性
            $("#page_info_text").append("当前" + result.pageInfoMap.pageInfo.pageNum + "页,总" +
                result.pageInfoMap.pageInfo.pages + "页,总" +
                result.pageInfoMap.pageInfo.total + "条记录");
            //把当前页码赋值给一个全局变量
            currentpage= result.pageInfoMap.pageInfo.pageNum;
        }
//解析分页条的信息
        function parseLimitBarInfo(result) {
            $("#page_info_bar").empty();
            //创建ul标签，并添加class属性值
            var ul = $("<ul></ul>").addClass("pagination");
            //创建首页li标签和上一页标签
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("上一页"));
            if (result.pageInfoMap.pageInfo.hasPreviousPage == false) {
                firstPageLi.addClass("disabled")
                prePageLi.addClass("disabled");
            } else {
                firstPageLi.click(function () {
                    to_page(1)
                });
                prePageLi.click(function () {
                    to_page(result.pageInfoMap.pageInfo.pageNum - 1)
                });
            }
            //创建下一页和末页 li 标签
            var nextPageLi = $("<li></li>").append($("<a></a>").append("下一页"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
            if (result.pageInfoMap.pageInfo.hasNextPage == false) {
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            } else {
                //如果还有下一页给下一页按钮和末页按钮绑定点击事件
                nextPageLi.click(function () {
                    to_page(result.pageInfoMap.pageInfo.pageNum + 1)
                });
                lastPageLi.click(function () {
                    to_page(result.pageInfoMap.pageInfo.pages)
                });
            }
            //把首页 和 上一页 li 添加到 ul中
            ul.append(firstPageLi).append(prePageLi);
            //创建连续页码li，并把页码加进去
            var numsArr = result.pageInfoMap.pageInfo.navigatepageNums; //取出页码的数组
            $.each(numsArr, function (index, item) { //创建连续页码li，并把页码加进去
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                numLi.click(function () {
                    to_page(item)
                })
                //把每一个页码li加到ul中
                ul.append(numLi);
            })
            //把下一页的li和末页的li添加到ul中
            ul.append(nextPageLi).append(lastPageLi);

            //创建nav标签 并把ul加入到nav
            var navEle = $("<nav></nav>").append(ul);

            //最后把 nav 标签添加到 div中 给div添加个id属性值page_info_bar
            navEle.appendTo("#page_info_bar");

        }
//发送Ajax请求，查询所有的部门名
        function getDepts() {
            $("#deptsInfo_select").empty();
            $.ajax({
                url: "${pageContext.request.contextPath}/depts",
                type: "GET",
                success: function (result) {
                    //先打印一下后台返回的结果
                    console.log(result);
                    //遍历返回的json数据，取出对应的数据
                    $.each(result.pageInfoMap.depts,function () {
                        //构建option标签 并给option标签之间添加内容和value属性 this表示数组中的元素
                        var operationTag=$('<option></option>').append(this.deptName).attr('value',this.deptId);
                        //把option标签对象添加到select标签之间
                        operationTag.appendTo("#deptsInfo_select")
                    })
                }
            });

        }
//保存员工
        $('#save_emp_btn').click(function () {
            //0.先抽取一个校验用户名和邮箱的的方法，进行校验
            var flag=validate_add_form();
            if(flag==false){ //如果校验的结果是false 就结束，不要发送请求去保存员工
                return;
            }
            //1.点击保存按钮发送ajax请求，将模态框中填写的员工信息发送给后台
            var dataStr=$('#emp_form').serialize(); //收集所有表单项的数据为一个 key=value 形式的字符串
            //2.把表单数据发往后台
            $.ajax({
                url: "${pageContext.request.contextPath}/emp",
                type: "POST", //请求方式为POST 表示保存员工
                data: dataStr, //所有表单项中的数据
                success: function (result) {
                    alert(result.msg);
                    //1.关闭模态框
                    $('#my_add_emp_Modal').modal('hide');
                    //2.跳转到最后一页，显示刚才添加的员工数据
                    //分页插件，当你传入的这个页码大于最后一页，就会给你请求最后一页的数据，我就随便给了值，当然你要确定没有9999页
                    to_page(9999);

                    //3.顺便把表单重置一下
                    document.getElementById("emp_form").reset();
                }
            });
        });
// 校验用户名和邮箱
        function validate_add_form() {
            //1、拿到要校验的数据，使用正则表达式
            var empName = $("#emp_name_input").val();
            //正则表达式可以是字母数组或者中文
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
            if (!regName.test(empName)) {
                // alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                $("#emp_name_input").parent().removeClass("has-error has-success");
                //校验失败，我们给input的父级别的元素，加上.has-error 这个class属性，并给span标签添加文字提示信息
                $("#emp_name_input").parent().addClass("has-error"); //注意不要写成 .has-error 小圆点不要写
                $("#emp_name_input").next("span").text("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                return false;
            }else{
                $("#emp_name_input").parent().removeClass("has-error has-success");
                //校验成功，给我们给input的父级别的元素，加上 .has-success 这个class属性，并给span标签添加文字提示信息
                $("#emp_name_input").parent().addClass("has-success");
                $("#emp_name_input").next("span").text("用户名可以使用");

            }
            //2、校验邮箱信息
            var email = $("#emp_email_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regEmail.test(email)) {
                //alert("邮箱格式不正确");
                $("#emp_email_input").parent().removeClass("has-error has-success");
                $("#emp_email_input").parent().addClass("has-error"); //注意不要写成 .has-error 小圆点不要写
                $("#emp_email_input").next("span").text("邮箱格式有误");
                return false;
            }else{
                $("#emp_email_input").parent().removeClass("has-error has-success");
                $("#emp_email_input").parent().addClass("has-success");
                $("#emp_email_input").next("span").text("邮箱可以使用");

            }
            return true;
        }
//校验用户名是否存在
        $("#emp_name_input").change(function () {
            //alert("表单内容改变了");
            //发送ajax请求，把员工名发送到后台进行校验
            $.ajax({
                url: "${pageContext.request.contextPath}/checkEmpName",
                type: "POST",
                data:"empName="+ $("#emp_name_input").val(), //拼接上员工姓名
                success: function (result) {
                    //根据返回的结果，在页面进行相应的提示
                    //alert(result.code);
                    if(result.code==200){ //用户名存在不能保存
                        //给出提示禁用掉保存按钮
                        //先清除之前的样式
                        $("#emp_name_input").parent().removeClass("has-error has-success");
                        $("#emp_name_input").parent().addClass("has-error"); //注意不要写成 .has-error 小圆点不要写
                        $("#emp_name_input").next("span").text("用户名已存在请重新输入");
                        $('#save_emp_btn').prop('disabled', true); //禁用保存按钮 --变灰，且不能调用点击事件
                    }else{//
                        $("#emp_name_input").parent().removeClass("has-error has-success");
                        $("#emp_name_input").parent().addClass("has-success");
                        $("#emp_name_input").next("span").text("");//清空旧的提示信息
                        $('#save_emp_btn').prop('disabled',false); //启用按钮
                    }
                }
            });

        });
//使用 on方法，给document文档对象中的子元素绑定事件
        $(document).on('click','.edit_btn',function () {
            //查询部门信息
            getDeptsForUpdate();
            //查询员工的信息
            var id = $(this).attr('emp_id'); //获取编辑按钮的emp_id的属性值
            ///////////顺便把员工的id给修改按钮，等会点击修改时，就可以用到
            $('#update_emp_btn').attr('emp_id_update_btn',id);
            //抽取一个方法，来根据员工的id查询出员工的信息
            getEmpInofById(id)
            //弹出模态框
            $('#my_update_emp_Modal').modal({
                backdrop: false //false 的意思是点击模态框以外的区域，模态框不消失
            })
        });
//查询部门名称，展示到修改的模特框里面
        function getDeptsForUpdate() {
            //清空修改模态框的之前下拉列表的值
            $("#update_deptsInfo_select").empty();
            $.ajax({
                url: "${pageContext.request.contextPath}/depts",
                type: "GET",
                success: function (result) {
                    //先打印一下后台返回的结果
                    console.log(result);
                    //{"code":100,"msg":"处理成功","pageInfoMap":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
                    //遍历返回的json数据，取出对应的数据
                    $.each(result.pageInfoMap.depts, function () {
                        //构建option标签 并给option标签之间添加内容和value属性 this表示数组中的元素
                        var operationTag = $('<option></option>').append(this.deptName).attr('value', this.deptId);
                        //把option标签对象添加修改模态框的到select标签之间
                        operationTag.appendTo("#update_deptsInfo_select")
                    })
                }
            });
        }
//根据id查询出员工的旧信息，展示到修改的模特框中
        function getEmpInofById(id){
            $.ajax({
                url: "${pageContext.request.contextPath}/emp/" + id,
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    // {"code":100,"msg":"处理成功","pageInfoMap":{"emp":{"empId":11,"empName":"zhangxueyou8","gender":"M","email":"zhangxueyou@163.com","dId":1,"department":null}}}
                    //取出员工数据
                    var empData=result.pageInfoMap.emp;
                    //展示到相应的控件上即可
                    //展示姓名
                    $('#update_emp_name').text(empData.empName);
                    //展示邮箱
                    $('#update_emp_email_input').val(empData.email);
                    //展示性别，注意这里val中用的是数组[]
                    $('#my_update_emp_Modal input[name=gender]').val([empData.gender]);
                    //展示部门注意这里val中用的是数组[]
                    $('#my_update_emp_Modal select').val([empData.dId]);
                }
            });
        }
//给修改按钮绑定点击事件
        $('#update_emp_btn').click(function () {
            //1.校验邮箱规则
            var email = $("#update_emp_email_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regEmail.test(email)) {
                //alert("邮箱格式不正确");
                //先清除之前的样式
                $("#update_emp_email_input").parent().removeClass("has-error has-success");
                $("#update_emp_email_input").parent().addClass("has-error"); //注意不要写成 .has-error 小圆点不要写
                $("#update_emp_email_input").next("span").text("邮箱格式有误");
                return false;
            } else {
                //先清除之前的样式
                $("#update_emp_email_input").parent().removeClass("has-error has-success");
                $("#update_emp_email_input").parent().addClass("has-success");
                $("#update_emp_email_input").next("span").text("邮箱可以使用");
            }
            //2.发送ajax请求 进行修改

            $.ajax({
                url: "${pageContext.request.contextPath}/emp/" + $(this).attr("emp_id_update_btn"),
                type: "PUT",
                data: $("#my_update_emp_Modal form").serialize(),
                success: function (result) {
                    alert(result.msg);
                    // //1、关闭模态框
                    $("#my_update_emp_Modal").modal("hide");
                    // //2、回到本页面
                    to_page(currentpage);
                }
            });
        });
    })



</script>
