<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/MasterPage.master" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


        <!-- Breadcrumb Area -->
        <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="/images/Headers/hd_login02.jpg"
            data-white-overlay="2">
            <div class="container">
                <div class="tm-breadcrumb">
                    <h2 style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Contact Us</h2>
                    <ul>
                        <li><a style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);" href="/">Home</a></li>
                        <li style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Contact</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--// Breadcrumb Area -->


            <!-- Page Content -->
        <main class="page-content">

            <%--<div id="google-map" class="google-map"></div>--%>

            <!-- Contact Area -->
            <div class="tm-contact-area tm-section tm-padding-section bg-white">
                <div class="container">
                    <div class="row justify-content-md-center">
                        <div class="col-lg-8" >
                            <div class="tm-contact">
                                <h2>Send us a message</h2>
                                <div id="tm-contactform"
                                    class="tm-contact-forminner tm-form">
                                    <div class="tm-form-inner">
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="contact-form-name">Name</label>
                                            <input type="text" id="contact-form-name" placeholder="Your name here"
                                                name="name" required>
                                        </div>
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="contact-form-email">Email</label>
                                            <input type="email" id="contact-form-email"
                                                placeholder="Your Email here" name="email" required>
                                        </div>
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="contact-form-phone">Phone</label>
                                            <input type="text" id="contact-form-phone"
                                                placeholder="Your phone number here" name="phone" required>
                                        </div>
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="contact-form-subject">Subject</label>
                                            <input type="text" id="contact-form-subject" placeholder="Your Subject"
                                                name="subject">
                                        </div>
                                        <div class="tm-form-field">
                                            <label for="contact-form-message">Message</label>
                                            <textarea cols="30" rows="5" id="contact-form-message"
                                                placeholder="Write your message" name="message"></textarea>
                                        </div>
                                        <div class="tm-form-field">
                                            <button onclick="sendEmail()" type="button" class="tm-button tm-button-block">Send
                                                Message</button>
                                        </div>
                                    </div>
                                </div>
                                <p class="form-messages"></p>
                            </div>
                        </div>
<%--                        <div class="col-lg-4">
                            <div class="tm-contact-blocks mt-30-reverse">
                                <div class="tm-contact-block text-center mt-30" style="padding: 30px 50px;">
                                    <i class="ion-ios-telephone-outline"></i>
                                    <h6>Contact Us</h6>
                                    <p>Phone: <a href="tel:+1877-654-2946">877-654-2946</a></p>
                                    <p>Email: <a href="mailto:customerservice@equibrand.com">customerservice@equibrand.com</a></p>
                                </div>

                                <div class="tm-contact-block text-center mt-30" style="padding: 30px 50px;">
                                    <i class="ion-ios-location-outline"></i>
                                    <h6>Our location</h6>
                                    <p>7415 Transcanadienne, Suite 100
                                        St. Laurent, Quebec, Canada
                                        H45T 1Z22</p>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
            <!--// Contact Area -->


        </main>
        <!--// Page Content -->



    <!-- Custom Javascropt -->

    <script>
        var success, isValidated, emailSent;

        async function sendEmail() {
            var name = document.getElementById('contact-form-name').value;
            var email = document.getElementById('contact-form-email').value;
            var phone = document.getElementById('contact-form-phone').value;
            var subject = document.getElementById('contact-form-subject').value;
            var message = document.getElementById('contact-form-message').value;


            success = await checkIfFilled_contact(name, email, message);
            isValidated = await checkEmailValidation(email);
            emailSent = await sendEmailToUser(name, email, phone, subject, message);

            if (!success)
                return displayMessage('error', 'Please Fill Required Information');

            if (!isValidated)
                return displayMessage('error', 'Please Re-Enter Your Email');

            if (!emailSent)
                return displayMessage('error', 'Something went wrong, please try again!');


            return displayMessage_contact('success', 'We have recieved your email. Thank You!');
        }


        function displayMessage_contact(type, message) {

            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 8000,
                timerProgressBar: true,
                onOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })

            Toast.fire({
                type: type,
                title: message
            })

            if (type === 'success') {
                document.getElementById('contact-form-name').value = '';
                document.getElementById('contact-form-email').value = '';
                document.getElementById('contact-form-phone').value = '';
                document.getElementById('contact-form-subject').value = '';
                document.getElementById('contact-form-message').value = '';
            }

        }


        function checkIfFilled_contact(name, email, message) {

            var name_style = document.getElementById('contact-form-name');
            var email_style = document.getElementById('contact-form-email');
            var message_style = document.getElementById('contact-form-message');

            name_style.style.border = '1px solid #d2d2d2';
            email_style.style.border = '1px solid #d2d2d2';
            message_style.style.border = '1px solid #d2d2d2';

            if (!name || !email || !message) {

                if (!name) name_style.style.border = '1px solid red';            

                if (!email) email_style.style.border = '1px solid red';  

                if (!message) message_style.style.border = '1px solid red';  

                return false;
            }

            return true;
        }


        function checkEmailValidation(email) {

            const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (!re.test(email)) {
                document.getElementById('contact-form-email').style.border = '1px solid red';
                return false;
            }

            return true;
        }

        async function sendEmailToUser(name, email, phone, subject, message) {

            var data_ = { "name": name, "email": email, "phone": phone, "subject": subject, "message": message };

            try {
                if (success && isValidated) {
                    var myBoolean = await $.ajax({
                        method: 'POST',
                        url: '/contact.aspx/sendEmail',
                        contentType: 'application/json',
                        data: JSON.stringify(data_),
                        headers: {
                            'Accept': 'application/json, text/plain, *',
                            'Content-type': 'application/json',
                            'dataType': 'json'
                        },
                        success: function (data) {
                            console.log(data.d);

                        },
                        error: function (error) { console.log(error); }
                    });
                }
            } catch (err) {
                return false;
            }

            return myBoolean;
        }


    </script>

    <!-- JS FILES HERE -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEDd_Sv9-p-I6bebrAMpmZBQvalqBE5Ds"></script>
    <script src="assets/js/mapjs/google-map.js"></script>


</asp:Content>