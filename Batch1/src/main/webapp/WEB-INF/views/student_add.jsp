<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Student Add</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> 
    </script> 
</head>
<body>
  <style>
  #txt1
  {
    margin-top: 2em;
  }
  #texta
  {
    width: 20em;
    height: 2.5em;
    border: 1.5px solid silver;
    border-radius: 5px;
    padding-left: 1em;
    outline: none;
  }
  .form-control,#selbatch
  {
    width: 17em;
    height: 2.5em;
    border: 1.5px solid silver;
    border-radius: 5px;
    padding-left: 1em;
    outline: none;
  }
  #btn,#adduser,#Search
  {
    width: 7em;
    background-color: #3578E5;
    color: white;
    padding: 4px;
    border-radius: 5px;
    outline: none;
    border:none;
  }
  #addTrainer
  {
    border: 1px solid silver;
    padding: 2em;
    width: 20em;
    border-radius: 10px;
  }
  #bulk
  {
    border: 1px solid silver;
    padding: 2em;
    border-radius: 10px;
    outline: none;
  }
  ::placeholder
  {
    text-align: center;
  }
  *,
*:before,
*:after {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font:  "PT Sans", Arial, sans-serif;
background-color: lightgray;
}
  </style>
  <body>
  <jsp:include page="_AdminMenu.jsp"></jsp:include>
  <div class="container">
    <div class="row">
              <div class="col-sm-0 col-md-3 col-lg-4 ">
                  <div style="border: 1px solid silver;padding: 2em;border-radius: 10px;padding-left: 4em; margin-top: 2em;background-color: white;">
                      <div style="font-size: 25px;margin-left: 2.3em;">Add Student</div>
                    <div id="txt1"><input type="text" class="form-control" id="name1" placeholder="Name" required></div>
                      <div id="txt1"> <select id="batch1" class="form-control" style="color:#808080;">
                      <option value="batch1">Batch 1</option>
                      <option value="batch2">Batch 2</option>
                      <option value="batch3">Batch 3</option>
                      <option value="batch4">Batch 4</option>
                    </select></div>
                    <div id="txt1"><input type="text" class="form-control" id="id1" placeholder="ID" required></div>
                    <div id="txt1"><input type="password" class="form-control" id="pass1" placeholder="Password" required></div>
                    <div id="txt1" style="margin-left: 5.3em;"><button id="adduser">ADD</button></div>
                  </div>
                </div>
                <div class="col-sm-0 col-md-9 col-lg-8">
                  <div style="border: 1px solid silver;padding: 2em;border-radius: 10px;margin-top: 2em;padding-left: 3em;background-color: white;height: 27.5em;">
                      <div style="font-size: 25px;">Add Student</div>
                    <form action="">
                    <div id="txt1"><textarea name="" id="" cols="60" rows="5" style="resize: none;border: 1.2px solid silver;border-radius: 6px;"
                       placeholder="Name"></textarea></div>
                    <div style="margin-top: 2em;" class="input-group">
                        <label class="input-group-btn">
                            <span class="btn btn-primary">
                                Browse&hellip; <input type="file" style="display: none;" multiple >
                            </span>
                        </label>
                        <input type="text" class="form-control" readonly style="width: 10em;">
                    </div>
                    <div id="txt1" style="margin-bottom: 3.7em;"><button id="btn">ADD</button></div>
                  </form> 
                  </div>
                  </div>  
                  
    </div>
    <div class="row" style="padding: 1em;">
      <div style="border: 1px solid silver;border-radius: 10px;padding: 1em;padding-left: 2.5em; height: 13em;background-color: white;margin-top: 1em;">
          <div style="font-size: 25px;margin-left: 2.3em;">Delete Student</div>
          <div class="col-sm-0 col-md-3 col-lg-4" style="border: 1px solid silver;padding: 1em;border-radius: 10px;">
              <input type="text" class="form-control" id="idsearch" placeholder="ID" style="margin-left:1em;">
              <button id="Search" style="margin-left: 6em;margin-top: 1em;">Search</button>
          </div>
          <div class="col-sm-0 col-md-3 col-lg-7 "style="margin-left:2em;padding: 1em; border: 1px solid silver;border-radius: 10px;height: 7.5em;">
              <div style="margin-top:2em;">
              <form action="">
  				<input type="text" value="" id="sername" style="border: none;">
 				 <input type="text" value="" id="serid"style="border: none;">
 				 <input type="text" value="" id="serbatch"style="border: none;">
  				<button type="submit" id="delete" style="border-radius: 4px;background-color: #3578E5;color: white;border: none;">Delete</button>
				</form>
              </div>
          </div>          

    </div>
  </div>
  </div>
  <script>
    $(document).ready(function() {
    	 document.getElementById("addmenu").style.color="red";
$('#Search').on('click', function(e){
	   e.preventDefault();
	   $('#sername').val("");
  	 $('#serid').val("");
  	 $('#serbatch').val("");
	      var id = $('#idsearch').val();
	       formData = "id=" + id;
	   console.log(id);
	    $.ajax({
	      type: 'get',
	      url: 'Search_And_Delete',
	      data: formData,								
	      dataType : 'json',
	      success: function(data) {
	    	  $('#idsearch').val("");				
	    	 var e= JSON.stringify(data);
	    	 $('#sername').val(data.name);
	    	 $('#serid').val(data.id);
	    	 $('#serbatch').val(data.batch);
	    	  //alert(e);
	    	   // var Html="<tr><td>"+data.name+"</td><td>"+data.id+"</td></tr>";
	            //$('#searchres').append(Html);
	      }
	    });
	});
$('#delete').on('click', function(e){
	      var id = $('#serid').val();
	       formData = "id=" + id;
	   console.log(id);
	    $.ajax({
	      type: 'get',
	      url: 'Delete_Student',
	      data: formData,
	      //dataType : 'json',
	      success: function() {
	    	  $('#sername').val("");
	    		 $('#serid').val("");
	    		 $('#serbatch').val("");
	      }
	    });
	});
$('#adduser').on('click', function(e){
	   e.preventDefault();

	   var name = $('#name1').val(),
	       id = $('#id1').val(),
	       batch = $("#batch1 option:selected").val(),
	       password=$("#pass1").val(),
	       formData = "name=" + name + "&id=" + id + "&batch=" + batch+"&password="+password;
	   console.log(name);
	   if(id==""||password==""||name=="")
		   {}
	   else
		   {
	    $.ajax({
	      type: 'get',
	      url: 'addUser',
	      data: formData,
	      success: function() {
	    	  $('#name1').val("");
	    	  $('#id1').val("");
	    	  $("#pass1").val("");
	        $('#addResponse').html("Success");
	      }
	    });
}
});
    });
  </script>
</body>
</html>