<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Day</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

<!-- start : page - read day -->

	<!-- start : Container -->
	<div id="days" class="container color white pagebox" >
	
		<!-- start : navigation -->
		<%@include file="navBar.html" %>	
		<!-- end : navigation -->
		
			<!-- start : Wrapper -->
			<div class="wrapper span12">
			
			<!-- start : Page Title -->
			<div id="page-title">
				
				<div id="page-title-inner">
				<h2><span>Day</span></h2>
				</div>
			</div>
			<!-- end : Page Title -->

<input type="hidden" id="userNum" >
	
	
	<!-- start : 1st section - day view -->
	<div class="readpage-wrap" id="fixNextTag">

	<table class="table table-striped">
		<thead>
			<tr>
				<th> ${day.day_num}</th>
				<th> ${day.day_title } </th>
				<th style="text-align: right"> ${day.member_num } </th>
			</tr>
		<thead>
	<tbody>
		<tr style="height:200px">
			<td colspan="3"> ${day.day }</td>
		</tr>
	</tbody>
	</table>
	</div>

	<!-- end : 1st section - day view -->
	

	
	<!-- start : 3st section - button -->
<form name="form" method="post">


<center>
	<a onclick="modifyDay()" class="button btn-success"><span>수정</span></a>
	<a onclick="deleteDay()" class="button btn-success"><span>삭제</span></a>
</center>

<center>
	<button type="button" class="button btn-success" onclick="javascript:window.list();return false;">
	<span>목록</span></button>
	<input type="hidden" id="dpcode" value="">
	<button id="listBtn" onclick="javascript:window.location='diarydays.do?dvol=${day.diary_volum}&mnum=${day.member_num }';return false" 
	class="button btn-success"><span>일기장 보기</span></button>
	<button id="scrapBtn" class="button btn-success" onclick="javascript:window.scrap(,)">
	<span>스크랩</span></button>
</center>

</form>

	<!-- end : 3st section - button -->

		</div>
		<!-- end : Wrapper -->
	
	</div>
	<!-- end : Container -->
</body>
</html>