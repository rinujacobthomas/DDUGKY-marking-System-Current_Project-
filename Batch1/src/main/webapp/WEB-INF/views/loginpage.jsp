<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
    <%@ page import="com.batch1.bo.BoClass"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>Document</title>
    <style>
    #name:hover
    {
        color: red;
    }
    select
    {
        width: 10em;
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
</head>
<body>
<jsp:include page="_AdminMenu.jsp"></jsp:include>
 <div id="mark" style="display:block;margin-top: 2em;" >
        <table>
        <tr>
        <td>
        <h1>Daily Scorecard</h1>
        </td>
        </tr>
                <tr>
                <form action="createList" method="post">
                <th><input type="text" name="date"></th>
                <th><select name="batch" id="batch" style="width: 13em;">
                <option value="batch1">Batch 1</option>
                <option value="batch2">Batch 2</option>
                <option value="batch3">batch 3</option>
                <option value="batch4">batch 4</option>
            </select></th>
               <th> <input type="submit" value="Create"></th>
            </form></tr>			 <%String date=(String)request.getAttribute("date");
            if(date==null)
            {
            	date="";
            }
            %>
            <tr><form action="ListView" method="post">
                <th><input type="text" name="dateView" id="dateview" value=<%=date%>></th>
                <th><select name="batchView" id="batch" style="width: 13em;">
                <option value="batch1">Batch 1</option>
                <option value="batch2">Batch 2</option>
                <option value="batch3">batch 3</option>
                <option value="batch4">batch 4</option>
            </select></th>
                <th><input type="submit" id="listview" value="View Students"></th>
            </form>
                </tr>
               
  <%
   System.out.println(date);
    if(date.equals(""))
    {}
    else
    {%>
    <tr style="color:red;"> 
                   <th>Name of Student</th><th>ID</th><th>Batch</th><th>Viva score</th><th>Coding Score</th><th>Project Completion</th>
                   <!--Table heading-->
               </tr>
    <% 
    System.out.println("inside if");
    String viva,project,coding;
    List<BoClass> studentsMark=(ArrayList)request.getAttribute("students");
    for(int i=0;i<studentsMark.size();i++)
    {
    String name=studentsMark.get(i).getName();
    String id=studentsMark.get(i).getId();
    String batch=studentsMark.get(i).getBatch();
    viva=studentsMark.get(i).getViva();
    project=studentsMark.get(i).getProject();
    coding=studentsMark.get(i).getCoding();
    if(viva==null)
    {
    viva="null";
    project="null";
    coding="null";
    }
    %>
	 <tr style="border: none;border-bottom: 1px solid black;">
           <form action="update">
           <td><input id="nametxt" name="nametxt" type="text" value=<%=name %> readonly></td>
           <td><input id="idtxt" name="idtxt" type="text" value=<%=id %> readonly></td>
           <td><input id="batchtxt" name="batchtxt" type="text" value=<%=batch %> readonly></td>         
           <td><select name="vivatxt" id="vivatxt" value=<%=viva %>>
               <option value="null2" <%if(viva.equals("null")) {%>selected<%} %> >null2</option>
               <option value="0" <%if(viva.equals("0")) {%>selected<%} %>>0</option>
               <option value="1" <%if(viva.equals("1")) {%>selected<%} %>>1</option>
               <option value="2" <%if(viva.equals("2")) {%>selected<%} %>>2</option>
               <option value="3" <%if(viva.equals("3")) {%>selected<%} %>>3</option>
               <option value="4" <%if(viva.equals("4")) {%>selected<%} %>>4</option>
               <option value="5" <%if(viva.equals("5")) {%>selected<%} %>>5</option>
               </select></td>
               <td><select name="codingtxt" id="codingtxt" >
               <option value="null2" <%if(coding.equals("null")) {%>selected<%} %>>null2</option>
               <option value="0" <%if(coding.equals("0")) {%>selected<%} %>>0</option>
               <option value="1" <%if(coding.equals("1")) {%>selected<%} %>>1</option>
               </select></td>
               <td><select name="projecttxt" id="projecttxt">
               <option value="null2" <%if(project.equals("null")) {%>selected<%} %>>null2</option>
               <option value="0" <%if(project.equals("0")) {%>selected<%} %>>0</option>
               <option value="1" <%if(project.equals("1")) {%>selected<%} %>>1</option>
               </select></td>
               <td> <button type="submit">Update</button></td>
               </form> 
               </tr>
  <%} }%>
             </table> 
 </div>
 <script>
 function display(id,bid)
 {
     document.getElementById("addUser").style.display="none";
     document.getElementById("mark").style.display="none";
    var dis=document.getElementById(id);
    dis.style.display="block";
    document.getElementById("addUserb").style.backgroundColor="#e6e6e6";
    document.getElementById("markb").style.backgroundColor="#e6e6e6";
    document.getElementById(bid).style.backgroundColor="#ccf2ff";
 }
 
 </script>
</body>
</html>