<%@ page pageEncoding="utf-8" language="java" contentType="text/html;charset=euc-kr" import="java.sql.*,db.*,java.util.ArrayList,java.util.Date,java.util.*" %>
<html>
<html>

<head>
  <meta charset="UTF-8">
  <title> 32400 CINEMA - register </title>
  <style type="text/css">
    #ads {
      margin-top: 20px;
    }

    .tableRollOverEffect1 {
      background-color: #D8D8D8;
      color: #FFF;
    }

    .tableRowClickEffect1 {
      background-color: #00BFFF;
      color: #FFF;
    }

    body {
      text-align: center;
      color: #ecf0f1;
      background-color: white;
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
      margin-top: 20px;
    }

    .button-3d {
      position: relative;
      width: auto;
      display: inline-block;
      color: black;
      text-decoration: none;
      border-radius: 5px;
      border: solid 1px black;
      background: white;
      text-align: center;
      padding: 16px 18px 14px;
      margin: 12px;

      -webkit-transition: all 0.1s;
      -moz-transition: all 0.1s;
      transition: all 0.1s;

      -webkit-box-shadow: 0px 6px 0px #D8D8D8;
      -moz-box-shadow: 0px 6px 0px #D8D8D8;
      box-shadow: 0px 6px 0px #D8D8D8;
    }

    .button-3d:active {
      -webkit-box-shadow: 0px 2px 0px #D8D8D8;
      -moz-box-shadow: 0px 2px 0px #D8D8D8;
      box-shadow: 0px 2px 0px #D8D8D8;
      position: relative;
      top: 4px;
    }
  </style>
  <script>
	  var l = 0;
	  var r = 0;
	  var tno = '<%= request.getParameter("tno") %>';
  	  var rbt = document.getElementsByName("op");
  	  
	  function td_click(obj){
		  
		if(obj.childNodes[0].nodeValue == "■"){
			alert("이미 예매된 좌석입니다.")
			return;
		}
	
		var td = document.getElementsByTagName('td');
		for(var i=0; i < td.length; i++){
			td[i].style.backgroundColor = "white";
		}
		obj.style.backgroundColor = "#00BFFF";
		l = obj.parentNode.rowIndex
		r = obj.cellIndex
	  }

      function bt_click(){
    	location.href ="reservation0.jsp";
    }
      function bt_click2(){
    	  if(r == 0 || l == 0){
      		alert("좌석을 선택해주십시오.");
      	}
      	else{
      		for(var i = 0; i < rbt.length; i++){
  			  if(rbt[i].checked == true){
  				location.href ="reservation2.jsp?l="+l+"&r="+r+"&tno="+tno+"&op="+rbt[i].value;
  			  }
  		  }
      	}
      }
  </script>
</head>
<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 50%; margin-left: 25%;">
  <h1>32400 CINEMA</h1>
  <p class="login-mgs" style="color: black;">
  <%
  reservation_DB.loadConnect(); 
 request.setCharacterEncoding("euc-kr");
 String tno = request.getParameter("tno");
 ArrayList<String> title = new ArrayList<String>();
 title = reservation_DB.showTimeTable(tno);
 String[] t = new String[3];
 t = title.get(0).split(";");
%>
    <p><%out.print("<"+t[1]+">    ━    "+t[2]+"관    ━    "+t[3]);%></p>
</header>

<body>
<% 
ArrayList<String> seat = new ArrayList<String>();
seat = reservation_DB.showSeat(tno);
int x = seat.size();

String[][] s = new String[x][];

for(int i = 0; i< x; i++){
	 s[i] = seat.get(i).split(";");
}

%>

  <table id="myTable" style="width:50%; margin-left: 25%; padding-top: 0; text-align: center ; color: black; border: 0 none; border-bottom: 1px solid #4b4a4f; ">
    <thead>
      <tr bgcolor=efefef>
        <th scope="col" bgcolor=white></th>
        <th scope="col">1</th>
        <th scope="col">2</th>
        <th scope="col">3</th>
        <th scope="col">4</th>
        <th scope="col">5</th>
        <th scope="col">6</th>
        <th scope="col">7</th>
        <th scope="col">8</th>
        <th scope="col">9</th>
        <th scope="col">10</th>
      </tr>
    </thead>
    <tbody>
   <%
   int check = 0;
    for(int i = 1; i<= 10; i++){
    	out.print("<tr bgcolor=white>");
    	out.print("<th scope=\"row\" bgcolor=efefef>"+(char)(i+64)+"</th>");
    	for(int j = 1; j<=10; j++){
    		check = 0;
    		for(int k = 0; k < s.length; k++){
    			if(s[k][0].equals( String.valueOf(i)) && s[k][1].equals( String.valueOf(j))){
    				System.out.println(s[k][0]+"@"+String.valueOf(i)+"@"+s[k][1]+"@"+String.valueOf(j));
    				out.print("<td onclick=\"td_click(this)\">■</td>");
    				check = 1;
    			}
    		}
    		if(check == 0){
    			out.print("<td onclick=\"td_click(this)\">□</td>");
    		}
    	}
    	out.print("</tr>");
    }
   %>
    </tbody>
  </table><br>
  	<p style="color:black">금액 : 11000원</p>
  	<p style="color:black">결제 방법</p>
	<input type="radio" name="op" value="card" checked="checked"><span style="color:black">카드</span>
	<input type="radio" name="op" value="point"><span style="color:black">포인트</span><br><br>

  <a class="button-3d" onclick="bt_click()">이전</a>
  <a href="#" class="button-3d" onclick="bt_click2()">예매</a><br>

</body>

</html>
