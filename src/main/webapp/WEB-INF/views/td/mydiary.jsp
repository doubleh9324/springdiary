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
				<li><a href="#filter" data-option-value=".internal">����</a></li>
				<li>/</li>
				<li><a href="#filter" data-option-value=".foreign">�ؿ�</a></li>
				<li>/</li>
				<li><a href="#filter" data-option-value=".full">�ϼ�</a></li>
			</ul>
		</div>
		<!-- end : filter -->
		
		<!-- start : diary list -->
		<div id="diary-wrapper" class="row-fluid">
				<div id="addlist"></div>
				

                 
			
			<!-- ���Ϳ� Ŭ���� �̸� �߰� �� �� -->
			
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
	
	//��ũ�� ����
    $(window).scroll(function(){  
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){  
           lastPostFunc();
        }  
    });

	
	//�ε��� ����
    function lastPostFunc()  
    {  
        $("div#lastPostsLoader").html("�ε���...");  
        addList();
        
    };  

    //��� �߰�
    function addList(){
    	var pageno = ($("#pagenum").val());
    	pageno++;
    	_movePage(pageno);
    };


	//�ؽ����� �����ϸ� �׸�Ŭ �ҷ����� ��Ŀ�� �ֱ�, ������ ù ������ �ҷ�����
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

//��� �߰� ajax
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
        var str = "<center>�ۼ��� ���̾�� �����ϴ�.</center>";
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
         
        //���� �����ͼ� �ѷ��ִ� �κ�
        var str = "";
        var pageNo = $("#pagenum").val();
        var i=1;
        var num = pageNo*20-20 ;
        
        //map�϶� ���
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
        
        //db limit�ɱ�, �̹��� ��μ���, overlay div ����, ��¥ǥ�� ����, num > id ���� ���
    }
}



    
</script>
</body>
</html>