<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/admin/css/bootstrap-clearmin.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/admin/css/roboto.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/admin/css/material-design.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/admin/css/small-n-flat.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/admin/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/admin/css/select2.min.css">
    <link href="${request.contextPath}/static/admin/css/jquery.pagination.css" rel="stylesheet" />
    <title>云棋牌管理后台</title>
</head>
<body class="cm-no-transition cm-1-navbar cm-2-navbar">
<div id="cm-menu">
    <nav class="cm-navbar cm-navbar-primary">
        <div class="cm-flex">
            <div class="cm-logo"></div>
        </div>
        <div class="btn btn-primary md-menu-white" data-toggle="cm-menu"></div>
    </nav>
    <div id="cm-menu-content">
        <div` id="cm-menu-items-wrapper">
        <div id="cm-menu-scroller">
            <ul class="cm-menu-items">
                    <#assign firstMenuList=currentAdmin.permissionList/>
                    <#list firstMenuList as firstMenu>
                        <#if firstMenu.preferences?size==1>
                        <li><a href="${firstMenu.preferences[0].href}" class="${firstMenu.icon}">${firstMenu.preferences[0].title}</a></li>
                        <#else>
                        <li class="cm-submenu">
                            <a class="${firstMenu.icon}">${firstMenu.title} <span class="caret"></span></a>
                            <ul>
                            <#assign secondMenuList=firstMenu.preferences/>
                            <#list secondMenuList as secondMenu>
                                <li><a href="${secondMenu.href}">${secondMenu.title}</a></li>
                            </#list>
                            </ul>
                        </li>
                        </#if>
                    </#list>
            </ul>
        </div>
    </div>
</div>
<header id="cm-header">
    <nav class="cm-navbar cm-navbar-primary">
        <div class="btn btn-primary md-menu-white hidden-md hidden-lg" data-toggle="cm-menu"></div>
        <div class="cm-flex"><h1>基础数据列表</h1></div>
        <div class="dropdown pull-right">
            <button class="btn btn-primary md-notifications-white" data-toggle="dropdown"><span
                    class="label label-danger">0</span></button>
            <div class="popover cm-popover bottom">
                <div class="arrow"></div>
                <div class="popover-title">当前无系统通知消息</div>
            </div>
        </div>
        <div class="dropdown pull-right">
            <button class="btn btn-primary md-account-circle-white" data-toggle="dropdown"></button>
            <ul class="dropdown-menu">
                <li class="disabled text-center">
                    <a style="cursor: default"><strong>${currentAdmin.username!}</strong></a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="/admin/account_settings"><i class="fa fa-fw fa-cog"></i> 账户配置</a>
                </li>
                <li>
                    <a href="/admin/sign_out"><i class="fa fa-fw fa-sign-out"></i> 注销</a>
                </li>
            </ul>
        </div>
    </nav>
    <nav class="cm-navbar cm-navbar-default cm-navbar-slideup">
        <div class="cm-flex">
            <div class="cm-breadcrumb-container">
                <ol class="breadcrumb">
                    <li><a href="#">基础数据管理</a></li>
                    <li><a href="#">基础数据配置和管理</a></li>
                </ol>
            </div>
        </div>
    </nav>
</header>


<div id="global">
    <div class="container-fluid">
        <!--完成此部分-->
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">

                        <div>
                            <span style="font-size: 19px">基础数据展示</span>
                            <select id="qpname" name="qpname">
                                <option value="all">all</option>
                                        <#list memos as memo>
                                            <option value="${memo}">${memo}</option>
                                        </#list>
                            </select>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-condensed table-hover">
                            <thead>
                            <tr>
                                <td>数据类别</td>
                                <td>类别说明</td>
                                <td>数据标识</td>
                                <td>数据名称</td>
                                <td>排序</td>
                                <td>操作</td>
                            </tr>
                            </thead>
                            <tbody id="tbody">
                            <#list baseCodes as baseCode>
                            <tr>
                                <td>${baseCode.base_type}</td>
                                <td>${baseCode.code_memo}</td>
                                <td>${baseCode.base_code}</td>
                                <td>${baseCode.baseName}</td>
                                <td>${baseCode.orderSort}</td>
                                <td>
                                    <button id="updateButton" type="button" class="btn btn-info" data-toggle="modal"
                                            data-target="#delete"
                                            data-whatever="${baseCode.code_id}">删除
                                    </button>
                                </td>

                            </tr>
                            </#list>
                            </tbody>
                        </table>
                           <center><div id="pagination3" class="page fl"></div></center>
                    </div>
                </div>
            </div>
        </div>





        <!--删除-->
        <div id="delete" class="modal fade bs-example" tabindex="-1" role="dialog" aria-labelledby="admin_add_Modal_Label">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form class="form-horizontal"  method="post" id="form">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="close"><span
                                    aria-hidden="true">&times</span></button>
                            <h4 class="modal-title" id="myModal_Label" align="center">是否删除?</h4>
                        </div>
                        <div class="modal-footer">
                            <button type="reset" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="submit" class="btn btn-primary">是</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>








        <footer class="cm-footer"><span class="pull-right">&copy; HAUE edu.</span></footer>
    </div>


<script src="${request.contextPath}/static/admin/js/jquery-2.1.3.min.js"></script>
<script src="${request.contextPath}/static/admin/js/baseCodePager.js"></script>
<script src="${request.contextPath}/static/admin/js/jquery.mousewheel.min.js"></script>
<script src="${request.contextPath}/static/admin/js/jquery.cookie.min.js"></script>
<script src="${request.contextPath}/static/admin/js/fastclick.min.js"></script>
<script src="${request.contextPath}/static/admin/js/bootstrap.js"></script>
<script src="${request.contextPath}/static/admin/js/clearmin.js"></script>
<script src="${request.contextPath}/static/admin/js/select2.min.js"></script>

    <script  type="text/javascript">
        $(function() {
            $("#pagination3").pagination({
                currentPage :${currentPage},
                totalPage :${totalPage},
                isShow : true,
                homePageText : "首页",
                endPageText : "尾页",
                prevPageText : "上一页",
                nextPageText : "下一页",
                /*callback : function(current) {
                    $("#current3").text(current)
                }*/
            });
        })
    </script>

<script type="text/javascript">
    var memo="";
    $(document).ready(function () {

        // $.ajax({
        //     type:'post',
        //     url:'/admin/findBaseCodeList',
        //     cache:false,
        //     dataType:'json',
        //     success:function(data){
        //         var html="";
        //         for(var i=0;i<data.length;i++){
        //             var bc=data[i];
        //             html+="<tr><td>"+bc.base_type+"</td><td>"+bc.codeMemo+"</td><td>"+bc.base_code+"</td><td>"+bc.baseName+"</td><td>"+bc.orderSort+"</td><td>\n" +
        //                     "                                     <button  data-toggle=\"modal\" type=\"button\"  data-target=\"#delete\" style=\"margin-left: 5px\" class=\"btn btn-xs btn-info\" data-whatever=\""+bc.code_id+"\">删除</button> \n" +
        //                     "                                </td></tr>";
        //             $("#tbody").html(html)
        //         }
        //         $('#delete').on('show.bs.modal', function (event) {
        //             var button = $(event.relatedTarget)
        //             var recipient = button.data('whatever')
        //             $("#form").attr("action","deleteBaseCodeById?id="+recipient);
        //
        //         });
        //
        //     },
        //     error:  function (data) {
        //
        //     }
        // });


        $("#qpname").change(function () {
            var options = $("#qpname option:selected")
            memo = options.attr("value");
            if(memo=="all"){
                $.ajax({
                    type:'post',
                    url:'${request.contextPath}/admin/findBaseCodeList',
                    cache:false,
                    dataType:'json',
                    success:function(data){
                        var html="";
                        for(var i=0;i<data.length;i++){
                            var bc=data[i];
                            html+="<tr><td>"+bc.baseType+"</td><td>"+bc.codeMemo+"</td><td>"+bc.base_code+"</td><td>"+bc.baseName+"</td><td>"+bc.orderSort+"</td><td>\n" +
                                    "                                     <button  data-toggle=\"modal\" type=\"button\"  data-target=\"#delete\" style=\"margin-left: 5px\" class=\"btn btn-xs btn-info\" data-whatever=\""+bc.code_id+"\">删除</button> \n" +
                                    "                                </td></tr>";
                            $("#tbody").html(html)
                        }
                        $('#delete').on('show.bs.modal', function (event) {
                            var button = $(event.relatedTarget)
                            var recipient = button.data('whatever')
                            $("#form").attr("action","deleteBaseCodeById?id="+recipient);

                        });
                        var button = $(event.relatedTarget)
                    },
                    error:  function (data) {

                    }
                });

            }
            else{
                window.location.href="findByMemo?memo="+memo+"";


            // $.ajax({
            //     type:'post',
            //     url:'/admin/findListByMemo?memo='+memo,
            //     cache:false,
            //     dataType:'json',
            //     success:function(data){
            //         var html="";
            //         for(var i=0;i<data.length;i++){
            //             var bc=data[i];
            //             html+="<tr><td>"+bc.baseType+"</td><td>"+bc.codeMemo+"</td><td>"+bc.base_code+"</td><td>"+bc.baseName+"</td><td>"+bc.orderSort+"</td><td>\n" +
            //                     "                                     <button  data-toggle=\"modal\" type=\"button\"  data-target=\"#delete\" style=\"margin-left: 5px\" class=\"btn btn-xs btn-info\" data-whatever=\""+bc.code_id+"\">删除</button> \n" +
            //                     "                                </td></tr>";
            //             $("#tbody").html(html)
            //         }
            //
            //         $('#delete').on('show.bs.modal', function (event) {
            //             var button = $(event.relatedTarget)
            //             var recipient = button.data('whatever')
            //             $("#form").attr("action","deleteBaseCodeById?id="+recipient);
            //
            //         });
            //
            //     },
            //     error:  function (data) {
            //
            //     }
            // });
            }
        })
       $('#delete').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget)
                    var recipient = button.data('whatever')
                    $("#form").attr("action","deleteBaseCodeById?id="+recipient);

                });





    });

</script>
</body>
</html>