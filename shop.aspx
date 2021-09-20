<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="shop.aspx.cs" Inherits="shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <!-- Breadcrumb Area -->
        <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="/images/Headers/hd_shop03.jpg"
            data-white-overlay="2">
            <div class="container">
                <div class="tm-breadcrumb">
                    <h2 style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Our Products</h2>
                    <ul>
                        <li><a style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);" href="/">Home</a></li>
                        <li style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Shop</l>
                    </ul>
                </div>
            </div>
        </div>
        <!--// Breadcrumb Area -->


        <!-- Page Content -->
        <main class="page-content">

            <!-- Products Area -->
            <div class="tm-products-area tm-section tm-padding-section bg-white">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="tm-shop-header">
                                <p class="tm-shop-countview"></p>
                                <select onchange="sort_products(this.value);">
                                    <option value="0">Default Sorting</option>
                                    <option value="1">Name A-Z</option>
                                    <option value="2">Name Z-A</option>
                                    <option id="high" value="3">Price (Highest To Lowest)</option>
                                    <option id="low" value="4">Price (Lowest To Highest)</option>
                                </select>
                            </div>

                            <div class="row mt-30-reverse" id="products_div" runat="server">
                                
                                <asp:Panel ID="products_panel" runat="server" style="width:100%;"></asp:Panel>

                            </div>

                        </div>
                        <div class="col-lg-3">
                            <div class="widgets widgets-shop">

                                <!-- Single Widget -->
                                <div class="single-widget widget-categories">
                                    <h6 class="widget-title">Categories</h6>
                                    <ul>
                                        <asp:Panel ID="category_panel" runat="server"></asp:Panel>
                                    </ul>
                                </div>
                                <!--// Single Widget -->

                                <!-- Single Widget -->
                                <div class="single-widget widget-popularproduct">
                                    <h6 class="widget-title">Popular Product</h6>
                                    <ul>
                                        <asp:Panel ID="popularProducts_panel" runat="server"></asp:Panel>
                                    </ul>
                                </div>
                                <!--// Single Widget -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--// Products Area -->

       

        </main>
        <!--// Page Content -->


    <script>


        window.onload = () => {

            let high = document.querySelector('#high');
            let low = document.querySelector('#low');

            if (document.querySelector('.tm-product-price')) {
                high.style.display = 'block';
                low.style.display = 'block';
            } else {
                high.style.display = 'none';
                low.style.display = 'none';
            }
        }

        function sort_products(value) {

            var row = document.getElementById('<%=products_panel.ClientID%>');
            var position = 'afterBegin';
            var html = '';
            var type = '<%=Type_%>';

            console.log(value);
            var data_ = { "sort": value, "type": '<%=Type_%>' };

            row.innerHTML = "";

            $.ajax({
                method: 'POST',
                url: '/shop.aspx/sortProducts',
                contentType: 'application/json',
                data: JSON.stringify(data_),
                headers: {
                    'Accept': 'application/json, text/plain, *',
                    'Content-type': 'application/json',
                    'dataType': 'json'
                },
                success: function (data) {
                    var myData = data.d;
                    console.log(myData);
                    myData.forEach(function (value, key) {


                        if (type) {
                            html += `<div class='col-lg-4 col-md-4 col-sm-6 col-12 mt-30' style='display:inline-flex;'>
                            <div class='tm-product text-center tm-scrollanim' style='opacity:1'>
                                <div class='tm-product-topside'>`;
                                if (value.isMouthPiece) {
                                    html += `<img src='/images/Mouthpieces/${value.Image}' alt='product image'>`;
                                } else {
                                    html += `<img src='/images/products/${value.Image}' alt='product image'>`;
                                }
                                html += `<ul class='tm-product-actions'>
                                         <li><a href='/details/${value.Name}/${value.No_}'><i class='ion-android-search' style='margin: 0 5px;'></i>Customize</a></li>
                                      </ul>
                                        </div>
                                         <div class='tm-product-bottomside'>
                                         <h6 class='tm-product-title'><a href='/details/${value.Name}/${value.No_}'>${value.Name}</a></h6>
                                         <span class='tm-product-price'>$${value.Price}</span>
                                         </div>
                                    </div>
                                 </div>`;
                        } else {

                            html += `<div class='col-lg-4 col-md-4 col-sm-6 col-12 mt-30' style='display:inline-flex;'>
                            <div class='tm-product text-center tm-scrollanim' style='opacity:1'>
                                <div class='tm-product-topside'>
                                    <img src='/images/products/${value.Image}' alt='product image'>`;

                            var link = value.ProductCount > 1 ? `/shop/${value.Name}` : `/details/${value.Name}/${value.No_}`;

                            var inImage = (value.DetailPage == 'True') ?
                                `<ul class='tm-product-actions'>
                                     <li><a href='/shop/page/${value.Name}'><i class='ion-android-search' style='margin: 0 5px;'></i>Read More</a></li>
                                     <li><a href='${link}' style='padding: 0 10px;'><i class='ion-android-cart' style='margin: 0 5px;'></i>Shop</a></li>
                                  </ul>`
                                : `<ul class='tm-product-actions'>
                                     <li><a href='${link}'><i class='ion-android-search' style='margin: 0 5px;'></i>Shop</a></li>
                                  </ul>`;

                            html += `${inImage}
                                    </div>
                                     <div class='tm-product-bottomside'>
                                     <h6 class='tm-product-title'><a href='${link}'>${value.Name}</a></h6>
                                     </div>
                                </div>
                             </div>`;
                        }
                    });

                    row.insertAdjacentHTML(position, html);

                },
                error: function (error) { console.log("FAIL....================="); console.log(error); }
            });            
        }

    </script>

</asp:Content>