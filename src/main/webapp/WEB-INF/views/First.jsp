<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.net.URLEncoder"%>
<html>
<head>
<title>Travel Diary</title>

<script language="JavaScript">

function submitfuc(index){
if(index==1){ document.form.action="LoginJudge.jsp"; }
if(index==2){ document.form.action="Join.jsp"; }
if(index==3){ document.form.action="FindPw.jsp"; }

doument.form.submit();
}

/*
function overBtn(){
	var o = document.getElementById("join");
	o.onmouseover = function(){
		
	}
}
	*/
	


</script>

<style type="text/css">

 body{
background-color:#3C5064;
font-family:돋움;
color:#E4E8EB;
font-size:12px;
}


input[type=submit]{
border:0px; 
background-color:transparent;
font-family:돋움;
color:#E4E8EB;
font-size:12px;
margin:5px; 
left:50%
}

input[type=text], input[type=password]{
border:1px solid #E4E8EB;
background-color:transparent;
font-family:돋움;
color:#E4E8EB;
font-size:12px;
text-align:center;
}

p{
text-align:center;
}

img{
display:block;
margin-left:auto;
margin-right:auto;
top:50%;
margin-top: 160px;
}
 
 
 /*
 @import url(https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css);
@import url(http://fonts.googleapis.com/css?family=Lato:300,400,700);

body {
    font-family: 'Lato', sans-serif;
    background: #353535;
    color: #FFF;
}
.jumbotron h1 {
    color: #353535;
}
footer {
  margin-bottom: 0 !important;
  margin-top: 80px;
}
footer p {
  margin: 0;
  padding: 0;
}
span.icon {
    margin: 0 5px;
    color: #D64541;
}
h2 {
    color: #BDC3C7;
  text-transform: uppercase;
  letter-spacing: 1px;
}
.mrng-60-top {
    margin-top: 60px;
}


//버튼
a.animated-button:link, a.animated-button:visited {
    position: relative;
    display: block;
    margin: 30px auto 0;
    padding: 14px 15px;
    color: #fff;
    font-size:14px;
    font-weight: bold;
    text-align: center;
    text-decoration: none;
    text-transform: uppercase;
    overflow: hidden;
    letter-spacing: .08em;
    border-radius: 0;
    text-shadow: 0 0 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(0, 0, 0, 0.2);
    -webkit-transition: all 1s ease;
    -moz-transition: all 1s ease;
    -o-transition: all 1s ease;
    transition: all 1s ease;
}
a.animated-button:link:after, a.animated-button:visited:after {
    content: "";
    position: absolute;
    height: 0%;
    left: 50%;
    top: 50%;
    width: 150%;
    z-index: -1;
    -webkit-transition: all 0.75s ease 0s;
    -moz-transition: all 0.75s ease 0s;
    -o-transition: all 0.75s ease 0s;
    transition: all 0.75s ease 0s;
}
a.animated-button:link:hover, a.animated-button:visited:hover {
    color: #FFF;
    text-shadow: none;
}
a.animated-button:link:hover:after, a.animated-button:visited:hover:after {
    height: 450%;
}
a.animated-button:link, a.animated-button:visited {
    position: relative;
    display: block;
    margin: 30px auto 0;
    padding: 14px 15px;
    color: #fff;
    font-size:14px;
    border-radius: 0;
    font-weight: bold;
    text-align: center;
    text-decoration: none;
    text-transform: uppercase;
    overflow: hidden;
    letter-spacing: .08em;
    text-shadow: 0 0 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(0, 0, 0, 0.2);
    -webkit-transition: all 1s ease;
    -moz-transition: all 1s ease;
    -o-transition: all 1s ease;
    transition: all 1s ease;
}

/* Victoria Buttons */

a.animated-button.victoria-one {
    border: 2px solid #D24D57;
}
a.animated-button.victoria-one:after {
    background: #D24D57;
    -moz-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
    -ms-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
    -webkit-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
    transform: translateX(-50%) translateY(-50%) rotate(-25deg);
}
a.animated-button.victoria-two {
    border: 2px solid #D24D57;
}
a.animated-button.victoria-two:after {
    background: #D24D57;
    -moz-transform: translateX(-50%) translateY(-50%) rotate(25deg);
    -ms-transform: translateX(-50%) translateY(-50%) rotate(25deg);
    -webkit-transform: translateX(-50%) translateY(-50%) rotate(25deg);
    transform: translateX(-50%) translateY(-50%) rotate(25deg);
}
a.animated-button.victoria-three {
    border: 2px solid #D24D57;
}
a.animated-button.victoria-three:after {
    background: #D24D57;
    opacity: .5;
    -moz-transform: translateX(-50%) translateY(-50%);
    -ms-transform: translateX(-50%) translateY(-50%);
    -webkit-transform: translateX(-50%) translateY(-50%);
    transform: translateX(-50%) translateY(-50%);
}
a.animated-button.victoria-three:hover:after {
    height: 140%;
    opacity: 1;
}
a.animated-button.victoria-four {
    border: 2px solid #D24D57;
}
a.animated-button.victoria-four:after {
    background: #D24D57;
    opacity: .5;
    -moz-transform: translateY(-50%) translateX(-50%) rotate(90deg);
    -ms-transform: translateY(-50%) translateX(-50%) rotate(90deg);
    -webkit-transform: translateY(-50%) translateX(-50%) rotate(90deg);
    transform: translateY(-50%) translateX(-50%) rotate(90deg);
}
a.animated-button.victoria-four:hover:after {
    opacity: 1;
    height: 600% !important;
}
/* Sandy Buttons */

a.animated-button.sandy-one {
    border: 2px solid #AEA8D3;
    color: #FFF;
}
a.animated-button.sandy-one:after {
    border: 3px solid #AEA8D3;
    opacity: 0;
    -moz-transform: translateX(-50%) translateY(-50%);
    -ms-transform: translateX(-50%) translateY(-50%);
    -webkit-transform: translateX(-50%) translateY(-50%);
    transform: translateX(-50%) translateY(-50%);
    
}
a.animated-button.sandy-one:hover:after {
    height: 120% !important;
    opacity: 1;
    color: #FFF;
}
a.animated-button.sandy-two {
    border: 2px solid #AEA8D3;
    color: #FFF;
}
a.animated-button.sandy-two:after {
    border: 3px solid #AEA8D3;
    opacity: 0;
    -moz-transform: translateY(-50%) translateX(-50%) rotate(90deg);
    -ms-transform: translateY(-50%) translateX(-50%) rotate(90deg);
    -webkit-transform: translateY(-50%) translateX(-50%) rotate(90deg);
    transform: translateY(-50%) translateX(-50%) rotate(90deg);
}
a.animated-button.sandy-two:hover:after {
    height: 600% !important;
    opacity: 1;
    color: #FFF;
}
a.animated-button.sandy-three {
    border: 2px solid #AEA8D3;
    color: #FFF;
}
a.animated-button.sandy-three:after {
    border: 3px solid #AEA8D3;
    opacity: 0;
    -moz-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
    -ms-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
    -webkit-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
    transform: translateX(-50%) translateY(-50%) rotate(-25deg);
}
a.animated-button.sandy-three:hover:after {
    height: 400% !important;
    opacity: 1;
    color: #FFF;
}
a.animated-button.sandy-four {
    border: 2px solid #AEA8D3;
    color: #FFF;
}
a.animated-button.sandy-four:after {
    border: 3px solid #AEA8D3;
    opacity: 0;
    -moz-transform: translateY(-50%) translateX(-50%) rotate(25deg);
    -ms-transform: translateY(-50%) translateX(-50%) rotate(25deg);
    -webkit-transform: translateY(-50%) translateX(-50%) rotate(25deg);
    transform: translateY(-50%) translateX(-50%) rotate(25deg);
}
a.animated-button.sandy-four:hover:after {
    height: 400% !important;
    opacity: 1;
    color: #FFF;
}
/* Gibson Buttons */

a.animated-button.gibson-one {
    border: 2px solid #65b37a;
    color: #FFF;
}
a.animated-button.gibson-one:after {
    opacity: 0;
    background-image: -webkit-linear-gradient( transparent 50%, rgba(101,179,122,0.2) 50%);
    background-image: -moz-linear-gradient(transparent 50%, rgba(101,179,122,0.2) 50%);
    background-size: 10px 10px;
    -moz-transform: translateX(-50%) translateY(-50%) rotate(25deg);
    -ms-transform: translateX(-50%) translateY(-50%) rotate(25deg);
    -webkit-transform: translateX(-50%) translateY(-50%) rotate(25deg);
    transform: translateX(-50%) translateY(-50%) rotate(25deg);
}
a.animated-button.gibson-one:hover:after {
    height: 600% !important;
    opacity: 1;
    color: #FFF;
}
a.animated-button.gibson-two {
    border: 2px solid #65b37a;
    color: #FFF;
}
a.animated-button.gibson-two:after {
    opacity: 0;
    background-image: -webkit-linear-gradient( transparent 50%, rgba(101,179,122,0.2) 50%);
    background-image: -moz-linear-gradient(transparent 50%, rgba(101,179,122,0.2) 50%);
    background-size: 10px 10px;
    -moz-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
    -ms-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
    -webkit-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
    transform: translateX(-50%) translateY(-50%) rotate(-25deg);
}
a.animated-button.gibson-two:hover:after {
    height: 600% !important;
    opacity: 1;
    color: #FFF;
}
a.animated-button.gibson-three {
    border: 2px solid #65b37a;
    color: #FFF;
}
a.animated-button.gibson-three:after {
    opacity: 0;
    background-image: -webkit-linear-gradient( transparent 50%, rgba(101,179,122,0.2) 50%);
    background-image: -moz-linear-gradient(transparent 50%, rgba(101,179,122,0.2) 50%);
    background-size: 10px 10px;
    -moz-transform: translateX(-50%) translateY(-50%) rotate(90deg);
    -ms-transform: translateX(-50%) translateY(-50%) rotate(90deg);
    -webkit-transform: translateX(-50%) translateY(-50%) rotate(90deg);
    transform: translateX(-50%) translateY(-50%) rotate(90deg);
}
a.animated-button.gibson-three:hover:after {
    height: 600% !important;
    opacity: 1;
    color: #FFF;
}
a.animated-button.gibson-four {
    border: 2px solid #65b37a;
    color: #FFF;
}
a.animated-button.gibson-four:after {
    opacity: 0;
    background-image: -webkit-linear-gradient( transparent 50%, rgba(101,179,122,0.2) 50%);
    background-image: -moz-linear-gradient(transparent 50%, rgba(101,179,122,0.2) 50%);
    background-size: 10px 10px;
    -moz-transform: translateX(-50%) translateY(-50%);
    -ms-transform: translateX(-50%) translateY(-50%));
    -webkit-transform: translateX(-50%) translateY(-50%);
    transform: translateX(-50%) translateY(-50%);
}
a.animated-button.gibson-four:hover:after {
    height: 600% !important;
    opacity: 1;
    color: #FFF;
}
/* Thar Buttons */

a.animated-button.thar-one {
    color: #fff;
    cursor: pointer;
    display: block;
    position: relative;
    border: 2px solid #F7CA18;
    transition: all 0.4s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
}
a.animated-button.thar-one:hover {
    color: #000 !important;
    background-color: transparent;
    text-shadow: none;
}
a.animated-button.thar-one:hover:before {
    bottom: 0%;
    top: auto;
    height: 100%;
}
a.animated-button.thar-one:before {
    display: block;
    position: absolute;
    left: 0px;
    top: 0px;
    height: 0px;
    width: 100%;
    z-index: -1;
    content: '';
    color: #000 !important;
    background: #F7CA18;
    transition: all 0.4s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
}
a.animated-button.thar-two {
    color: #fff;
    cursor: pointer;
    display: block;
    position: relative;
    border: 2px solid #F7CA18;
    transition: all 0.4s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
}
a.animated-button.thar-two:hover {
    color: #000 !important;
    background-color: transparent;
    text-shadow: ntwo;
}
a.animated-button.thar-two:hover:before {
    top: 0%;
    bottom: auto;
    height: 100%;
}
a.animated-button.thar-two:before {
    display: block;
    position: absolute;
    left: 0px;
    bottom: 0px;
    height: 0px;
    width: 100%;
    z-index: -1;
    content: '';
    color: #000 !important;
    background: #F7CA18;
    transition: all 0.4s cubic-bezier(0.215, 0.61, 0.355, 1) 0s;
}
a.animated-button.thar-three {
    color: #fff;
    cursor: pointer;
    display: block;
    position: relative;
    border: 2px solid #F7CA18;
    transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
0s;
}
a.animated-button.thar-three:hover {
    color: #000 !important;
    background-color: transparent;
    text-shadow: nthree;
}
a.animated-button.thar-three:hover:before {
    left: 0%;
    right: auto;
    width: 100%;
}
a.animated-button.thar-three:before {
    display: block;
    position: absolute;
    top: 0px;
    right: 0px;
    height: 100%;
    width: 0px;
    z-index: -1;
    content: '';
    color: #000 !important;
    background: #F7CA18;
    transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
0s;
}
a.animated-button.thar-four {
    color: #fff;
    cursor: pointer;
    display: block;
    position: relative;
    border: 2px solid #F7CA18;
    transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
0s;
}
a.animated-button.thar-four:hover {
    color: #000 !important;
    background-color: transparent;
    text-shadow: nfour;
}
a.animated-button.thar-four:hover:before {
    right: 0%;
    left: auto;
    width: 100%;
}
a.animated-button.thar-four:before {
    display: block;
    position: absolute;
    top: 0px;
    left: 0px;
    height: 100%;
    width: 0px;
    z-index: -1;
    content: '';
    color: #000 !important;
    background: #F7CA18;
    transition: all 0.4s cubic-bezier(0.42, 0, 0.58, 1);
0s;
*/
}


</style>


</head>

<body>

<p>
<img src="Image/main.png" width = "750" height="320">
</p>


<!-- 세션 여부 확인하고 연결된 세션이 존재하면 first.jsp로 접근해도 main.jsp로 돌려주기 -->

<% 

	String userId = (String)session.getAttribute("USERID");

	//세션(로그인)확인 후 첫 페이지로 이동
	if(userId != null){
	//	out.println("<script> alert('로그인해줘'); ");
		response.sendRedirect("Main.jsp");
	}
%>


<form name="form" method="post" autocomplete="off">

<center>

ID <input type="text" name="member_id" size="20"> &nbsp; 
PW <input type="password" name="member_pw" size="20">

<input type="submit" value="LogIn" onclick="submitfuc(1)"><br>

</center>

<center>
<input type="submit" id = "join" value="Join" onclick="submitfuc(2);" > 
<input type="submit" value="I don't remember mine!" onclick="submitfuc(3);">
</center>

</form>


</body>
</html>