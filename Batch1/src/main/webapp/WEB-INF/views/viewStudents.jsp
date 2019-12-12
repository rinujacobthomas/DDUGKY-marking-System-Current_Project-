<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>View Students</title>
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
    width: 30em;
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
        <div class="row">
                  <div class="col-sm-12 col-md-6 col-lg-6 ">
                      <div style="border: 1px solid silver;padding: 2em;border-radius: 10px;padding-left: 4em; margin-top: 2em;background-color: white;">
                        <div style="font-size: 20px;">Students List</div>
                        <select name="" id="batch" class="form-control" style="margin-top: 1em;width: 20em;">
                        <option value="null">Select Batch</option>
                      <option value="batch1">Batch 1</option>
                      <option value="batch2">Batch 2</option>
                      <option value="batch3">Batch 3</option>
                      <option value="batch4">Batch 4</option>
                      <option value="batch5">Batch 5</option>
                      <option value="batch6">Batch 6</option>
                      <option value="batch7">Batch 7</option>
                      <option value="batch8">Batch 8</option>
                      <option value="batch9">Batch 9</option>
                      <option value="batch10">Batch 10</option>
                      <option value="batch11">Batch 11</option>
                      <option value="batch12">Batch 12</option>
                    </select>
  <div style="margin-top: 2em;">
    <table>
      <tr id="tr">
        <th>name</th><th>ID</th>
      </tr>
      <tbody id="table">

      </tbody>
    </table>
  </div>
 </div>
</div>
<script>
// if(document.getElementById("batch").value=="null")
// {
//   document.getElementById("tr").style.display="none";
// }
// else
// {
//   document.getElementById("tr").style.display="block"
// }
</script>
   <div class="col-sm-12 col-md-6 col-lg-6 ">
    <div style="border: 1px solid silver;padding: 2em;border-radius: 10px;padding-left: 4em; margin-top: 2em;background-color: white;">
      <div style="font-size: 20px;">Password Change</div>
        <input type="text" id="id" class="form-control" style="margin-top: 1em;width: 20em;" placeholder="ID">
        <input type="text" id="password" class="form-control" placeholder="Password"style="margin-top: 2em;width: 20em;"> 
        <input type="button" value="Clear" id="clear" class="form-control" style="margin-top: 2em;width: 10em;">
      </div>
    </div>
  </div>
</div>
  <script>
           $(document).ready(function() {
        	   document.getElementById("viewstudents").style.color="red";
            $('#clear').on('click', function(e){
              $('#id').val("");
            $('#password').val("");
            });
            $('#batch').on('change', function(e){
	      var batch = $('#batch').val(),
	       formData = "batch="+batch;
         console.log(batch);
         if(batch!="null")
         {
	      $.ajax({
	        type: 'get',
	        url: 'batchStudentsView',
	        data: formData,
	        dataType : 'json',
	        success: function(data) {
	        	$("#table").empty();
	            console.log(data.length);
	        	  for (var i = 0; i < data.length; i++) {
	        	        tr = $('<tr/>');
	        	        tr.append("<td>" + data[i].name + "</td>");
	        	        tr.append("<td>" + data[i].id + "</td>");
	        	        $("#table").append(tr);
	        	    } 
	       }
	      });
         }
	});
  $('#id').keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
      var id = $('#id').val();
      var formData = "id="+id;
      $.ajax({
	        type: 'get',
	        url: 'passwordView',
	        data: formData,
	        dataType : 'json',
	        success: function(data) {
	        	$('#password').val(data.password);
	        	  
	       }
	      }); 
    }
});
$('#password').keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
      var id = $('#id').val();
      var password=$('#password').val();
      var formData = "id="+id+"&password="+password;
      $.ajax({
	        type: 'get',
	        url: 'passwordChange',
	        data: formData,
	        dataType : 'json',
	        success: function() {	 
            $('#id').val("");
            $('#password').val("");
	       }
	      }); 
    }
});
});
  </script>
</body>
</html>