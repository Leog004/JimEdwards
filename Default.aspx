<%@ Page Title="" Language="C#" MasterPageFile="/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/_Controls/_Product_List.ascx" TagPrefix="uc1" TagName="_Product_List" %>
<%@ Register Src="~/_Controls/_JimEdwards_Videos.ascx" TagPrefix="uc1" TagName="_JimEdwards_Videos" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <style>
        .tm-feature {
            -webkit-box-shadow: 0 2px 10px rgba(34, 34, 34, 0.15);
            box-shadow: 0 2px 10px rgba(34, 34, 34, 0.15);
            padding: 50px 15px 30px 15px;
            background: #ffffff;
        }

        @media only screen and (max-width: 1200px) {

                .tm-heroslider{
                    background-size:cover;
                    min-height:0 !important;
                }

                .tm-heroslider-pagination {
                    bottom: 15px;
                    height:39px
                }
                .tm-heroslider-pagination .slides-numbers {
                    position: absolute;
                    left: 50%;
                    top: 50%;
                    -webkit-transform: translate(-50%, -50%);
                    -ms-transform: translate(-50%, -50%);
                    transform: translate(-50%, -50%);
                    letter-spacing: 1px;
                    font-size: 8px;
                }
            }


        /* If the screen size is 600px or less, set the font-size of <div> to 30px */
            @media only screen and (max-width: 600px) {

                .tm-heroslider{
                    background-size:cover;
                    min-height:0 !important;
                }

                .tm-heroslider-pagination {
                    bottom: 15px;
                    height:39px
                }
                .tm-heroslider-pagination .slides-numbers {
                    position: absolute;
                    left: 50%;
                    top: 50%;
                    -webkit-transform: translate(-50%, -50%);
                    -ms-transform: translate(-50%, -50%);
                    transform: translate(-50%, -50%);
                    letter-spacing: 1px;
                    font-size: 8px;
                }
            }

        /* If the screen size is 600px or less, set the font-size of <div> to 30px */
            @media only screen and (max-width: 500px) {

                .tm-heroslider{
                    background-size:contain;
                    min-height:0 !important;
                }

                .tm-heroslider-pagination {
                    bottom: 15px;
                    height:39px
                }
                .tm-heroslider-pagination .slides-numbers {
                    position: absolute;
                    left: 50%;
                    top: 50%;
                    -webkit-transform: translate(-50%, -50%);
                    -ms-transform: translate(-50%, -50%);
                    transform: translate(-50%, -50%);
                    letter-spacing: 1px;
                    font-size: 8px;
                }
            }


    </style>

            <!-- Heroslider Area -->
            <asp:Panel ID="heroSlider" runat="server"></asp:Panel>
        <!--// Heroslider Area -->

        <!-- Page Content -->
        <main class="page-content">

            <!-- Service Area -->
            <asp:Panel ID="service_panel" runat="server"></asp:Panel>
            <!--// Service Area -->



            <!-- About Area -->
            <asp:Panel ID="about_panel" runat="server"></asp:Panel>
            <!--// About Area -->



            <!-- Features Area -->
            <asp:Panel ID="features_panel" runat="server"></asp:Panel>
            <!--// Features Area -->

<%--
            <!-- Testimonial Area -->
            <div class="tm-section tm-testimonial-area  tm-padding-section bg-white bg-pattern-transparent">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 col-lg-8 col-md-9 col-12">
                            <div class="tm-sectiontitle text-center">
                                <h2>Feedback From Our Clients</h2>
                                 <img src="/Images/newImages/TitleIllustration.jpg" alt="section divider" style="width:100px; margin: 10px 0;">
                            <span class="tm-sectiontitle-divider">
                                    <img src="/Images/newImages/TitleIllustration.jpg" alt="section divider">
                                </span>
                               <p>Lorem Ipsum is a latin placeholder text commonly used to fulfill certain areas of
                                    your website or app where content is not the main concern of the developer.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row tm-testimonial-slider">

                        <!-- Single Testimonial -->
                        <div class="col-lg-6">
                            <div class="tm-testimonial tm-scrollanim">
                                <div class="tm-testimonial-top">
                                    <div class="tm-testimonial-author">
                                        <div class="tm-testimonial-image">
                                            <img src="./assets/images/author-image-1.png" alt="author image">
                                        </div>
                                        <div class="tm-testimonial-authorcontent">
                                            <h6>James M. Rogers</h6>
                                            <p>Happy customer</p>
                                        </div>
                                    </div>
                                    <div class="tm-testimonial-ratings">
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis nisl, at
                                    aliquam dolor. Morbi in iaculis nunc. Nulla eu mi at velit imperdiet sollicitudin
                                    sed vel risus. Quisque eleifend lorem ipsum.</p>
                            </div>
                        </div>
                        <!--// Single Testimonial -->

                        <!-- Single Testimonial -->
                        <div class="col-lg-6">
                            <div class="tm-testimonial tm-scrollanim">
                                <div class="tm-testimonial-top">
                                    <div class="tm-testimonial-author">
                                        <div class="tm-testimonial-image">
                                            <img src="./assets/images/author-image-2.png" alt="author image">
                                        </div>
                                        <div class="tm-testimonial-authorcontent">
                                            <h6>Richard McDonald</h6>
                                            <p>Happy customer</p>
                                        </div>
                                    </div>
                                    <div class="tm-testimonial-ratings">
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis nisl, at
                                    aliquam dolor. Morbi in iaculis nunc. Nulla eu mi at velit imperdiet sollicitudin
                                    sed vel risus. Quisque eleifend lorem ipsum.</p>
                            </div>
                        </div>
                        <!--// Single Testimonial -->

                        <!-- Single Testimonial -->
                        <div class="col-lg-6">
                            <div class="tm-testimonial">
                                <div class="tm-testimonial-top">
                                    <div class="tm-testimonial-author">
                                        <div class="tm-testimonial-image">
                                            <img src="./assets/images/author-image-1.png" alt="author image">
                                        </div>
                                        <div class="tm-testimonial-authorcontent">
                                            <h6>James M. Rogers</h6>
                                            <p>Happy customer</p>
                                        </div>
                                    </div>
                                    <div class="tm-testimonial-ratings">
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis nisl, at
                                    aliquam dolor. Morbi in iaculis nunc. Nulla eu mi at velit imperdiet sollicitudin
                                    sed vel risus. Quisque eleifend lorem ipsum.</p>
                            </div>
                        </div>
                        <!--// Single Testimonial -->

                        <!-- Single Testimonial -->
                        <div class="col-lg-6">
                            <div class="tm-testimonial">
                                <div class="tm-testimonial-top">
                                    <div class="tm-testimonial-author">
                                        <div class="tm-testimonial-image">
                                            <img src="./assets/images/author-image-2.png" alt="author image">
                                        </div>
                                        <div class="tm-testimonial-authorcontent">
                                            <h6>Richard McDonald</h6>
                                            <p>Happy customer</p>
                                        </div>
                                    </div>
                                    <div class="tm-testimonial-ratings">
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                        <span class="active"><i class="ion-android-star"></i></span>
                                    </div>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras a convallis nisl, at
                                    aliquam dolor. Morbi in iaculis nunc. Nulla eu mi at velit imperdiet sollicitudin
                                    sed vel risus. Quisque eleifend lorem ipsum.</p>
                            </div>
                        </div>
                        <!--// Single Testimonial -->

                    </div>
                </div>
            </div>
            <!--// Testimonial Area -->
    --%>


          <!-- Products -->
                <uc1:_Product_List runat="server" ID="_Product_List" />
          <!--// Products -->




            <!-- Videos -->
            <uc1:_JimEdwards_Videos runat="server" ID="_JimEdwards_Videos" />

            <!-- Brand Logos -->
            
            
           
        
            
            
            <!--// Brand Logos -->



        </main>
        <!--// Page Content -->

</asp:Content>

