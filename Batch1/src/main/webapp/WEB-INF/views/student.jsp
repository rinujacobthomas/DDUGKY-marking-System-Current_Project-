<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
    <%@ page import="com.batch1.bo.BoClass"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
table {
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid black;
}
td {
  border-bottom: 1px solid #ddd;
}
tr:nth-child(even) {background-color: #f2f2f2;}
</style>
<body>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
List<BoClass> li=(List)request.getAttribute("list");
String name=li.get(0).getName();
String id=li.get(0).getId();
System.out.println("name : "+name+" id : "+id);
%>
 <div style="height: 6em;width: 86em; background-color: blue; ">
        <div style="color:white;margin-left: 3em;"><h1><%=name %></h1><a  style="color: white;" href="logOut" ><h3>LogOut</h3></a></div>
      </div>
  <div><button id="daily" onclick="display('dailydiv')">Daily Scorecard</button>&nbsp;&nbsp;<button id="week" onclick="display('weekdiv')">Weekly Scorecard</button></div>
<div id="dailydiv" style="display: none;">

<table  cellpadding="10" style="width: 60em;">
  <tr><th>Day</th><th>Viva Score</th><th>Project Score</th><th>coding Score</th></tr>
<%
for(int i=0;i<li.size();i++)
{ 
String day=li.get(i).getDay();
String viva=li.get(i).getViva();
String project=li.get(i).getProject();
String coding=li.get(i).getCoding();

%>
<tr><td><%= day%></td><td><%=viva %></td><td><%=project %></td><td><%=coding %></td></tr>
<%} %>
</table>
</div>
</div>
<div id="weekdiv" style="display: none;">
<table  cellpadding="10" style="width: 60em;">
  <tr><th>Week</th><th>project Score</th><th>Interview Score</th><th>Overall Score</th></tr>
<%
List<BoClass> bo2=(List)request.getAttribute("listweek");
for(int i=0;i<bo2.size();i++)
{ 
	String week=bo2.get(i).getWeek();
	String project=bo2.get(i).getProjectWeek();
	String overall=bo2.get(i).getOverall();
	String interview=bo2.get(i).getInterview();

%>
<tr><td><%=week %></td><td><%=project %></td><td><%=interview %></td><td><%=overall %></td></tr>
<%} %>
</table>
</div>
<script>
function display(id)
{
document.getElementById("dailydiv").style.display="none";
document.getElementById("weekdiv").style.display="none";
document.getElementById(id).style.display="block";
}
</script>
</body>
</html>