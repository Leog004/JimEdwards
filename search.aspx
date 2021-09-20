<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

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
                    <h2 style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Search</h2>
                    <ul>
                        <li><a style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);" href="/">Home</a></li>
                        <li style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Search</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--// Breadcrumb Area -->


            <main class="page-content">

            <%--<div id="google-map" class="google-map"></div>--%>

            <!-- Contact Area -->
            <div class="tm-contact-area tm-section tm-padding-section bg-white">
                <div class="container">
                    <div class="row justify-content-md-center">
                        <div class="col-lg-8" >

                                <div id="tm-contactform"
                                    class="tm-contact-forminner tm-form">
                                    <div class="tm-form-inner">
                                        <div class="tm-form-field tm-form-field">
                                            <label><span style="font-weight:600;">*Items Found: </span> <%=itemsFound %></label> <br />
                                            <label for="search-form-name">Product Name</label>
                                            <input type="text" value="<%=ProductSearched %>" id="search-form-name" placeholder="Product Name" name="name" required>
                                        </div>
                                        </div>
                                    </div>
                        </div>
                        <div class="col-lg-12 tm-section tm-padding-section bg-white">
                            <asp:Panel id="search_panel" runat="server"></asp:Panel>
                        </div>
                    </div>
                </div>
            </div>

            </main>



    <script>

    if (searchTextBox) {
        document.getElementById("search-form-name").addEventListener("keyup", event => {

            var list = document.getElementById('<%=search_panel.ClientID %>');


            if (event.isComposing || event.keyCode === 229) {
                return;
            }

            var searching = event.target.value;

            if (searching)
                runSearch(searching);
            else
                list.innerHTML = "";

        });
    }
    function runSearch(searching) {

        var list = document.getElementById('<%=search_panel.ClientID %>');
        const position = "beforeend";
        
        $.ajax({
            method: 'POST',
            url: '../search.aspx/searchProduct',
            contentType: 'application/json',
            data: '{searching:"' + searching + '"}',
            headers: {
                'Accept': 'application/json, text/plain, */*',
                'Content-type': 'application/json'
            },
            success: function (data) {  
                console.log(data);
                var data = JSON.parse(data.d);
                console.log(data);
                //var data = data.d;
                list.innerHTML = "";
                data.forEach(function (item, key) {
                    if (item.Name) {
                        const show_item = `<a href='/details/${item.Name.trim()}/${item.No_.trim()}'><li class="list-group-item d-flex justify-content-between align-items-center">
                                        ${item.Name} <img src='/images/products/${item.Image}' style='width:200px; margin-left:20px;'>
                                        <span class="badge badge-primary badge-pill">Price: $${item.Price}</span>
                                      </li></a>`
                        list.insertAdjacentHTML(position, show_item);
                    }
                });
            },
            error: function (error) { console.log(error); }
        });
    }


    </script>

</asp:Content>