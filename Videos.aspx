<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Videos.aspx.cs" Inherits="Videos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="/assets/css/invoice.css">


    <style>

        .mt-50 {
    margin-top: 50px;
    min-height: 300px;
}

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


            <!-- Breadcrumb Area -->
        <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="/images/Headers/hd_login02.jpg"
            data-white-overlay="2">
            <div class="container">
                <div class="tm-breadcrumb">
                    <h2 style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Jim Says</h2>
                    <ul>
                        <li><a style="color:#eee;" href="/">Home</a></li>
                        <li style="color:#ccc;">Jim Says</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--// Breadcrumb Area -->



           <!-- Page Content -->
        <main class="page-content">


                <div class="tm-section tm-blog-area tm-padding-section bg-white">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                                <div class='tm-sectiontitle text-center'>
                                    <h2>Latest Videos</h2>
                                    <img src='/Images/newImages/TitleIllustration.jpg' alt='section divider' style='width:100px; margin: 10px 0;'>
                                </div>
                            <div class="row mt-50-reverse">
                                <!-- Blog Single Item -->
                                <asp:Panel ID="video_panel" runat="server"></asp:Panel>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                          
        
        </main>
        <!--// Page Content -->



</asp:Content>