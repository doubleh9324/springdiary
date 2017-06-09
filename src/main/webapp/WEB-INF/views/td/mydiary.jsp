<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<%@include file="/WEB-INF/include/include-header.jspf" %>


<!-- start : page - my diary list -->

	<!-- start : Container -->
	<div id="diarylist" class="container color yellow ppagebox">
	
		<!-- start : navigation -->
		<%@include file="navBar.html" %>
		<!-- end : navigation -->
	
		<!-- start : Wrapper -->
		<div class="wrapper span12">
	
		<!-- start: Page Title -->
		<div id="page-title">

			<div id="page-title-inner">

				<h2><span>My Diary</span></h2>

			</div>	

		</div>
		<!-- end: Page Title -->
		
		<center>I'm a ${diaryflag}</center>
		
		<!-- start : filter-->
		<div id="filters">
			<ul class="option-set" data-option-key="filter">
				<li><a href="#filter" class="selected" data-option-value="*">All</a></li>
				<li>/</li>
				<li><a href="#filter" data-option-value=".internal">국내</a></li>
				<li>/</li>
				<li><a href="#filter" data-option-value=".foreign">해외</a></li>
				<li>/</li>
				<li><a href="#filter" data-option-value=".full">완성</a></li>
			</ul>
		</div>
		<!-- end : filter -->
		
		<!-- start : diary list -->
		<div id="diary-wrapper" class="row-fluid">
				<div id="addlist"></div>
				

                 
			
			<!-- 필터용 클래스 이름 추가 할 것 -->
			
		</div>
		<!-- end : diary list -->
		
		<div id="lastPostsLoader"></div>
		<div id="pagenav"></div>
		<input type="hidden" id="pagenum" name="pagenum" value="1"/>
		
		</div>
		<!-- end : Wrapper -->
	</div>
	<!-- end : Container -->		
<%@include file="/WEB-INF/include/include-bottom.jspf" %>
<script type="text/javascript">
    
$(document).ready(function(){
	
	//스크롤 감지
    $(window).scroll(function(){  
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){  
           lastPostFunc();
        }  
    });

	
	//로딩중 띄우기
    function lastPostFunc()  
    {  
        $("div#lastPostsLoader").html("로딩중...");  
        addList();
        
    };  

    //목록 추가
    function addList(){
    	var pageno = ($("#pagenum").val());
    	pageno++;
    	_movePage(pageno);
    };


	//해쉬값이 존재하면 그만클 불러오고 포커스 주기, 없으면 첫 페이지 불러오기
	if(document.location.hash){
		
		var hash = window.location.hash.replace("#", "");
		var target = $("#"+hash);
		var page = Math.floor(hash/20)+1;
		window.location.hash = page;
		
		$("#pagenum").val(page);
		
			for(var i=1; i<=page; i++){
				fn_selectBoardList(i);
			}
			
			location.hash = "#page"+page;
	}else{
		fn_selectBoardList(1);
	}
	
});	

//목록 추가 ajax
function fn_selectBoardList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/td/mydiaryList.do' />");
    comAjax.setCallback("Callback");
    comAjax.addParam("pagenum",pageNo);
    comAjax.addParam("PAGE_ROW",9);
    comAjax.ajax();
}
 
function Callback(data){
    var total = data.total;
    var addpoint = $("#diary-wrapper");
    var last = $("#addlist");
   //	body.empty();
    if(total == 0){
        var str = "<center>작성된 다이어리가 없습니다.</center>";
        body.append(str);
    }
    else{
        var params = {
            divId : "pagenav",
            pageIndex : "pagenum",
            totalCount : total,
            eventName : "fn_selectBoardList"
        };
        gfn_renderPaging(params);
         
        //값을 가져와서 뿌려주는 부분
        var str = "";
        var pageNo = $("#pagenum").val();
        var i=1;
        var num = pageNo*20-20 ;
        
        //map일때 사용
        $.each(data.diaryList, function(key, value){
        	if(num < 0)
        		num = 0;
        //	var dtm = GetDateString(value.CREA_DTM);
            str +=  "<div class='picture' id='"+ (num + i)+"'>"+
            			"<a class='image-overlay-link' href='diarydays.jsp?dvol="+value.diary_volum+"&mnum="+value.member_num+"' title='Title'>"+
                        "<img src='${pageContext.request.contextPath}/upload/default.jpg' alt='' class='dcover'/>" + 
                        "<div class='image-overlay-link'></div></a>"+
                        	"<div class='item-description alt'>" +
	                        	"<h5><a href='diarydays.jsp?dvol="+value.diary_volum+"'>"+value.diary_title +"</a></h5>"+
	                        	"<p>"+value.start_day+"-"+value.end_day+"<br>"+
	                        	"<b>"+value.member_id+"</b> "+
	                        	"vol."+value.diary_volum+"</p>"+
                        	"</div>" +
                        "</div>"+
                    "</div>";
                    i++;
        });
        var anchor = "<a id='page"+pageNo+"'>------</a><br><br>";
        addpoint.append(anchor);
        addpoint.append(str);
        
        //db limit걸기, 이미지 경로수정, overlay div 수정, 날짜표시 수정, num > id 변경 출력
    }
}



    
</script>
</body>
</html>