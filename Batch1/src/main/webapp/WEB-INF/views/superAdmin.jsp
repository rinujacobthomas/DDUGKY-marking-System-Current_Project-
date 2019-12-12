<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Document</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> 
    </script>
    <style>
        #txt1
  {
    margin-top: 2em;
  }
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
    .form-control
    {
      width: 20em;
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
#adduser,#change
  {
    width: 10em;
    background-color: #3578E5;
    color: white;
    padding: 4px;
    border-radius: 5px;
    outline: none;
    border:none;
  }
tr:nth-child(even) {background-color: #f2f2f2;}
    </style>
</head>
<body style="background-color: lightgray;">
    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-md-10 col-lg-10 ">
              <h1>Welcome Super Admin</h1>
        </div>
        <div class="col-sm-2 col-md-2 col-lg-2 ">
            <nav><a href="logOut"><h3>Log Out</h3></a></nav>
      </div>
        <div class="row">
            <div class="col-sm-0 col-md-6 col-lg-6 ">
                <div style="border: 1px solid silver;padding: 2em;border-radius: 10px;padding-left: 4em; margin-top: 2em;background-color: white;">
                    <div style="font-size: 25px;margin-left: 2.3em;">Add Trainer</div>
                  <div id="txt1" style="margin-top: 1em"><input type="text" class="form-control" id="name1" placeholder="Name" required></div>
                  <div id="txt1"><input type="text" class="form-control" id="id1" placeholder="ID" required></div>
                  <div id="txt1"><input type="password" class="form-control" id="pass1" placeholder="Password" required></div>
                  <div id="txt1" style="margin-left: 5.3em;"><button id="adduser">ADD</button></div>
                </div>
              </div>

              <div class="col-sm-12 col-md-6 col-lg-6 ">
                  <div style="border: 1px solid silver;padding: 2em;border-radius: 10px;padding-left: 4em; margin-top: 2em;background-color: white;">
                    <div style="font-size: 20px;">Password Change</div>
                      <input type="text" id="id" class="form-control" style="margin-top: 1em;width: 20em;" placeholder="ID">
                      <input type="text" id="password" class="form-control" placeholder="Password"style="margin-top: 2em;width: 20em;"> 
                      <input type="button" value="Change" id="change" class="form-control" style="margin-top: 2em;width: 10em;">
                    </div>
                  </div>
  </div>
</div>
<script>
    $(document).ready(function() {
    
      $('#change').on('click', function(e){
      var id = $('#id').val();
      var password=$('#password').val();
      var formData = "id="+id+"&password="+password;
      $.ajax({
	        type: 'get',
	        url: 'trainerPasswordChange',
	        data: formData,
	        dataType : 'json',
	        success: function() {	 
            $('#id').val("");
            $('#password').val("");
          }
	      }); 
  
});
$('#adduser').on('click', function(e){
	   e.preventDefault();

	   var name = $('#name1').val(),
	       id = $('#id1').val(),
	       batch = $("#batch1 option:selected").val(),
	       password=$("#pass1").val(),
	       formData = "name=" + name + "&id=" + id + "&password="+password;
         //console.log(formData);
         
	   console.log(name);
	   if(id==""||password==""||name=="")
		   {
		   console.log(formData);
		   }
	   else
		   {
	    $.ajax({
	      type: 'get',
	      url: 'addTrainer',
	      data: formData,
	      success: function() {
	    	  $('#name1').val("");
	    	  $('#id1').val("");
	    	  $("#pass1").val("");
        }
	      }); 
    }
   
});
});
  </script>
</body>
</html>