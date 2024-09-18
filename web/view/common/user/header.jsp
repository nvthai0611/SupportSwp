<%-- 
    Document   : header.jsp
    Created on : May 14, 2024, 11:26:55 PM
    Author     : PC
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US"><!--<![endif]-->

    <head>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            /* Move close button to the right within modal footer */
            .modal-header{
                justify-content: flex-end;
            }
            /* Style for smaller register modal */
            #registerModal .modal-dialog {
                max-width: 500px; /* Adjust this value to make the modal smaller or larger */
                width: 100%;
            }

            #registerModal .modal-body {
                padding: 20px; /* Adjust the padding as needed */
            }
        </style>
        <!-- Basic Page Needs -->
        <meta charset="UTF-8">
            <title>Home Page</title>

            <meta name="author" content="CreativeLayers">

                <!-- Mobile Specific Metas -->
                <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

                    <!-- Boostrap style -->
                    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/bootstrap.min.css">

                        <!-- Theme style -->
                        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/style.css">

                            <!-- Reponsive -->
                            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/responsive.css">

                                <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/style-product-detail.css">

                                    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/font-awesome.css">

                                        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/style-slider.css">

                                            <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/changepasswordvsUserprofile.css"/>
                                            <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon/favicon.png">

                                                </head>
                                                <body class="header_sticky">

                                                    <section id="header" class="header">

                                                        <!--    model pop-up Sign--in-->
                                                        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true" data-backdrop="false">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <!--                        <form id="loginForm" onsubmit="return submitLogin()">-->
                                                                        <form method="post" action="/TechStore/login">
                                                                            <div class="form-group">
                                                                                <label for="username">Email</label>
                                                                                <input type="email" class="form-control" name="email" id="username" placeholder="   Enter your email" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="password">Password</label>
                                                                                <input type="password" class="form-control" name="pass" id="password" placeholder="Enter your password" required>
                                                                            </div>
                                                                            <c:if test="${not empty sessionScope.errorMessage1}">
                                                                                <h5 style="color: red">${sessionScope.errorMessage1}</h5>
                                                                            </c:if>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                                <button type="submit" class="btn btn-primary">Sign in</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>


                                                                    <p class="text-center" style="font-weight: bold">----------------------------------------------------OR--------------------------------------------------------------</p>
                                                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/TechStore/login&response_type=code&client_id=663682891894-4r5lipj7vrrqepl8c6qaca7mepdb0tbh.apps.googleusercontent.com" class="btn btn-lg btn-danger">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                                                            <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                                                        </svg>
                                                                        <span class="ms-2 fs-6">Sign in with Google</span>
                                                                    </a>
                                                                    <hr/>


                                                                    </form>
                                                                    <p class="text-center">You don't have account?<a href="#" style="font-weight: bold" onclick="hiddenRegister()">Sign up</a></p>
                                                                    <p class="text-center" style="font-weight: bold"><a href="#" style="font-weight: bold" onclick="showForgot()">Reset Password</a></p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--        model pop-up forgot password-->
                                                        <div class="modal fade" id="resetModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true" data-backdrop="false">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">

                                                                    <div class="modal-body">
                                                                        <!--                        <form id="loginForm" onsubmit="return submitLogin()">-->
                                                                        <form method="post" action="/TechStore/resetpassword">
                                                                            <div class="form-group">
                                                                                <label for="username">Email</label>
                                                                                <input type="email" class="form-control" name="email" id="username" placeholder="   Enter your email" required>
                                                                            </div>
                                                                            <c:if test="${not empty sessionScope.errorMessage2}">
                                                                                <h5 style="color: red">${sessionScope.errorMessage2}</h5>
                                                                            </c:if>
                                                                            <div class="modal-footer">
                                                                                <button type="submit" class="btn btn-primary"><a href="#" style="font-weight: bold" onclick="showSignInFromResetPopup()">Cancel</a></button>
                                                                                <button type="submit" class="btn btn-primary">Reset Password</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!--    register model pop-up-->
                                                        <div  class="modal fade"  style="overflow: auto; height: 500px" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true" data-backdrop="false">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">

                                                                    <div class="modal-body">
                                                                        <form action="/TechStore/UserVerify" method="post">
                                                                            <div class="form-group">
                                                                                <label for="fullname">FullName</label>
                                                                                <input type="text" class="form-control" id="fullname" name="fullname" namplaceholder="Enter your FullName" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <div class="d-flex">
                                                                                    <div for="gender">Gender:</div>
                                                                                    <div class="d-flex">
                                                                                        <div>
                                                                                            <input type="radio" id="male" name="gender" value="Male" required="">
                                                                                                <label for="male">Male</label>
                                                                                        </div>
                                                                                        <div>
                                                                                            <input type="radio" id="female" name="gender" value="Female" required="">
                                                                                                <label for="female">Female</label>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="email">Email</label>
                                                                                <input type="email" class="form-control" id="email" name="email" placeholder="   Enter your Email"required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="password">Password</label>
                                                                                <input type="password" minlength="6" maxlength="14" class="form-control" id="password" name="password" placeholder="   Enter your Password"required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="mobile">Moblie</label>
                                                                                <input type="tel" class="form-control" id="mobile" name="mobile" placeholder="   Enter your Mobile"required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="address">Address</label>
                                                                                <input type="text" class="form-control" id="address" name="address" placeholder="   Enter your Address"required>
                                                                            </div>
                                                    <!--                            <h5 style="color: red">${requestScope.error}</h5>-->

                                                                            <c:if test="${not empty sessionScope.errorMessage}">
                                                                                <h5 style="color: red">${sessionScope.errorMessage}</h5>
                                                                            </c:if>
                                                                            <div class="modal-footer">
                                                                                <button type="submit" class="btn btn-secondary"><a href="#" style="font-weight: bold" onclick="showSignInFromRegisterPopup()">Cancel</a></button>

                                                                                <button type="submit" class="btn btn-primary">Create Account</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>


                                                                    <p class="text-center" style="font-weight: bold">----------------------------------------------------OR--------------------------------------------------------------</p>
                                                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/TechStore/login&response_type=code&client_id=663682891894-4r5lipj7vrrqepl8c6qaca7mepdb0tbh.apps.googleusercontent.com" class="btn btn-lg btn-danger">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                                                            <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                                                        </svg>
                                                                        <span class="ms-2 fs-6">Sign in with Google</span>
                                                                    </a>
                                                                    <hr/>


                                                                    </form>
                                                                    <p class="text-center">Already have an account?<a href="#" id="signInLink" style="font-weight: bold" onclick="showSignIn()">Sign in</a></p>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="header-top">
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col-md-4">
                                                                        <ul class="flat-support">
                                                                            <li>
                                                                                <a href="faq.html" title="">Support</a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="https://maps.app.goo.gl/zKfNanyeXkdgaM9m8" target="_blank" title="">Store Locator</a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="${pageContext.request.contextPath}/views/user/item-page/ordertracking.jsp" title="">Track Your Order</a>
                                                                            </li>
                                                                        </ul><!-- /.flat-support -->
                                                                    </div><!-- /.col-md-4 -->
                                                                    <div class="col-md-4">
                                                                        <ul class="flat-infomation">
                                                                            <li class="phone">
                                                                                Call Us: <a href="#" title="">(+84) 3377 83926</a>
                                                                            </li>
                                                                        </ul><!-- /.flat-infomation -->
                                                                    </div><!-- /.col-md-4 -->

                                                                    <div class="col-md-4">

                                                                        <ul class="flat-unstyled">
                                                                            <li class="account">
                                                                                <a href="#" data-toggle="modal" data-target="#loginModal">Login</a>
                                                                                <a href="#" title="">My Account<i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                                                                <ul class="unstyled">  
                                                                                    <li>
                                                                                        <!--<a href="#" style="cursor: pointer" id="openModalBtn" title="">Change Password</a>-->
                                                                                        <p   id="openModalBtn" class="Changepassword_text" >Change password</p>
                                                                                    </li>
                                                                                    <li>
                                                                                        <!--<a href="#" style="cursor: pointer" id="openModalBtn" title="">Change Password</a>-->
                                                                                        <p   id="openModalBtn-user" class="Changepassword_text" >My Profile</p>
                                                                                    </li>
                                                                                    <li>
                                                                                        <!--<a href="#" style="cursor: pointer" id="openModalBtn" title="">Change Password</a>-->
                                                                                        <p   id="openModalBtn-user" class="Changepassword_text" ><a href="/TechStore/myorder">My Order</a></p>
                                                                                    </li>

                                                                                    <li>
                                                                                        <a href="logout" title="">Checkout</a>
                                                                                    </li>
                                                                                </ul><!-- /.unstyled -->



                                                                            </li>
                                                                            <li>
                                                                                <a href="javascript:void(0)" title="">VNĐ</a>
                                                                            </li>
                                                                        </ul><!-- /.flat-unstyled -->
                                                                    </div><!-- /.col-md-4 -->
                                                                </div><!-- /.row -->
                                                            </div><!-- /.container -->
                                                        </div><!-- /.header-top -->
                                                        <div class="header-middle">
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col-md-3">
                                                                        <div id="logo" class="logo">

                                                                        </div><!-- /#logo -->
                                                                    </div><!-- /.col-md-3 -->
                                                                    <div class="col-md-6">
                                                                        <div class="top-search">

                                                                        </div><!-- /.top-search -->
                                                                    </div><!-- /.col-md-6 -->
                                                                    <div class="col-md-3">
                                                                        <div class="box-cart">
                                                                            <div class="inner-box">
                                                                                <ul class="menu-compare-wishlist">
                                                                                </ul><!-- /.menu-compare-wishlist -->
                                                                            </div><!-- /.inner-box -->
                                                                            <div class="inner-box">

                                                                            </div><!-- /.inner-box -->
                                                                        </div><!-- /.box-cart -->
                                                                    </div><!-- /.col-md-3 -->
                                                                </div><!-- /.row -->
                                                            </div><!-- /.container -->
                                                        </div><!-- /.header-middle -->

<!--                                                        <div class="header-bottom">
                                                            <div class="container">

                                                                <div class="row">

                                                                    <div class="col-md-12 col-10">
                                                                        <div class="nav-wrap">
                                                                            <div id="mainnav" class="mainnav">
                                                                            </div> /.mainnav 
                                                                        </div> /.nav-wrap 
                                                                        <div style="padding-right: 50px" class="today-deal">
                                                                            <a href="#" title="">About</a>
                                                                        </div> /.today-deal 
                                                                        <div class="btn-menu">
                                                                            <span></span>
                                                                        </div> //mobile menu button 
                                                                    </div> /.col-md-9 
                                                                </div> /.row 
                                                            </div> /.container 
                                                        </div> /.header-bottom -->
                                                    </section><!-- /#header -->
                                                    <!--ChangePassword Form-->
                                                    <div class="modal modal_all" id="password_modal">
                                                        <div class="Form-changepassword">
                                                            <!--thay doi style-->
                                                            <div class="modal-header modal_headerr" > 
                                                                <h3 >Change Password <span class="extra-title muted"></span></h3>
                                                                <button id="close-changePassword" class="btn " data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            </div>
                                                            <form action="changepassword" method="post">
                                                                <div class="modal-body form-horizontal">
                                                                    <p id="Error_changepassword" class="error_changepassword"></p>
                                                                    <div class="control-group">
                                                                        <label for="current_password" class="control-label">Current Password</label>   
                                                                        <div class="controls">
                                                                            <input type="password" required    name="current_password" class="box_password box1" id="box1" placeholder="Input your current password">                    
                                                                                <input type="checkbox" class="showPassword"    id="showPassword1"/>
                                                                                <label  class="showPass"  >   Show</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="control-group">
                                                                        <label for="new_password" class="control-label" >New Password</label>   
                                                                        <div class="controls">
                                                                            <input type="password" required  name="new_password" class="box_password new_password" id="box2" placeholder="Must be at least 6 characters and at most 14 characters">
                                                                                <input type="checkbox" class="showPassword"  id="showPassword2"/>
                                                                                <label class="showPass"  >   Show</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="control-group">
                                                                        <label for="confirm_password" class="control-label">Confirm Password</label>                   
                                                                        <div class="controls">
                                                                            <input type="password" required  name="confirm_password" class="box_password" id="box3" placeholder="Confirm password">
                                                                                <input type="checkbox" class="showPassword" id="showPassword3"/>
                                                                                <label class="showPass"  >   Show</label>
                                                                        </div>
                                                                    </div>
                                                                    <c:if test="${not empty sessionScope.errCurrentPassword}">
                                                                        <h5 style="color: red">${sessionScope.errCurrentPassword}</h5>
                                                                    </c:if>
                                                                    <c:if test="${not empty sessionScope.errNewPasswordLength}">
                                                                        <h5 style="color: red">${sessionScope.errNewPasswordLength}</h5>
                                                                    </c:if>
                                                                    <c:if test="${not empty sessionScope.errConfirmPass}">
                                                                        <h5 style="color: red">${sessionScope.errConfirmPass}</h5>
                                                                    </c:if>
                                                                    <c:if test="${not empty sessionScope.mess}">
                                                                        <h5 style="color: red">${sessionScope.mess}</h5>
                                                                    </c:if>


                                                                </div>
                                                                <div class="modal-footer">               
                                                                    <button class="btn btn-primary" id="password_modal_save">Save changes</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div> 
                                                    <!--    Ket thuc ChangePassword Form-->
                                                    <!--User profile Form-->
                                                    <div class="modal" id="user-profile">
                                                        <div class="Form-userprofile">
                                                            <h3>User Profile</h3>         
                                                            <!-- Handle errors -->
                                                            <c:if test="${not empty sessionScope.errName}">
                                                                <h3 style="color: red">${sessionScope.errName}</h3>
                                                                <script>
                                                                    var modal = document.getElementById("user-profile");
                                                                    modal.style.display = 'block';
                                                                </script>
                                                            </c:if>
                                                            <c:if test="${not empty sessionScope.errPhone}">
                                                                <h3 style="color: red">${sessionScope.errPhone}</h3>
                                                                <script>
                                                                    var modal = document.getElementById("user-profile");
                                                                    modal.style.display = 'block';
                                                                </script>
                                                            </c:if>
                                                            <c:if test="${not empty sessionScope.errAddress}">
                                                                <h3 style="color: red">${sessionScope.errAddress}</h3>
                                                                <script>
                                                                    var modal = document.getElementById("user-profile");
                                                                    modal.style.display = 'block';
                                                                </script>
                                                            </c:if>
                                                            <c:if test="${not empty sessionScope.errDob}">
                                                                <h3 style="color: red">${sessionScope.errDob}</h3>
                                                                <script>
                                                                    var modal = document.getElementById("user-profile");
                                                                    modal.style.display = 'block';
                                                                </script>
                                                            </c:if>     
                                                            <c:if test="${not empty sessionScope.Sucess}">
                                                                <h3 style="color: green">${sessionScope.Sucess}</h3>
                                                                <script>
                                                                    var modal = document.getElementById("user-profile");
                                                                    modal.style.display = 'block';
                                                                </script>
                                                                <% session.removeAttribute("Sucess"); %>
                                                            </c:if>           
                                                            <button  id="close-profile" class="btn Close-Profile" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            <div class="row">

                                                                <form action="userProfile" method="post" class="form_UserProfile" onsubmit="return confirmUpdateProfile();" enctype="multipart/form-data" >
                                                                    <c:set var="o" value="${userProfileForAdmin}"/>
                                                                    <div class="col-md-4 avatar_cover " >

                                                                        <img  class="rounded-circle mb-3" style="width: 150px; height: 150px; object-fit: cover;"  src="${not empty o.image ? o.image : 'images/users/Default_avatar_profile.jpg' }" alt="Avatar"/>
                                                                        <input type="file"  name="imageProfile" accept="image/jpeg ">
                                                                    </div>
                                                                    <div class="col-md-8">

                                                                        <div class="form-group">
                                                                            <label for="email">Full Name:</label>
                                                                            <input required type="text"  class="form-control" id="email" name="fullName" value="${o.fullName}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="email">Email:</label>
                                                                            <input required type="email" class="form-control" id="email" name="email" value="${o.email}" readonly>
                                                                                <p>(You cannot change your email )</p>
                                                                        </div>                    
                                                                        <div class="form-group">
                                                                            <label for="pwd">Phone:</label>
                                                                            <input  type="text" class="form-control" id="pwd" name="Phone" value="${o.phoneNumber}">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="pwd">Gender:</label>
                                                                            <label for="male">Male</label>
                                                                            <input type="radio" name="gender" id="male" value="male"  ${o.gender == 1 ? "checked" : ""} >  
                                                                                <label>       </label>                   
                                                                                <label for="female">Female</label>
                                                                                <input type="radio" name="gender" id="female" value="female"  ${o.gender == 0 ? "checked" : ""}>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label for="pwd">Address:</label>
                                                                                        <input  type="text" class="form-control" id="pwd" name="address" value="${o.address}">
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label for="pwd">Date of birth:</label>
                                                                                        <input  type="date" class="form-control" id="pwd" name="dateofbirth" value="${o.dateOfBirth}">
                                                                                    </div>
                                                                                    <button type="submit" class="btn btn-default submitprofile">Submit</button>
                                                                                    </div>
                                                                                    </form>                                          
                                                                                    </div>

                                                                                    </div>
                                                                                    </div>
                                                                                    <!--Ket thuc user profile Form-->
                                                                                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                                                                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

                                                                                    <script>
                                                                    $(document).ready(function () {
                                                                        var successMessage = "${requestScope.successMessage}";
                                                                        if (successMessage) {
                                                                            window.alert(successMessage);
                                                                        }

                                                                        function showModal(modalId) {
                                                                            $(modalId).modal('show');
                                                                        }

                                                                        var errorMessage = "${sessionScope.errorMessage}";
                                                                        var errorMessage1 = "${sessionScope.errorMessage1}";
                                                                        var errorMessage2 = "${sessionScope.errorMessage2}";
                                                                        var errCurrentPassword = "${sessionScope.errCurrentPassword}";
                                                                        var errNewPasswordLength = "${sessionScope.errNewPasswordLength}";
                                                                        var errConfirmPass = "${sessionScope.errConfirmPass}";
                                                                        var mess = "${sessionScope.mess}";
                                                                        var errName = "${sessionScope.errName}";
                                                                        var errPhone = "${sessionScope.errPhone}";
                                                                        var errDob = "${sessionScope.errDob}";
                                                                        var errAddress = "${sessionScope.errAddress}";

                                                                        if (errorMessage) {
                                                                            showModal('#registerModal');
                                                                                        <% session.removeAttribute("errorMessage"); %>
                                                                        }
                                                                        if (errorMessage1) {
                                                                            showModal('#loginModal');
                                                                                        <% session.removeAttribute("errorMessage1"); %>
                                                                        }
                                                                        if (errorMessage2) {
                                                                            showModal('#resetModal');
                                                                                        <% session.removeAttribute("errorMessage2"); %>
                                                                        }
                                                                        if (errCurrentPassword || errNewPasswordLength || errConfirmPass || mess) {
                                                                            showModal('#password_modal');
                                                                                        <% session.removeAttribute("errCurrentPassword"); %>
                                                                                        <% session.removeAttribute("errNewPasswordLength"); %>
                                                                                        <% session.removeAttribute("errConfirmPass"); %>
                                                                                        <% session.removeAttribute("mess"); %>
                                                                        }
                                                                        if (errName || errPhone || errDob || errAddress) {
                                                                            showModal('#user-profile');
                                                                                        <% session.removeAttribute("errName"); %>
                                                                                        <% session.removeAttribute("errPhone"); %>
                                                                                        <% session.removeAttribute("errDob"); %>
                                                                                        <% session.removeAttribute("errAddress"); %>
                                                                        }
                                                                    });

                                                                    function hiddenRegister() {
                                                                        $('#loginModal').modal('hide');
                                                                        $('#registerModal').modal('show');
                                                                    }

                                                                    function showSignIn() {
                                                                        $('#registerModal').modal('hide');
                                                                        $('#loginModal').modal('show');
                                                                    }

                                                                    function showSignInFromResetPopup() {
                                                                        $('#resetModal').modal('hide');
                                                                        $('#loginModal').modal('show');
                                                                    }

                                                                    function showForgot() {
                                                                        $('#loginModal').modal('hide');
                                                                        $('#resetModal').modal('show');
                                                                    }

                                                                    function showSignInFromRegisterPopup() {
                                                                        $('#registerModal').modal('hide');
                                                                        $('#loginModal').modal('show');
                                                                    }

                                                                    $('#resetModal').on('hidden.bs.modal', function () {
                                                                        $('#loginModal').off('shown.bs.modal');
                                                                    });

                                                                    $('#loginModal').on('hidden.bs.modal', function () {
                                                                        $('#resetModal').off('shown.bs.modal');
                                                                    });

                                                                    function confirmUpdateProfile() {
                                                                        return confirm("Bạn có chắc chắn muốn cập nhật thông tin này không?");
                                                                    }
                                                                                    </script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.min.js"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/tether.min.js"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/bootstrap.min.js"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/waypoints.min.js"></script>
                                                                                    <!-- <script type="text/javascript" src="javascript/jquery.circlechart.js"></script> -->
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/easing.js"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.zoom.min.js"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.flexslider-min.js"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/owl.carousel.js"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/smoothscroll.js"></script>
                                                                                    <!-- <script type="text/javascript" src="javascript/jquery-ui.js"></script> -->
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.mCustomScrollbar.js"></script>
                                                                                    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBtRmXKclfDp20TvfQnpgXSDPjut14x5wk&amp;region=GB"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/gmap3.min.js"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/waves.min.js"></script> 
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery.countdown.js"></script>
                                                                                    <script src="https://kit.fontawesome.com/cbc13c02eb.js" crossorigin="anonymous"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/main.js"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/js-product-detail.js"></script>
                                                                                    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/slider.js"></script>
                                                                                    <script src="${pageContext.request.contextPath}/javascript/changepasswordvsUserprofile.js"></script>
                                                                                    </body>	

                                                                                    </html>












