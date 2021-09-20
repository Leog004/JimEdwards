<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="shop_details.aspx.cs" Inherits="shop_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <!-- Breadcrumb Area -->
    <asp:Panel ID="header_panel" runat="server"></asp:Panel>
    <!--// Breadcrumb Area -->


            <!-- Page Content -->
        <main class="page-content">

            <!-- Service Details Area -->
            <div class="tm-section tm-service-details-area tm-padding-section bg-white">
                <div class="container">
                    <div class="row justify-content-md-center">
                        <div class="col-lg-8">

                            <asp:Panel ID="content_panel" runat="server"></asp:Panel>

                                <!-- Single Widget -->
                                <div class="single-widget widget-social">
                                    <%--<h6 class="widget-title">Share on Social</h6>--%>
                                    <ul>
                                        <li class="facebook"><a href="https://www.facebook.com/JimEdwardsBits/" target="_blank"><i class="ion-social-facebook"></i></a></li>
                                        <li class="youtube"><a href="https://www.youtube.com/channel/UCBQNfwPM3hJzlBm5ZdMWXhg" target="_blank"><i class="ion-social-youtube"></i></a></li>
                                    </ul>
                                </div>
                                <!--// Single Widget -->
                        </div>
                    </div>
                </div>
            </div>
            <!--// Service Details Area -->
            <div class="tm-products-area tm-section tm-padding-section-bottom bg-white">
              <div class="container">
                 <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <h3 class="text-xl-center">View Products</h3>
                        <div class="row mt-30-reverse" id="products_div" runat="server">
                            <asp:Panel ID="products_panel" runat="server" style="width:100%;"></asp:Panel>
                        </div>
                        </div>
                     </div>
                  </div>
                </div>

        </main>
        <!--// Page Content -->
    
</asp:Content>