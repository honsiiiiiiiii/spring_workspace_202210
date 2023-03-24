<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Dashboard</title>
<%@ include file="../inc/header_link.jsp"%>
<style type="text/css">
.box-style{
	width:90px;
	height:95px;
	border:1px solid #ccc;
	display:inline-block;
	margin:5px;
}
.box-style img{
	width:75px;
	height:70px;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<%@ include file="../inc/preloader.jsp" %>
		
		<!-- Navbar -->
		<%@ include file="../inc/navbar.jsp" %>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<%@ include file="../inc/sidebar_left.jsp" %>
		
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">상품목록</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">상품관리> 상품목록</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content" id="app1">
				<div class="container-fluid">
					<div class="row">
					    <div class="col-12">
					        <div class="card">
					            <div class="card-header">
					                <h3 class="card-title">Responsive Hover Table</h3>
					
					                <div class="card-tools">
					                    <div class="input-group input-group-sm" style="width: 150px;">
					                        <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
					
					                        <div class="input-group-append">
					                            <button type="submit" class="btn btn-default">
					                                <i class="fas fa-search"></i>
					                            </button>
					                        </div>
					                    </div>
					                </div>
					            </div>
					            <!-- /.card-header -->
					            <div class="card-body table-responsive p-0">
					                <table class="table table-hover text-nowrap">
					                    <thead>
					                        <tr>
					                            <th>No</th>
					                            <th>카테고리</th>
					                            <th>제품명</th>
					                            <th>브랜드</th>
					                            <th>가격</th>
					                            <th>할인가격</th>
					                        </tr>
					                    </thead>
					                    <tbody>
											<!-- template은 자체로는 아무런 효과가 없고, 그냥 뷰의 영역임을 지정한다 -->
											<template v-for="i  in productList">
												<product />
					                        </template>
					                    </tbody>
					                </table>
					            </div>
					            <!-- /.card-body -->
					        </div>
					        <!-- /.card -->
					    </div>
					</div>
				
				</div>
				<!-- /.container-fluid -->
			
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		
		<%@ include file="../inc/footer.jsp" %>		

		<!-- Control Sidebar -->
		<%@ include file="../inc/sidebar_right.jsp" %>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<%@ include file="../inc/footer_link.jsp" %>
	<script type="text/javascript">
		let app1;
		let key=0;
		
		const product={
			template:`
                <tr>
	                <td>Num나옴</td>
	                <td>카테고리 </td>
	                <td>상품명</td>
	                <td>브랜드</td>
	                <td><span class="tag tag-success">가격</span></td>
	                <td>할인가</td>
            	</tr>
			`,
			props:["obj"],
			data(){
				return{
					json:this.obj
				};
			}
		};
		
		app1=new Vue({
			el:"#app1",
			components:{
				product
			},
			data:{
				count:5,
				productList:[]
			}
		});
		
		//서버에서 상품목록 가져오기 
		function getList(){
			$.ajax({
				url:"/admin/rest/product",
				type:"get",
				success:function(result, status, xhr){
					//서버에서 가져온 json  배열을 뷰의 템블릿이 바라보고 있는 productList 에 대입만하면
					//디자인은 알아서 변경된다...(개발자는 데이터 제어에만 집중하면 됨...디자인 신경꺼라)
					app1.productList = result;
				}
			});
		}
		
		$(function(){
			//등록 이벤트 연결 
			$("#bt_regist").click(function(){
				regist();
			});
			
			getList();
			
		});
	
	</script>
</body>
</html>









