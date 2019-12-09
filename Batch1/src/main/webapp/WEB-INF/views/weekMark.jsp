<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
    <%@ page import="com.batch1.bo.BoClass"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> 
    </script>
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


<body style="background-color: lightgray;">
        <div class="container">
                <div class="row" style="margin-top: 1em;">
                          <div class="col-sm-12 col-md-6 col-lg-6 " style="padding-left: 4em;padding-right:5em;">
                              <div style="border: 1.5px solid silver;height:14em;border-radius: 10px;padding-left: 6.3em;background-color: white;">
                                    <div style="font-size: 20px;margin-top:.4em;margin-left: 4em;">New List</div>
                                    <input  class="form-control" type="date" id="weekadd" style="width: 20em;text-align: center;margin-top: 1em;">
                                    <select class="form-control" name="" id="batchadd" style="width: 20em;margin-top: 1em;">
                                            <option value="batch1">Batch 1</option>
                                            <option value="batch2">Batch 2</option>
                                            <option value="batch3">Batch 3</option>
                                            <option value="batch4">Batch 4</option>
                                    </select>
                                    <button id="add" style="margin-top: 1em;margin-left:7em;width: 6em;background-color:#1a53ff;color: white;border-radius: 6px;border:none;">Add</button>
                            </div>
                          </div>
<%String week=(String)request.getAttribute("week");
            if(week==null)
            {
            	week="";
            }
            %>
                          <div class="col-sm-12 col-md-6 col-lg-6 " style="padding-left: 4em;padding-right:5em;">
                                <div style="border: 1.5px solid silver;height: 14em;border-radius: 10px;padding-left: 6.3em;background-color: white;">
                                    <div style="font-size: 20px;margin-top:.4em;margin-left: 4em;">View List</div>
                                    <form action="ListViewWeek">
                                        <input  class="form-control" type="date" name="weekView" style="width: 20em;text-align: center;margin-top: 1em;" value=<%=week%>>
                                        <select class="form-control" name="batchView" id="" style="width: 20em;margin-top: 1em;">
                                                <option value="batch1">Batch 1</option>
                                                <option value="batch2">Batch 2</option>
                                                <option value="batch3">Batch 3</option>
                                                <option value="batch4">Batch 4</option>
                                        </select>
                                        <button type="submit" style="margin-top: 1em;margin-left:7em;width: 6em;background-color:#1a53ff;color: white;border-radius: 6px;border:none;">View List</button>
                                    </form>
                                </div>
                            </div>
                            </div>
                </div>
        <script>
        document.getElementById("weekmarkmenu").style.color="red";
         $(document).ready(function() {
            $('#add').on('click', function(e){
	      var week = $('#weekadd').val(),
          batch=$('#batchadd').val(),
	       formData = "week=" + week+"&batch="+batch;
	   //console.log(batch);
	     $.ajax({
	       type: 'get',
	       url: 'createListWeek',
	       data: formData,
	      //dataType : 'json',
	       success: function() {
	    	 
	      }
	     });
	});
});
    </script>
  <%
    System.out.println(week);
    if(week.equals(""))
    {}
    else
    {
    	%>
    	<div style="margin-left:7em;margin-top:2em;border: 1.5px solid silver;background-color: white;border-radius: 8px;padding: 2em;width:83em;">
    	<table>
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