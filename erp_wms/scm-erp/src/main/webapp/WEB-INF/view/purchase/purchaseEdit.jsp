<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- IE=edge告诉IE使用最新的引擎渲染网页 -->
<!-- chrome=1则可以激活Chrome Frame , Chrome Frame可以让旧版IE浏览器使用Chrome的WebKit渲染引擎处理网页 -->
<meta
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"
	name="viewport">
<!-- 强制让文档的宽度与设备的宽度保持1:1，并且文档最大的宽度比例是1.0，且不允许用户点击屏幕放大浏览 -->

<meta content="yes" name="apple-mobile-web-app-capable" />
<!-- iphone设备中的safari私有meta标签，它表示：允许全屏模式浏览 -->

<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<!-- iphone的私有标签，它指定的iphone中safari顶端的状态条的样式 -->

<meta content="telephone=no" name="format-detection" />
<!-- 告诉设备忽略将页面中的数字识别为电话号码 -->

<meta content="email=no" name="format-detection" />
<!-- android设备忽略将页面中的email识别为电子邮箱 -->

<link rel="shortcut icon" href="/resources/img/common/favicon.ico"
	type="image/x-icon" />

<title>ERP管理系统</title>

<!-- 主体部分样式表 -->
<link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap/button.css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/layout.css">
<link rel="stylesheet" href="/resources/css/ops.css">
<link rel="stylesheet" href="/resources/css/sidebar.css">
<link rel="stylesheet" href="/resources/css/content-header.css">
<link rel="stylesheet" href="/resources/css/datapage.css">
<link rel="stylesheet" href="/resources/css/form.css">
<link rel="stylesheet" href="/resources/css/pagination.css">
<link rel="stylesheet" href="/resources/css/trade.css">

<!-- 分页插件 css 样式 -->
<!-- 此部分注释内容兼容IE低版本 H5相关 **不要删除**-->
<!--[if lt IE 9]>
          <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<body>
	<section class="layout-wrap">
		<div class="layout-left">
			<%@ include file="/resources/html/sidebar.jsp"%>
		</div>
		<div class="layout-right">
			<div class="layout-right-inner">
				<div class="layout-right-top">
					<%@ include file="/resources/html/content_header.jsp"%>
				</div>
				<div class="layout-right-bottom">
					<!-- 
                            这部分写各自页面对应的内容
                            注意锁紧格式
                            范围 start -
                         -->

					<div class="form-page-wrap">
						<div class="data-page-inner">
							<div class="page-head">
								<h3 class="m-b-less">收货</h3>
								<div class="back">
									<a href="#" class="button button-primary button-raised button-small" role="button" onClick="doIt();">确定</a>
									<a href="javascript:javascript:window.history.back(-1);"
										class="button button-primary button-raised button-small" role="button">返回</a> 
								</div>
							</div>
							<div class="wrapper">
								<div class="row">
									<div class="col-sm-12">
										<!-- <form id="goodsEditProfile" class="form-horizontal"> -->
											<div class="info">
												<table
													class="table table-bordered table-hover table-condensed table-responsive">
													<!--<tbody>-->
													<tr class="table-title">
														<td colspan="6">采购单信息</td>
													</tr>
													<tr>
														<td>采购单号</td>
														<td>${bopsPurchaseVO.purchaseId}</td>
														<td>收货状态</td>
														<td>
														<c:if test='${bopsPurchaseVO.purchaseStatus == "WAIT_HARVEST"}'>待收货</c:if>
														<c:if test='${bopsPurchaseVO.purchaseStatus == "HAVEST_ALREADY"}'>已收货</c:if>
														</td>
														<td>所属供应商</td>
														<td style="text-align:left;">${bopsPurchaseVO.vendorName}</td>
													</tr>
													<tr>
														<td>预约仓库</td>
														<td>${bopsPurchaseVO.wareHouseName}</td>
														<td>预计送达时间</td>
														<td>${bopsPurchaseVO.deliveryTime}</td>
													</tr>
													<tr>
														<td>采购人</td>
														<td>${bopsPurchaseVO.purchaseUserName}</td>
														<td>采购部门</td>
														<td>${bopsPurchaseVO.purchaseDepartment}</td>
														<td>创建时间</td>
														<td style="text-align:left;">${bopsPurchaseVO.createTime}</td>
													</tr>
													<tr>
														<td>是否收货</td>
														<td>
														<c:if test='${bopsPurchaseVO.purchaseIsHavest == "0"}'>否</c:if>
														<c:if test='${bopsPurchaseVO.purchaseIsHavest == "1"}'>是</c:if>
														</td>
														<td>收货人</td>
														<td>${bopsPurchaseVO.havestUserid}</td>
														<td>收货时间</td>
														<td style="text-align:left;">${bopsPurchaseVO.havestTime}</td>
													</tr>
													<tr>
														<td>采购总价</td>
														<td>${bopsPurchaseVO.purchasePriceAll}</td>
														<td>采购单总数量</td>
														<td>${bopsPurchaseVO.purchaseCountAll}</td>
														<td>其他费用</td>
														<td style="text-align:left;">${bopsPurchaseVO.purchasePriceOther}</td>
													</tr>
												</table>
												<form id="form_data">
												<table
													class="table table-bordered table-hover table-condensed table-responsive">
													<div class="table-title">采购明细</div>
													<thead>
														<tr >
															<th>商品编号</th>
															<th>国际条形码</th>
															<th>商品名称</th>
															<th>采购单价</th>
															<th>采购数量</th>
															<th>收货数量</th>
															<th>收货数量(正)</th>
															<th>收货数量(残)</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${purchaseInfoList}" var="goods"
														varStatus="status">
														<tr>
															<td>${goods.goodsCode}</td>
															<td>${goods.goodsBarcode}</td>
															<td style="text-align:left;">${goods.goodsName}</td>
															<td>${goods.purchasePrice2}</td>
															<td><span id="d${goods.goodsCode}">${goods.purchaseCount}</span></td>
															<input type="hidden" name="goodsGoodsCode" value="${goods.goodsCode}"/>
															<input type="hidden" name="purchaseId" id="purchaseId" value="${bopsPurchaseVO.purchaseId}"/>
															<td><span id="a${goods.goodsCode}">${goods.havestInfoCount}</span></td>
															<td><input type="text" class="form-control" name="havestInfoNormal" id="b${goods.goodsCode}" value="" onblur="getAll('${goods.goodsCode}');"/></td>
															<td><input type="text" class="form-control" name="havestInfoDisability" id="c${goods.goodsCode}" value="" onblur="getAll('${goods.goodsCode}');"/></td>
														</tr>
													</c:forEach>
													</tbody>
												</table>
												</form>
											</div>
										<!-- </form> -->
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 
                            这部分写各自页面对应的内容
                            注意锁紧格式
                            范围 end -
                         -->
				</div>
			</div>
		</div>
	</section>

	<!-- 在 body的最底部引入js文件且一定保持 jquery 在 bootstrap 之前引入 -->
	<script src="/resources/js/jquery/jquery-2.1.4.min.js"></script>
	<script src="/resources/js/bootstrap/bootstrap.min.js"></script>
	<script src="/resources/js/jquery_upload/vendor/jquery.ui.widget.js"></script>
	<script src="/resources/js/jquery_upload/jquery.iframe-transport.js"></script>
	<script src="/resources/js/jquery_upload/jquery.fileupload.js"></script>
	<!-- 侧面导航栏组件 js -->
	<script src="/resources/js/sidebar.js"></script>
	<script src="/resources/js/jquery.pagination.js"></script>
	<script type="text/javascript">
		function doIt() {
			var purchaseId = $("input[name='purchaseId']");
			var goodsHavestInfoNormal=$("input[name='havestInfoNormal']");
			var goodsHavesInfoDisability=$("input[name='havestInfoDisability']");
			var goodsGoodsCode=$("input[name='goodsGoodsCode']");
			var arr = new Array();
			for(var i=0;i<purchaseId.length;i++){
				var test = purchaseId[i].value+","+goodsHavestInfoNormal[i].value+","+goodsHavesInfoDisability[i].value+","+goodsGoodsCode[i].value+"@";
				arr.push(test);
			}
            $.ajax({
                type : "POST",
                url : "/purchase/modPurchase",
                datatype : "json",
                data : {
                	dataAll : arr.toString()
                },
                success : function(data) {
                    if (data.code == 200) {
                        window.location.href = "/purchase/page";
                    } else {
                        alert("code: " + data.code + "\n" + data.msg);
                    }
                },
                error: function(data){
                }
                
            }); 
        }
		function getAll(a){
			var aaa=$("#c"+a).val();
			var bbb=$("#b"+a).val();
			$("#a"+a).html(Number(aaa)+Number(bbb));
			var allCount=$("#d"+a).html();
			allCount=Number(allCount);
			var real=Number(aaa)+Number(bbb);
			if(allCount<real){
				alert("收货数量不能大于采购数量");
			}
		}
	</script>
</body>
</html>