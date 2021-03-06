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

<title>客服系统</title>

<!-- 主体部分样式表 -->
<link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/layout.css">
<link rel="stylesheet" href="/resources/css/ops.css">
<link rel="stylesheet" href="/resources/css/sidebar.css">
<link rel="stylesheet" href="/resources/css/content-header.css">
<link rel="stylesheet" href="/resources/css/datapage.css">
<link rel="stylesheet" href="/resources/css/form.css">
<link rel="stylesheet" href="/resources/css/pagination.css">
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
							 <header class="panel-heading ">
                                                   退款
								<span class="tools pull-right">
                                         <div class="bops-pub-right">
		                                    <a href="javascript :;" onclick="javascript :history.back(-1);" class="ops-pub-btn">
			                                   <i class="fa fa-arrow-left"></i>
			                                     <span>返回</span>
		                                    </a>
		                                    <a class="ops-pub-btn" href="" >
			                                  <i class="fa fa-refresh"></i>
			                                  <span>刷新</span>
		                                     </a>
	                                      </div>
                                       </span>
                               </header>
							</div>
							<div class="wrapper">
								<div class="row">
									<div class="col-sm-12">
										<form id="tradeRefundForm"
											action="/trade/refund" method="post"
											class="form-horizontal">
											<section class="panel">
												<header class="panel-heading">商品</header>
												<div class="panel-body">
													<div class="form-horizontal">
														<div class="form-group">
															<label for="" class="col-lg-2">商品名称</label>
															<div class="col-lg-9">
																<c:forEach items="${trade.goodsList}" var="goods"
																	varStatus="status">
														${goods.goodsName} x ${goods.goodsCount}</br>
																</c:forEach>
															</div>
														</div>
														<div class="form-group">
															<label for="" class="col-lg-2">商品数量</label>
															<div class="col-lg-9">${trade.goodsTotalCount}</div>
														</div>
														<div class="form-group">
															<label for="" class="col-lg-2">商品总价</label>
															<div class="col-lg-9">${trade.totalFee}</div>
														</div>
													</div>
											</section>
											<section class="panel">
												<header class="panel-heading">买家</header>
												<div class="panel-body">
													<div class="form-horizontal">

														<div class="form-group">
															<label for="" class="col-lg-2">买家用户名</label>
															<div class="col-lg-9">${trade.nickName}</div>
														</div>
														<div class="form-group">
															<label for="" class="col-lg-2">手机号</label>
															<div class="col-lg-9">${trade.mobile}</div>
														</div>
													</div>
												</div>
											</section>
											<section class="panel">
												<header class="panel-heading">交易</header>
												<div class="panel-body">
													<div class="form-horizontal">
														<div class="form-group">
															<label for="" class="col-lg-2">交易编号</label>
															<div class="col-lg-9"><input type="hidden" name="tradeNo" value="${trade.tradeNo}"> ${trade.tradeNo}</div>
														</div>
														<div class="form-group">
															<label for="" class="col-lg-2">支付渠道</label>
															<div class="col-lg-9">${trade.payChannel}</div>
														</div>
														<div class="form-group">
															<label for="" class="col-lg-2">交易状态</label>
															<div class="col-lg-9">${trade.tradeStatus}</div>
														</div>
														<div class="form-group">
															<label for="" class="col-lg-2">交易时间</label>
															<div class="col-lg-9">
																<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
																	value="${trade.tradeTime}" type="both" />
															</div>
														</div>
														<div class="form-group">
															<label for="" class="col-lg-2">支付时间</label>
															<div class="col-lg-9">
																<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
																	value="${trade.tradeTime}" type="both" />
															</div>
														</div>
														<div class="form-group">
															<label for="" class="col-lg-2">发货时间</label>
															<div class="col-lg-9">
																<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
																	value="${trade.tradeTime}" type="both" />
															</div>
														</div>
														<div class="form-group">
															<label for="" class="col-lg-2">退款金额</label>
															<div class="col-lg-9">
																<input type="text" name="refundAmount">
															</div>
														</div>
														<div class="form-group">
															<label for="" class="col-lg-2">退款方式</label>
															<div class="col-lg-9">原路返回</div>
														</div>
														<div class="form-group">
															<label for="" class="col-lg-2">退款理由</label>
															<div class="col-lg-9">
																<textarea rows="4" cols="50" name="memo"></textarea>
															</div>
														</div>
													</div>
												</div>
											</section>
											<hr>
											<input type="button" onclick="refund();" class="btn btn-primary" value="确定">
										</form>
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
		function refund() {
			$.ajax({
				type : "post",
				url : "/trade/refund",
				data : $("#tradeRefundForm").serialize(),
				cache : false,
				dataType : 'json',
				success : function(data) {
					if (data.code == 200) {
						alert(data.msg);
						window.location.href = "/trade/page";
					} else {
						alert("code: " + data.code + "\n" + data.msg);
					}
				}
			});
		}
	</script>
</body>
</html>
