<%-- 
    Document   : registration
    Created on : Jan 24, 2020, 10:48:08 PM
    Author     : Break
--%>
<%--
  Created by IntelliJ IDEA.
  User: Break
  Date: 12/2/2019
  Time: 6:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login </title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--===============================================================================================-->
  <link rel="icon" type="image/png" href="LoginCSS/images/icons/favicon.ico"/>
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="LoginCSS/vendor/bootstrap/css/bootstrap.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="LoginCSS/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="LoginCSS/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="LoginCSS/vendor/animate/animate.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="LoginCSS/vendor/css-hamburgers/hamburgers.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="LoginCSS/vendor/animsition/css/animsition.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="LoginCSS/vendor/select2/select2.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="LoginCSS/vendor/daterangepicker/daterangepicker.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="LoginCSS/css/util.css">
  <link rel="stylesheet" type="text/css" href="LoginCSS/css/main.css">
  <!--===============================================================================================-->
</head>

<body>
    

<div class="limiter">
  <div class="container-login100" style="background-image: url('LoginCSS/images/ustlogin.jpg');">
    <div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Organissembly
				</span>
<form class="login100-form validate-form p-b-33 p-t-5" action="Login" method="post">
	 <div class="wrap-input100 validate-input" data-validate = "Enter username">
          <input class="input100" type="text" name="user" placeholder="username">

          <span class="focus-input100" data-placeholder="&#xe82a;"></span>
        </div>
    
	<div class="wrap-input100 validate-input" data-validate="Enter password">
          <input class="input100" type="password" name="password" placeholder="password">
          <span class="focus-input100" data-placeholder="&#xe80f;"></span>
        </div>
	<div class="container-login100-form-btn m-t-32">
          <button class="login100-form-btn">
            Login
          </button>
             <form class="container-login100-form-btn m-t-32" action="registration.jsp" method="post">
          <button class="login100-form-btn">
            Register
          </button>
        </form>
        </div>
    
 
</form>
  

      </form>
    </div>
  </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="../LoginCSS/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="../LoginCSS/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="../LoginCSS/vendor/bootstrap/js/popper.js"></script>
<script src="../LoginCSS/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="../LoginCSS/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="../LoginCSS/vendor/daterangepicker/moment.min.js"></script>
<script src="../LoginCSS/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="../LoginCSS/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="../LoginCSS/js/main.js"></script>

</body>
</html>