<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>My diary</title>
</head>
<body>
<%@include file="/WEB-INF/include/include-header.jspf" %>


<!-- start : page - my diary list -->

	<!-- start : Container -->
<div id="diarylist" class="container color yellow pagebox ">
	
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
		
		<center>I'm a ${diaryflag}
		<b id = "status_id"></b>
		</center>
				<div id="lastPostsLoader">추가</div>
		<!-- start : filter-->
		<center>
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
		</center>
		<!-- end : filter -->
		
		<!-- start : diary list -->
		<div id="diary-wrapper" class="row-fluid" style="overflow: visible;">
				<div id="addlist"></div>
		</div>
		<!-- end : diary list -->
		
		

		<div id="pagenav"></div>
		<input type="hidden" id="pagenum" name="pagenum" value="1"/>
		
			</div>
		<!-- end : Wrapper -->
		
			</div>
	<!-- end : Container -->

<%@include file="/WEB-INF/include/include-bottom.jspf" %>

<script type="text/javascript">
    
$(document).ready(function(){
	
	
	 $('.row-fluid').css("overflow", "visible");
	 $('.isotope').css("overflow", "visible");
	 
	//스크롤 감지
    $(window).scroll(function(){  
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){  
           lastPostFunc();
        }  
    });
	
	//로딩중 띄우기
    function lastPostFunc()  
    {  
        $("#lastPostsLoader").html("로딩중...");  
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
</script>

<script type="text/javascript">


//목록 추가 ajax
function fn_selectBoardList(pageNo){
    var comAjax = new ComAjax();
    comAjax.setUrl("<c:url value='/td/mydiaryList.do' />");
    comAjax.setCallback("Callback");
    comAjax.addParam("pagenum",pageNo);
    comAjax.addParam("page_row",9);
    comAjax.ajax();
	window.alert("추가");
}
 
function Callback(data){
	var id = data.userInfo.member_id;
    var total = data.total;
    var addpoint = $("#addlist");
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
        var pro = 0;
    	var basicClass = "span4 diary-item html5 css3 responsive ";
    	var className = null;
        
        
        $.each(data.diaryList, function(key, value){
        	if(num < 0)
        		num = 0;
        	var start = getDateString(value.start_day);
        	var end = getDateString(value.end_day);
        	
        	$.each(data.progress, function(key, prog){
        		if(prog.diary_volum == value.diary_volum)
        			pro = prog.percent;
        		
        	});
        	
        	
        	if(pro == 100)
        		basicClass = basicClass+"full ";
        	
        	//지역에 따라 클래스 이름 추가
    		if((value.location_code).indexOf('i')>-1){
    			className = basicClass+"internal";
    		} else if((value.location_code).indexOf("o")>-1){
    			className = basicClass+"foreign";
    		}
        	
        //	var dtm = GetDateString(value.CREA_DTM);
            str += "<div id='page"+pageNo+"'>"+
            		"<div id='diary' class='"+className+"'>"+
            		"<div class='picture' id='d"+ (num + i)+"'>"+
            			"<a href='diarydays.jsp?dvol="+value.diary_volum+"&mnum="+value.member_num+"' title='Title'>"+
                        "<img src='${pageContext.request.contextPath}/upload/"+ value.diary_cover +"' alt='' class='dcover'/>" + 
                        "<div class='image-overlay-link'></div></a>"+
                        	"<div class='item-description alt'>" +
	                        	"<h5><a href='diarydays.jsp?dvol="+value.diary_volum+"'>"+value.diary_title +"</a></h5>"+
	                        	"<p>"+start+"-"+end+"<br>"+
	                        	"vol."+value.diary_volum+"</p>"+
                        	"</div>" +
                        "</div>"+
                    "</div>"+
                    "</div>"+
                    "</div>";
                    i++;
        });
        var anchor = "<div id='page"+pageNo+"'>";
        addpoint.append(anchor+str+"</div>");
      //  addpoint.append(str);
      //  addpoint.append("</div>");
        
        //db limit걸기, 날짜표시 수정, num > id 변경 출력
    }
}

//날짜 형식 변환
function getDateString(jsonDate){
	var year, month, day, hour, minute, second , returnValue  , date ,replaceStr
	 
    date = new Date(jsonDate);

    year = date.getFullYear();
    month = Pad(date.getMonth());
    day = Pad(date.getDate());
    hour = Pad(date.getHours());
    minute = Pad(date.getMinutes());
    second = Pad(date.getSeconds());

    returnValue = year + "/" + month + "/" + day;
    return returnValue;
}

function Pad(num) {
    num = "0" + num;
    //slice(start, end) start<0이면 length+start
    return num.slice(-2);
}

</script>

</body>
</html>