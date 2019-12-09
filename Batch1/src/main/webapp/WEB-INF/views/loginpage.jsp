<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
    <%@ page import="com.batch1.bo.BoClass"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>Trainer Account</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> 
    </script>
    <style>
    #name:hover
    {
        color: red;
    }
    select
    {
        width: 10em;
    }
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
    text-align:center;
}
td {
  border-bottom: 1px solid #ddd;

}
tr:nth-child(even) {background-color: #f2f2f2;}
    </style>
</head>
<body style="background-color: lightgray;">
<jsp:include page="_AdminMenu.jsp"></jsp:include>

        <div class="container">
                <div class="row" style="margin-top: 1em;">
                          <div class="col-sm-12 col-md-6 col-lg-6 " style="padding-left: 4em;padding-right:5em;">
                              <div style="border: 1.5px solid silver;height:14em;border-radius: 10px;padding-left: 6.3em;background-color: white;">
                                    <div style="font-size: 20px;margin-top:.4em;margin-left: 4em;">New List</div>
                                    <input  class="form-control" type="date" id="dateadd" style="width: 20em;text-align: center;margin-top: 1em;">
                                    <select class="form-control" name="" id="batchadd" style="width: 20em;margin-top: 1em;">
                                            <option value="batch1">Batch 1</option>
                                            <option value="batch2">Batch 2</option>
                                            <option value="batch3">Batch 3</option>
                                            <option value="batch4">Batch 4</option>
                                    </select>
                                    <button id="add" style="margin-top: 1em;margin-left:7em;width: 6em;background-color:#3578E5;color: white;border-radius: 6px;border:none;">Add</button>
                            </div>
                          </div>
                           <%
            String date=(String)request.getAttribute("date");
            if(date==null)
            {
            	date="";
            }
            %>
                          <div class="col-sm-12 col-md-6 col-lg-6 " style="padding-left: 4em;padding-right:5em;">
                                <div style="border: 1.5px solid silver;height: 14em;border-radius: 10px;padding-left: 6.3em;background-color: white;">
                                    <div style="font-size: 20px;margin-top:.4em;margin-left: 4em;">View List</div>
                                    <form action="ListView">
                                        <input  class="form-control" type="date" name="dateView" style="width: 20em;text-align: center;margin-top: 1em;" value=<%=date%>>
                                        <select class="form-control" name="batchView" id="" style="width: 20em;margin-top: 1em;">
                                                <option value="batch1">Batch 1</option>
                                                <option value="batch2">Batch 2</option>
                                                <option value="batch3">Batch 3</option>
                                                <option value="batch4">Batch 4</option>
                                        </select>
                                        <button type="submit" style="margin-top: 1em;margin-left:7em;width: 6em;background-color:#3578E5;color: white;border-radius: 6px;border:none;">View List</button>
                                    </form>
                                </div>
                            </div>
                            </div>
                </div>
        <script>
        document.getElementById("dailymarkmenu").style.color="red";
         $(document).ready(function() {
            $('#add').on('click', function(e){
	      var date = $('#dateadd').val(),
          batch=$('#batchadd').val(),
	       formData = "date=" + date+"&batch="+batch;
	   //console.log(batch);
	     $.ajax({
	       type: 'get',
	       url: 'createList',
	       data: formData,
	      //dataType : 'json',
	       success: function() {
	    	  $('#sername').val("");
	     		 $('#serid').val("");
	     		 $('#serbatch').val("");
	      }
	     });
	});
});
    </script>
  <%--          
            <div><form action="ListView" method="post">
              <input type="text" name="dateView" id="dateview" placeholder="Date" value=<%=date%>>
              <select name="batchView" id="batch" style="width: 13em;">
              <option value="batch1">Batch 1</option>
              <option value="batch2">Batch 2</option>
              <option value="batch3">batch 3</option>
              <option value="batch4">batch 4</option>
          </select>
             <input type="submit" id="listview" value="View Students">
          </form></div>
          
                --%>
  <%
   System.out.println(date);
    if(date.equals(""))
    {}
    else
    {%>
    <div style="margin-left: 9.5em;margin-top:2em;border: 1.5px solid silver;background-color: white;border-radius: 8px;padding: 2em;width:76em;">
      <table >
    <tr style="color:red;"> 
                   <th>Name of Student</th><th>ID</th><th>Batch</th><th>Viva score</th><th>Coding Score</th><th>Project Completion</th><th></th>
                   <!--Table heading-->
               </tr>
    <% 
    System.out.println("inside if");
    String viva,project,coding,color="black";
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
    color="black";
    }
    else
    {
    	color="white";
    }
    %>
	 <tr style="border: none;border-bottom: 1px solid black;">
           <form action="update">
           <td><input id="nametxt" class="n" name="nametxt" type="text" value=<%=name %> readonly></td>
           <td><input id="idtxt" class="n" name="idtxt" type="text" value=<%=id %> readonly></td>
           <td><input id="batchtxt" class="n" name="batchtxt" type="text" value=<%=batch %> readonly></td>         
           <td><select name="vivatxt" class="n" id="vivatxt" value=<%=viva %>>
               <option value="null2" <%if(viva.equals("null")) {%>selected<%} %> >null2</option>
               <option value="0" <%if(viva.equals("0")) {%>selected<%} %>>0</option>
               <option value="1" <%if(viva.equals("1")) {%>selected<%} %>>1</option>
               <option value="2" <%if(viva.equals("2")) {%>selected<%} %>>2</option>
               <option value="3" <%if(viva.equals("3")) {%>selected<%} %>>3</option>
               <option value="4" <%if(viva.equals("4")) {%>selected<%} %>>4</option>
               <option value="5" <%if(viva.equals("5")) {%>selected<%} %>>5</option>
               </select></td>
               <td><select name="codingtxt" class="n" id="codingtxt" >
               <option value="null2" <%if(coding.equals("null")) {%>selected<%} %>>null2</option>
               <option value="0" <%if(coding.equals("0")) {%>selected<%} %>>0</option>
               <option value="1" <%if(coding.equals("1")) {%>selected<%} %>>1</option>
               </select></td>
               <td><select name="projecttxt" class="n" id="projecttxt">
               <option value="null2" <%if(project.equals("null")) {%>selected<%} %>>null2</option>
               <option value="0" <%if(project.equals("0")) {%>selected<%} %>>0</option>
               <option value="1" <%if(project.equals("1")) {%>selected<%} %>>1</option>
               </select></td>
               <td> <button type="submit" id="buttoncolor" style="background-color:#3578E5;color:<%=color %>;">Update</button></td>
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