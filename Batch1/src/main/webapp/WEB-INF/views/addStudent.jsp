<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="_AdminMenu.jsp"></jsp:include>
<script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> 
    </script> 

<div id="addUser" style="margin-top: 2em;" >
    <form  action="">
           <input type="text" id="name1" name="name" placeholder="Name"  style="margin-top: 2em;"><br>
            <input type="text" id="id1" name="id" placeholder="ID"  style="margin-top: 2em;"><br>
            <select name="batch" id="batch1" style="margin-top: 2em; width: 13em;">
                <option value="batch1">Batch 1</option>
                <option value="batch2">Batch 2</option>
                <option value="batch3">batch 3</option>
                <option value="batch4">batch 4</option>
            </select>
            <button id="adduser" type="submit">Add Student</button>
            <div id="addResponse"></div>
    </form> 
 </div>
 <script>
$(document).ready(function() {
$('#adduser').on('click', function(e){
	   e.preventDefault();

	   var name = $('#name1').val(),
	       id = $('#id1').val(),
	       batch = $("#batch1 option:selected").val(),
	       formData = "name=" + name + "&id=" + id + "&batch=" + batch;
	   console.log(name);
	    $.ajax({
	      type: 'get',
	      url: 'addUser',
	      data: formData,
	      success: function() {
	        $('#addResponse').html("Success");
	      }
	    });
	});
});
</script> 
</body>
</html>