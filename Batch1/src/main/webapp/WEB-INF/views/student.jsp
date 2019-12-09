<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
    <%@ page import="com.batch1.bo.BoClass"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> 
    </script>
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500');

body {
  overflow-x: hidden;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
}

/* Toggle Styles */

#viewport {
  padding-left: 250px;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}

#content {
  width: 100%;
  position: relative;
  margin-right: 0;
}

/* Sidebar Styles */

#sidebar {
  z-index: 1000;
  position: fixed;
  left: 250px;
  width: 250px;
  height: 100%;
  margin-left: -250px;
  overflow-y: auto;
  background: #37474F;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}

#sidebar header {
  background-color: #263238;
  font-size: 20px;
  line-height: 52px;
  text-align: center;
}

#sidebar header a {
  color: #fff;
  display: block;
  text-decoration: none;
}

#sidebar header a:hover {
  color: #fff;
}
#sidebar .nav a{
  background: none;
  border-bottom: 1px solid #455A64;
  color: #CFD8DC;
  font-size: 14px;
  padding: 16px 24px;
}

#sidebar .nav a:hover{
  background: none;
  color: #ECEFF1;
}

#sidebar .nav a i{
  margin-right: 16px;
}
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
	//System.out.println("name : "+name+" id : "+id);
	%>
    <div id="viewport">
        <!-- Sidebar -->
        <div id="sidebar">
          <header>
            <a>DDUGKY </a>
          </header>
          <ul class="nav">
            <!-- <li>
              <a href="#">
                <i class="zmdi zmdi-view-dashboard"></i> Dashboard
              </a>
            </li> -->
            <li>
              <a href="#" onclick="display('daily')">
                <i class="zmdi zmdi-link"></i> Daily Scores
              </a>
            </li>
            <li>
              <a href="#" onclick="display('week')">
                <i class="zmdi zmdi-widgets" ></i> Weekly Scores
              </a>
            </li>
            <li>
              <a href="#">
                <i class="zmdi zmdi-calendar"></i> Events
              </a>
            </li>
            <li>
              <a href="#" onclick="display('about')">
                <i class="zmdi zmdi-info-outline"></i> About
              </a>
            </li>
            <li>
              <a href="logOut">
                <i class="zmdi zmdi-settings"></i> logout
              </a>
            </li>
            <li>
              <a href="#" onclick="display('contact')">
                <i class="zmdi zmdi-comment-more"></i> Contact us
              </a>
            </li>
          </ul>
        </div>
        <!-- Content -->
        <div id="content">
          <nav class="navbar navbar-default">
            <div class="container-fluid">
              <ul class="nav navbar-nav navbar-right">
                <li>
                  <a href="#"><i class="zmdi zmdi-notifications text-danger"></i>
                  </a>
                </li>
                <li><a><%=name %></a></li>
              </ul>
            </div>
          </nav>
          <div class="container-fluid">
            <!-- <h1>Simple Sidebar</h1>
            <p>
              Make sure to keep all page content within the 
              <code>#content</code>.
            </p> -->
	
<div id="daily" style="display: none; margin-left: 5em;">
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
<div id="week" style="display: none; margin-left: 5em;">
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
<body>
  <div  id="contact" style="display: none;margin-left: 5em;">
    <div style="font-size: 20px;">Rinu Thomas</div>
    <br>
    <div>Enail id: rinujacobthomas@gmail.com</div>
    <br>
    <div>GitHub profile: https://github.com/rinujacobthomas</div>
  </div>
<script>
function display(id)
{
document.getElementById("daily").style.display="none";
document.getElementById("week").style.display="none";
document.getElementById("contact").style.display="none";
document.getElementById(id).style.display="block";
}
</script>
          </div>
        </div>
      </div>
</body>
</html>