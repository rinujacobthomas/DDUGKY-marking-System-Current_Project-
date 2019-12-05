<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<head>
	<title>DDU GKY</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<style><%@include file="vendor/daterangepicker/daterangepicker.css"%></style>
<style><%@include file="css/util.css"%></style>
<style><%@include file="css/main.css"%></style>
<style><%@include file="vendor/select2/select2.min.css"%></style>
<style><%@include file="vendor/animsition/css/animsition.min.css"%></style>
<style><%@include file="vendor/css-hamburgers/hamburgers.min.css"%></style>
<style><%@include file="vendor/animate/animate.css"%></style>
<style><%@include file="fonts/Linearicons-Free-v1.0.0/icon-font.min.css"%></style>
<style><%@include file="vendor/animate/animate.css"%></style>
<style><%@include file="fonts/font-awesome-4.7.0/css/font-awesome.min.css"%></style>
<style><%@include file="vendor/bootstrap/css/bootstrap.min.css"%></style>
<style><%@include file="images/icons/favicon.ico"%></style>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form action="Login" method="post" class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-51">
						Login
					</span>

					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
						<input class="input100" type="text" name="username" placeholder="Username">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
					</div>
					
					<!-- <div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>

						<div>
							<a href="#" class="txt1">
								Forgot?
							</a>
						</div>
					</div> -->

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="Batch1/WEB-INF/views/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Batch1/WEB-INF/views/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="Batch1/WEB-INF/views/vendor/bootstrap/js/popper.js"></script>
	<script src="Batch1/WEB-INF/views/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Batch1/WEB-INF/views/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Batch1/WEB-INF/views/vendor/daterangepicker/moment.min.js"></script>
	<script src="Batch1/WEB-INF/views/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="Batch1/WEB-INF/views/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="Batch1/WEB-INF/views/js/main.js"></script>
</body>
</html>