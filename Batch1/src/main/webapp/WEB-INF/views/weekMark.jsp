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
    .n
    {
    border:none;
     background-color:rgba(0,0,0,0);
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
<jsp:include page="_AdminMenu.jsp"></jsp:include>
 <div id="mark" style="display:block;margin-top: 2em;" >
        <table>
        <tr>
        <td>
        <h1>Weekly Scorecard</h1>
        </td>
        </tr>
                <tr>
                <form action="createListWeek" method="post">
                <th><input type="text" name="week"></th>
                <th><select name="batch" id="batch" style="width: 13em;">
                <option value="batch1">Batch 1</option>
                <option value="batch2">Batch 2</option>
                <option value="batch3">batch 3</option>
                <option value="batch4">batch 4</option>
            </select></th>
               <th> <input type="submit" value="Create"></th>
            </form></tr>			 
            <%String date=(String)request.getAttribute("week");
            if(date==null)
            {
            	date="";
            }
            %>
            <tr><form action="ListViewWeek" method="post">
                <th><input type="text" name="weekView" id="weekview" value=<%=date%>></th>
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
    {
    	%>
    	 <tr style="color:red;"> 
                   <th>Name of Student</th><th>ID</th><th>Batch</th><th>project Completion<th>Interview</th><th>Overall Performance</th>
                   <!--Table heading-->
               </tr>
    	<% 
    System.out.println("inside if");
    String project,interview,overall,name,id,batch;
    List<BoClass> studentsMark=(ArrayList)request.getAttribute("students");
    for(int i=0;i<studentsMark.size();i++)
    {
   	name=studentsMark.get(i).getName();
    id=studentsMark.get(i).getId();
    batch=studentsMark.get(i).getBatch();
    project=studentsMark.get(i).getProjectWeek();
    interview=studentsMark.get(i).getInterview();
    overall=studentsMark.get(i).getOverall();
    if(project==null)
    {
    project="";
    interview="";
    overall="";
    }
    %>
	 <tr style="border: none;border-bottom: 1px solid black;">
           <form action="updateWeek">
           <td><input id="nametxt" class="n" name="nametxt" type="text" value=<%=name %> readonly></td>
           <td><input id="idtxt" class="n" name="idtxt" type="text"  value=<%=id %> readonly></td>
           <td><input id="batchtxt" class="n" name="batchtxt" type="text" value= <%=batch %>  readonly></td>  
           <td><input id="projecttxt" name="projecttxt" type="text" value= <%=project %>  ></td>       
            <td><input id="interviewtxt" name="interviewtxt" type="text" value= <%=interview %> ></td>       
             <td><input id="overalltxt" name="overalltxt" type="text" value= <%=overall %>  ></td>       
               <td> <button type="submit">Update</button></td>
               </form> 
               </tr>
  <%} }
  %>
             </table> 
 </div>
 <script>
 function display()
 {
    document.getElementById("addUserb").style.backgroundColor="#e6e6e6";
    document.getElementById("dailyMark").style.backgroundColor="#e6e6e6";
    document.getElementById("removeStudentsb").style.backgroundColor="#e6e6e6";
    document.getElementById("Settingsb").style.backgroundColor="#e6e6e6";
    document.getElementById("weeklyMark").style.backgroundColor="#ccf2ff";
 }
 
 </script>
</body>
</html>