<%@page import="com.project.tfa.DBUtil" %>
<%@ page pageEncoding="utf-8" language="java" contentType="text/html;charset=euc-kr" import="java.sql.*,db.*,java.util.ArrayList,java.util.Date,java.util.*" %>
<html>

<head>
  <meta charset="UTF-8">
  <title> 32400 CINEMA </title>
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
  <script type="text/javascript">
    var arrayOfRolloverClasses = new Array();
    var arrayOfClickClasses = new Array();
    var activeRow = false;
    var activeRowClickArray = new Array();
    var rIndex = 0;
    var rno = 0;
    
    function highlightTableRow() {
      var tableObj = this.parentNode;
      if (tableObj.tagName != 'TABLE') tableObj = tableObj.parentNode;

      if (this != activeRow) {
        this.setAttribute('origCl', this.className);
        this.origCl = this.className;
      }
      this.className = arrayOfRolloverClasses[tableObj.id];

      activeRow = this;
    }

    function clickOnTableRow() {
      var tableObj = this.parentNode;
      if (tableObj.tagName != 'TABLE') tableObj = tableObj.parentNode;

      if (activeRowClickArray[tableObj.id] && this != activeRowClickArray[tableObj.id]) {
        activeRowClickArray[tableObj.id].className = '';
      }
      this.className = arrayOfClickClasses[tableObj.id];

      activeRowClickArray[tableObj.id] = this;
	  rIndex = this.rowIndex;
    }

    function resetRowStyle() {
      var tableObj = this.parentNode;
      if (tableObj.tagName != 'TABLE') tableObj = tableObj.parentNode;

      if (activeRowClickArray[tableObj.id] && this == activeRowClickArray[tableObj.id]) {
        this.className = arrayOfClickClasses[tableObj.id];
        return;
      }
      var origCl = this.getAttribute('origCl');
      if (!origCl) origCl = this.origCl;
      this.className = origCl;
    }

    function addTableRolloverEffect(tableId, whichClass, whichClassOnClick) {
      arrayOfRolloverClasses[tableId] = whichClass;
      arrayOfClickClasses[tableId] = whichClassOnClick;

      var tableObj = document.getElementById(tableId);
      var tBody = tableObj.getElementsByTagName('TBODY');
      if (tBody) {
        var rows = tBody[0].getElementsByTagName('TR');
      } else {
        var rows = tableObj.getElementsByTagName('TR');
      }
      for (var no = 0; no < rows.length; no++) {
        rows[no].onmouseover = highlightTableRow;
        rows[no].onmouseout = resetRowStyle;

        if (whichClassOnClick) {
          rows[no].onclick = clickOnTableRow;
        }
      }
    }
    function bt_click(){
    	location.href = "timetable_manage0.jsp";
    }

  </script>
</head>
<header style="border-bottom: 1px solid #4b4a4f; padding-bottom: 20px; padding-top: 20px; color: black; text-align: center; width: 50%; margin-left: 25%;">
  <h1>32400 CINEMA</h1>
  <p class="login-mgs" style="color: black;">배정 관리 - 배정 목록</p>
</header>

<body>
<%
 Connection conn = DBUtil.getMySQLConnection(); 
 request.setCharacterEncoding("euc-kr");
 ArrayList<String> result = new ArrayList<String>();
 result = DBUtil.showTimetable();
 int x = result.size();
 String[][] t = new String[x][];
 for(int i = 0; i< x; i++){
	 t[i] = result.get(i).split(";");
 }
%>
  <table id="myTable" style="width:50%; margin-left: 25%; padding-top: 0; text-align: center ; color: black; border: 0 none; border-bottom: 1px solid #4b4a4f; ">
    <thead>
      <tr bgcolor=efefef>
      	<td>배정번호</td>
        <td>영화번호</td>
        <td>상영관</td>
        <td>날짜</td>
        <td>시간</td>
      </tr>
    </thead>
    <tbody>
    <%
    for(int i = 0; i<x; i++){
    	out.print("<tr bgcolor=white>");
    	out.print("<td>"+t[i][0]+"</td>");
    	out.print("<td>"+t[i][1]+"</td>");
    	out.print("<td>"+t[i][2]+"</td>");
    	out.print("<td>"+t[i][3]+"</td>");
    	out.print("<td>"+t[i][4]+"</td>");
    	out.print("</tr>");
    }
      %>
    </tbody>
    
  </table><br>
	
  <a href="#" class="button-3d" onclick="bt_click()">이전</a>
  <script type="text/javascript">
    addTableRolloverEffect('myTable', 'tableRollOverEffect1', 'tableRowClickEffect1');
  </script>

</body>

</html>
