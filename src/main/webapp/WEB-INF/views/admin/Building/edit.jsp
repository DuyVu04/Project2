
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<c:url var="adminAPI" value="/admin/building-list"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->

        </div>

        <div class="page-content">

            <div class="page-header">
                <h1>
                    Dashboard
                </h1>
            </div><!-- /.page-header -->
            <div class ="row">
                <div class="col-xs-12">
                </div>
            </div>
            <div class ="row">
                <form:form  modelAttribute="buildingEdit" id="listForm" method="GET">
                    <div style="font-family: 'Times New Roman', Times, serif;"   class="col-xs-12">
                    <form class="form-horizontal" role="form" >
                        <di class="form-group">
                            <label class="col-xs-3">Tên tòa nhà</label>
                            <div class="col-xs-9">
                                <form:input path="name" class="form-control"/>
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Quận</label>
                            <div class="col-xs-2">
                                <form:select class ="form-control" path="district">
                                    <form:option value="">---Chọn Quận---</form:option>
                                    <form:options items="${district}"/>
                                </form:select>
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Phường</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="ward"/>
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Đường</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="street"/>
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Kết cấu</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="structure" name="structure" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Số tầng hầm</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="numberOfBasement"/>
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Diện tích sàn</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="floorArea"/>
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Hướng</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="direction"/>
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Hạng</label>
                            <div class="col-xs-9">
                                <form:input class="form-control" path="level"/>
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Diện tích thuê</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="rentarea" name="rentarea" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Giá thuê</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="rentprice" name="rentprice" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Mô tả giá</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="rentpricedescription" name="rentpricedescription" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Phí dịch vụ</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="servicefee" name="servicefee" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Phí ô tô</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="carfee" name="carfee" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Phí mô tô</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="motorbikefee" name="motorbikefee" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Phí ngoài giờ</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="overtimefee" name="overtimefee" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Tiền điện</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="electricityfee" name="electricityfee" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Đặt cọc</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="deposit" name="deposit" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Thanh toán</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="payment" name="payment" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Thời hạn thuê</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="renttime" name="renttime" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Thời gian trang trí</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="decorationtime" name="decorationtime" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Tên quản lí</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="managername" name="managername" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">SĐT quản lí</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="managerphonenumber" name="managerphonenumber" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Phí môi giới </label>
                            <div class="col-xs-9">
                                <input class="form-control" type="number" id="brokeragefee" name="brokeragefee" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Loại tòa nhà </label>
                            <div class ="col-xs-9">
                                <form:checkboxes items="${typeBuilding}" path="typeCode"/>
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3">Ghi chú</label>
                            <div class="col-xs-9">
                                <input class="form-control" type="text" id="note" name="note" >
                            </div>
                        </di>
                        <di class="form-group">
                            <label class="col-xs-3"></label>
                            <div class="col-xs-9">
                                <c:if test="${not empty buildingEdit.id}">
                                    <button type="button" class="btn btn-primary" fdprocessedid="nu07j9" id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                                    <button type="button" class="btn btn-primary" fdprocessedid="nu07j9" id="btnCancel">Hủy thao tác</button>
                                </c:if>
                                 <c:if test="${empty buildingEdit.id}">
                                    <button type="button" class="btn btn-primary" fdprocessedid="nu07j9" id="btnAddOrUpdateBuilding">Thêm tòa nhà</button>
                                    <button type="button" class="btn btn-primary" fdprocessedid="nu07j9" id="btnCancel">Hủy thao tác</button>
                                </c:if>
                            </div>
                        </di>
                        <form:hidden path="id" id="buildingId"/>
                        </form>
                    </div>
                </form:form>
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<script>
    $('#btnAddOrUpdateBuilding').click(function(){
        var data ={};
        var typeCode =[];
        var formData=$('#listForm').serializeArray();
        $.each(formData ,function(i,v){
            if(v.name!=typeCode){
                data["" +v.name+""] =v.value;
            }
            else{
                typeCode.push(v.value);
            }
        });
        data['typeCode']=typeCode;
        if(typeCode!=''){
            addBuilding(data);
        }
        else{
            window.location.href="<c:url value="/admin/building-edit?typeCode=require"/> ";
        }
    });
    function addBuilding(data){
         $.ajax({
            type : "POST",
            url :"${buildingAPI}",
            data :JSON.stringify(data),
            contentType :"application/json",
            dataType : "JSON",
            success :function(respond){
                console.log("SUCCESS!");
            },
            error: function(respond){
                console.log("FAILED!");
                console.log(respond);
            }
        })
        }
    $('#btnCancel').click(function (){
    window.location.href="${adminAPI}";

    });
</script>
</body>
</html>
