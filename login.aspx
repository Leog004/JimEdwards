<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <!-- Breadcrumb Area -->
        <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="/images/Headers/hd_login01.jpg"
            data-white-overlay="2">
            <div class="container">
                <div class="tm-breadcrumb">
                    <h2  style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Login / Register</h2>
                    <ul>
                        <li><a  style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);" href="/">Home</a></li>
                        <li  style="color:#ccc; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Login & Register</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--// Breadcrumb Area -->


        <!-- Page Content -->
        <main class="page-content">

            <!-- Login Register Area -->
            <div class="tm-section tm-login-register-area bg-white tm-padding-section">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-6">
                            <form class="tm-form tm-login-form">
                                <h4>Login</h4>
                                <div class="tm-form-inner">
                                    <div class="tm-form-field">
                                        <label for="login-email">Username or email address*</label>
                                        <input type="email" id="login-email" required="required"
                                            placeholder="Enter your email/username here...">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="login-password">Password*</label>
                                        <input type="password" id="login-password" required="required"
                                            placeholder="Enter your password here...">
                                    </div>
                                    <div class="tm-form-field">
                                        <input type="checkbox" name="login-remember" id="login-remember">
                                        <label for="login-remember">Remember Me</label>
                                    </div>
                                    <div class="tm-form-field">
                                        <button onclick="validate();" type="button" id="submit_login" class="tm-button">Login</button>
                                    </div>
                                    <div class="tm-form-field">
                                        <a href="javascript:forgotPassword();">Forgot your password?</a>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="col-lg-6">
                            <form class="tm-form tm-register-form" onSubmit="return false;">
                                <h4>Create an account</h4>
                                <div class="tm-form-inner">
                                    <div class="tm-form-field">
                                        <label for="register-first-name">First Name</label>
                                        <input autocomplete="off" type="text" id="register-first-name" required="required"
                                            placeholder="Enter your first name here...">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="register-last-name">Last Name</label>
                                        <input autocomplete="off" type="text" id="register-last-name" required="required"
                                            placeholder="Enter your last name here...">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="register-email">Email address</label>
                                        <input type="email" id="register-email" required="required"
                                            placeholder="Enter your email here...">
                                    </div>
                                    <div class="tm-form-field">
                                        <label for="register-password">Password</label>
                                        <input type="password" id="register-password" name="register-pass"
                                            required="required" placeholder="Enter your password here...">
                                    </div>
                                    <div class="tm-form-field">
                                        <div>
                                            <input type="checkbox" id="register-pass-show" name="register-pass-show">
                                            <label for="register-pass-show">Show Password</label>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="register-notifications" name="register-terms">
                                            <label for="register-terms">Recieve Notifications</label>
                                        </div>
                                    </div>
                                    <div class="tm-form-field">
                                        <button type="button" onclick="newUser();" class="tm-button">Register</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!--// Login Register Area -->


        </main>
        <!--// Page Content -->



    <script type="text/javascript">




        function getLogin(email, password) {

            var data_ = { "email": email, "password": password };
            var status = "error", message = "Please Try Again";

            console.log(data_);

            $.ajax({
                method: 'POST',
                url: '/login.aspx/getUserLogin',
                contentType: 'application/json',
                data:  JSON.stringify(data_),              
                headers: {
                    'Accept': 'application/json, text/plain, *',
                    'Content-type': 'application/json',
                    'dataType': 'json'
                },

                success: function (data) {
                    var data = data.d;
                    console.log(data);
                    //editData(data);

                    if (data) {
                        status = "success";
                        message = "Sign In Successful";
                        setTimeout(function () { window.location.replace("/account.aspx"); }, 3000);
                    }

                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 5000,
                        timerProgressBar: true,
                        onOpen: (toast) => {
                            toast.addEventListener('mouseenter', Swal.stopTimer)
                            toast.addEventListener('mouseleave', Swal.resumeTimer)
                        }
                    })



                    Toast.fire({
                        type: status,
                        title: message
                    })


                    
                },
                error: function (error) { console.log("FAIL....================="); console.log(error); }
            });
        }


        function validateEmail(email) {
          
          const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
          return re.test(email);
        }


        function checkIfFilled_login(email, password) {

            if (!email) return false;

            if (!password) return false;

            return true;

        }

        function validate() {
                   
            const email = document.getElementById("login-email").value;
            const password = document.getElementById("login-password").value;
            
            if (checkIfFilled_login(email, password)){

                if (validateEmail(email)) {
                    getLogin(email, password);
                } else {
                    alert("email is not valid");
                }
                return false;
            } else {
                alert("Password OR Email is not filled");
            }

            return false

        }


        

        function newUser() {

            const firstName = document.getElementById("register-first-name").value;
            const lastName = document.getElementById("register-last-name").value;
            const email = document.getElementById("register-email").value;
            const password = document.getElementById("register-password").value;
            const notification = document.getElementById("register-notifications").checked;

            if (checkIfFilled_login(email, password)){

                if (validateEmail(email)) {
                    addNewUser(firstName, lastName, email, password, notification);
                } else {
                    alert("email is not valid");
                }
                return false;
            } else {
                alert("Password OR Email is not filled");
            }


        }



        function addNewUser(firstName, lastName, email, password, notification) {

            var data_ = { "firstName": firstName, "lastName": lastName, "email": email, "password": password, "notification": notification };
             var status = "error", message = "New User Regristration Failed! Please Try Again";

            console.log(data_);

            $.ajax({
                method: 'POST',
                url: '/login.aspx/AddNewUser',
                contentType: 'application/json',
                data:  JSON.stringify(data_),              
                headers: {
                    'Accept': 'application/json, text/plain, *',
                    'Content-type': 'application/json',
                    'dataType': 'json'
                },
                success: function (data) {
                    var data = data.d;


                    if (data) {
                        status = "success";
                        message = "Sign In Successful";
                        setTimeout(function(){ location.reload() }, 3000);
                    }

                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 5000,
                        timerProgressBar: true,
                        onOpen: (toast) => {
                            toast.addEventListener('mouseenter', Swal.stopTimer)
                            toast.addEventListener('mouseleave', Swal.resumeTimer)
                        }
                    })



                    Toast.fire({
                        type: status,
                        title: message
                    })


                },
                error: function (error) { console.log("FAIL....================="); console.log(error); }
            });
        }




        function forgotPassword() {


            Swal.mixin({
              input: 'text',
              confirmButtonText: 'Next &rarr;',
              showCancelButton: true,
              progressSteps: ['1', '2']
            }).queue([
              {
                title: 'Forgot Password?',
                text: 'Please enter your name',
                input: 'text',
                inputPlaceholder: 'Enter your full name',
                inputValidator: (value) => {
                if (!value) {
                      return 'You need to enter your full name!'
                    }
                }

              },
              {
                title: 'Forgot Password?',
                text: 'Please enter your email address',
                input: 'text',
                inputPlaceholder: 'Enter your email address',
                inputValidator: (value) => {
                if (!value) {
                      return 'You need to enter your email address!'
                    }
                }
              }
            ]).then((result) => {
              if (result.value) {
                 
                  Swal.fire({
                      title: 'New Password has been sent!',
                      html: `If no email appear, please check your spam before trying again.`,
                      confirmButtonText: 'Thank You!'
                  });

                  sendEmailPassword(result.value[0], result.value[1]);
              }
            })


        }


        function sendEmailPassword(name, email) {

            var status = "error", message = "Password Reset Failed! Please Try Again";
            var data_ = { "name": name, "email" : email};


            $.ajax({
                method: 'POST',
                url: '/login.aspx/resendPassword',
                contentType: 'application/json',
                data:  JSON.stringify(data_),              
                headers: {
                    'Accept': 'application/json, text/plain, *',
                    'Content-type': 'application/json',
                    'dataType': 'json'
                },
                success: function (data) {
                    var data = data.d;


                    if (data) {
                        status = "success";
                        message = "Password Has Been Sent!";
                        setTimeout(function(){ location.reload() }, 3000);
                    }

                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 5000,
                        timerProgressBar: true,
                        onOpen: (toast) => {
                            toast.addEventListener('mouseenter', Swal.stopTimer)
                            toast.addEventListener('mouseleave', Swal.resumeTimer)
                        }
                    })



                    Toast.fire({
                        type: status,
                        title: message
                    })


                },
                error: function (error) { console.log("FAIL....================="); console.log(error); }
            });




        }


    </script>

</asp:Content>


