<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="details" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>


    <style>
        .nice-select {
        
            margin: 10px 0 !important;
        }
    </style>

    
        <meta name="description" content="<%=metadescription_ %>"/>

        <meta property="og:description"        content="<%=metadescription_ %>" />

        <meta property="og:image:width"              content="600px" />
        <meta property="og:image:height"              content="600px" />
        <meta property="og:image"              content="<%=_MetaImage%>" />
        <meta property="og:image:secure_url"   content="<%=_MetaImage%>" /> 
        <meta property="og:image:type"         content="image/png" />

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <!-- Breadcrumb Area -->
        <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="/images/Headers/hd_about03.jpg"
            data-white-overlay="2">
            <div class="container">
                <div class="tm-breadcrumb">
                    <h2 style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Product Details</h2>
                    <ul>
                        <li><a style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);" href="/">Home</a></li>
                        <li><a style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);" href="/shop">Shop</a></li>
                        <li style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);"><%=Name%></li>
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
                    <div class="row justify-content-center">
                        <div class="col-xl-9 col-lg-12 col-12">
                            <!-- Product Details -->
                            <div class="tm-prodetails">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="tm-prodetails-images">
                                            <div class="tm-prodetails-largeimages">
                                                <div class="tm-prodetails-largeimage">
                                                    <a id="big_image_" data-fancybox="tm-prodetails-imagegallery"
                                                        href="<%=Image %>"
                                                        data-caption="Product Zoom Image 1">
                                                        <img id="image_" src="<%=Image %>"
                                                            alt="product image">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="tm-prodetails-content">
                                            <h4 class="tm-prodetails-title" id="Name"><%=Name %></h4>
                                            <div class="tm-prodetails-price">
                                                <span runat="server" id="Price"></span>
                                            </div>
                                            <ul class="tm-prodetails-infos">
                                                <li id="Mouthpiece" runat="server">Mouthpiece: <a href="#"><%=MouthPiece %></a></li>
                                                <li runat="server" id="Type_div" visible="false" style="margin: 10px 0;">Type: <a href="#"><%=Type %></a><select style="margin: 5px 0;" onchange="changedDropdown(this)" runat="server" name="Type_" id="Type_dropdown"></select> </li>
                                                <li runat="server" id="Style" style="margin: 10px 0;">Style: <a href="#"><%=Style_val %></a> <select style="margin: 5px 0;" onchange="changedDropdown(this)" runat="server" name="Style_" id="Style_"></select> </li>
                                                <li runat="server" id="Length" style="margin: 10px 0;">Length: <a href="#"><%=Length_val %></a> <select style="margin: 5px 0;" onchange="changedDropdown(this)" runat="server" name="Length_" id="Length_"></select> </li>
                                                <li id="No_" style="margin: 10px 0;">Product ID: <%=No_ %></li>
                                                <li style="color:red; font-size:12px;">Available: <%=InStock %></li>
                                            </ul>
<%--                                            <span style="color:red; font-size:12px;">*Please Allow 4-6 weeks for delivery</span>--%>

                                            <div class="tm-prodetails-paras">
                                                <p><%=Description %></p>
                                            </div>
                                            <%--<span style="font-size:12px"> We currently have <%=Quantity%> products on shelf</span><br />--%>

                                            <div runat="server" id="shopping" class="tm-prodetails-quantitycart">
                                                <div class="tm-quantitybox">
                                                    <input id="quantity" disabled="disabled" type="text" value="1">
                                                </div>
                                                <a href="javascript:addToCart();" id="cart_btn"  class="tm-button tm-button-dark">Add To Cart</a>
                                            </div>

                                            <div class="tm-prodetails-share">
                                                <h6>Share :</h6>
                                                <ul>
                                                    <li><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=<%=URL_ %>"><i class="ion-social-facebook"></i></a></li>
                                                    <li><a href="https://twitter.com/intent/tweet?text=<%=URL_ %>"><i class="ion-social-twitter"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--// Product Details -->

                            <!-- Product Details Description & Review -->
                 <%--           <div class="tm-prodetails-desreview tm-padding-section-sm-top">
                                <ul class="nav tm-tabgroup2" id="prodetails" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="prodetails-area1-tab" data-toggle="tab"
                                            href="#prodetails-area1" role="tab" aria-controls="prodetails-area1"
                                            aria-selected="true">Description</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="prodetails-area2-tab" data-toggle="tab"
                                            href="#prodetails-area2" role="tab" aria-controls="prodetails-area2"
                                            aria-selected="false">Reviews <%=ReviewCount%></a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="prodetails-content">
                                    <div class="tab-pane fade show active" id="prodetails-area1" role="tabpanel"
                                        aria-labelledby="prodetails-area1-tab">
                                        <div class="tm-prodetails-description">
                                            <h6>Product Description</h6>
                                            <p><%=Description %></p>
                                            <p><%=Description2 %></p>
                                        </div>
                                    </div>
                                <div class="tab-pane fade" id="prodetails-area2" role="tabpanel"
                                        aria-labelledby="prodetails-area2-tab">
                                        <div class="tm-prodetails-review">
                                            <h6><%=ReviewCount %> Review For <%=Name %></h6>
                                            <div class="tm-comment-wrapper mb-30">
                                                <!-- Comment Single -->
                                                <asp:Panel ID="review_panel" runat="server"></asp:Panel>
                                                <!--// Comment Single -->
                                            </div>

                                            <h6>Add a review</h6>
                                            <div class="tm-form">
                                                <div class="tm-form-inner">
                                                    <div class="tm-form-field">
                                                        <div class="tm-ratingbox tm-ratingbox-input" style="cursor:pointer">
                                                            <span class="is-active rating-insert"><i
                                                                    class="ion-android-star"></i></span>
                                                            <span class="is-active rating-insert"><i
                                                                    class="ion-android-star"></i></span>
                                                            <span class="is-active rating-insert"><i
                                                                    class="ion-android-star"></i></span>
                                                            <span class="is-active rating-insert"><i
                                                                    class="ion-android-star"></i></span>
                                                            <span class="rating-insert"><i class="ion-android-star"></i></span>
                                                        </div>
                                                    </div>
                                                    <div class="tm-form-field">
                                                        <textarea id="product-review" name="product-review" cols="30" rows="5"
                                                            placeholder="Your Review"></textarea>
                                                    </div>
                                                    <div class="tm-form-field">
                                                        <button onclick="clickForReview()" type="button" class="tm-button">Submit</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <!--// Product Details Description & Review -->

                            <!-- Similliar Products -->
                            <asp:Panel ID="similiar_products_panel" runat="server"></asp:Panel>
                            <!--// Similliar Products -->

                        </div>
                    </div>
                </div>
            </div>
            <!--// Products Area -->
        </main>
        <!--// Page Content -->


    <script type="text/javascript">

        var No_ = '<%=No_%>';
        var Name = '<%=Name%>';
        var Price = '<%=Price_%>'

        <%--var count = '<%=Quantity%>';--%>
        var count = '100';
        var change = true;
        var userquantity = 1;

        window.onload = function () {
            /* Product Quality Box */
            
            

            if (parseFloat(count) <= 0) {
                document.getElementById('cart_btn').innerHTML = "Out Of Stock";
                document.getElementById('cart_btn').addEventListener('click', function (e) {
                    e.preventDefault();
                });
                change = false;
            }

                    
            $('.tm-quantitybox').append('<div class="decrement-button tm-quantitybox-button">-</i></div><div class="increment-button tm-quantitybox-button">+</div>');
            $('.tm-quantitybox-button').on('click', function () {
                var button = $(this);
                var quantityOldValue = button.parent().find('input').val();
                var quantityNewVal;
                if (change) {
                    if (button.text() == "+") {
                        quantityNewVal = parseFloat(quantityOldValue) + 1;
                    } else {
                        if (quantityOldValue > 1) {
                            quantityNewVal = parseFloat(quantityOldValue) - 1;
                        } else {
                            quantityNewVal = 1;
                        }
                    }
                    userquantity = quantityNewVal;
                    button.parent().find('input').val(quantityNewVal);
                }
            });
        }



        function addToCart() {

            var data_ = { "No_": No_, "Name": Name, "Quantity": userquantity, "Price": Price };


            $.ajax({
                method: 'POST',
                url: '/Details.aspx/addToCart',
                contentType: 'application/json',
                data: JSON.stringify(data_),
                headers: {
                    'Accept': 'application/json, text/plain, */*',
                    'Content-type': 'application/json'
                },
                success: function (data) {
                    var data = data.d;

                    if (data) {
                        addedStatus("success", "Item has been successfully added");
                        $(".mycart").removeClass("ion-android-cart").addClass("iconify");
                        $( ".mycart" ).attr('data-icon','clarity-shopping-cart-outline-badged');
                    }

                },
                error: function (error) { console.log("FAIL....================="); console.log(error); }
            });

        }


        function addedStatus(status, message) {

             const Toast = Swal.mixin({
                        toast: true,
                        position: 'center',
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
        }

    
    function changedDropdown(selectedObject, secondary){
        var searching;
        var canPass = false;

        if (selectedObject) {

            searching = selectedObject.value.split("_")[1];
            //console.log(selectedObject, searching);

            if (!selectedObject.value.startsWith('type_0_0')) {
                canPass = true;
            }

        } else {
            searching = secondary.split("_")[1];
            canPass = true;
        }


        if (canPass) {
   
            $.ajax({
                method: 'POST',
                url: '/Details.aspx/updateData',
                contentType: 'application/json',
                data: '{data_:"' + searching + '"}',
                headers: {
                    'Accept': 'application/json, text/plain, */*',
                    'Content-type': 'application/json'
                },
                success: function (data) {
                    var data = data.d;
                    console.log(data);
                    editData(data);


                },
                error: function (error) { console.log("FAIL....================="); console.log(error); }
            });
        }

    }


    function editData(oldData) {

        var listFound = false, list1Found = false, list2Found = false;
        No_ = oldData[0].No_;
        Name = oldData[0].Name;
        Price = oldData[0].Price;

        var type_env = document.getElementById('<%=Type_div.ClientID%>');
        var style_env = document.getElementById('<%=Style.ClientID%>');
        var length_env = document.getElementById('<%=Length.ClientID%>');


        if (type_env) {
            type_env.innerHTML = "";
            list1Found = true;
        }
        if (style_env) {
            style_env.innerHTML = "";
            listFound = true;
        }
        if (length_env) {
            list2Found = true;
            length_env.innerHTML = "";
        }

<%--        document.getElementById('<%=Style.ClientID%>').innerHTML = "";
        document.getElementById('<%=Length.ClientID%>').innerHTML = "";--%>

        document.getElementById('Name').innerHTML = oldData[0].Name;
        //document.getElementById('<%=Type_div.ClientID%>').innerHTML = "Type: " + oldData[0].Type;
        document.getElementById('image_').src = `/images/products/${oldData[0].No_}.png`;
        document.getElementById('big_image_').href = `/images/products/${oldData[0].No_}.png`;

        document.getElementById('No_').innerHTML = "Product ID: " + oldData[0].No_;

        var list = document.getElementById("<%=Style.ClientID%>");
        var list_1 = document.getElementById("<%=Type_div.ClientID%>");
        var list_2 = document.getElementById("<%=Length.ClientID%>");
        const position = "beforeend";

        var style_div = `<label>Style: ${oldData[0].Style}</label>`;
        var length_div = `<label>Length: ${oldData[0].Length}</label>`;
        var type_div = `<label>Type: ${oldData[0].Type}</label>`;


        
        type_div += `<select class='nice-select' onchange="changedDropdown(this)" id='new_select_Type'>
        <option value="type_0_0"> - SELECT YOUR TYPE - </option>`;

        style_div += `<select class='nice-select' onchange="changedDropdown(this)" id='new_select_Style'>
        <option value="type_0_0"> - SELECT YOUR STYLE - </option>`;


        length_div += `<select class='nice-select' onchange="changedDropdown(this)" id='new_select_Length'>
        <option value="type_0_0"> - SELECT YOUR Length - </option>`;


        oldData.forEach(function (data, key) {

            if (data.Type && key != 0) {

                var isSelected = '';
                if (`${data.Type}` === oldData[0].Type) isSelected = 'selected'

                type_div += `<option ${isSelected} value="style_${data.No_}_${data.Type}">${data.Type}</option>`;
            }


            if (data.Style && key != 0) {

                var isSelected = '';
                if (`${data.Style}` === oldData[0].Style) isSelected = 'selected'
                
                style_div += `<option ${isSelected} value="style_${data.No_}_${data.Style}">${data.Style}</option>`;
            }


            if (data.Length && key != 0) {

                var isSelected = '';
                if (`${data.No_}` === oldData[0].No_) isSelected = 'selected'
                
                length_div += `<option ${isSelected} value="style_${data.No_}_${data.Length}">${data.Length}</option>`;
            }

        });


        type_div += `</select>`;
        style_div += `</select>`;
        length_div += `</select>`;

        if (listFound) {
            list.insertAdjacentHTML(position, style_div)
        }

        if (list1Found) {
            list_1.insertAdjacentHTML(position, type_div)
        }

        if (list2Found) {
            list_2.insertAdjacentHTML(position, length_div)
        }

        history.pushState({ pageID: oldData[0].No_ }, 'details.aspx', oldData[0].No_);

    }


        function getCookie(name) {
            const value = `; ${document.cookie}`;
            const parts = value.split(`; ${name}=`);
            if (parts.length === 2) return parts.pop().split(';').shift();
        }

        async function clickForReview() {
            var customerID = await getCookie('JIM_B_CustomerID')
            var message = document.getElementById('product-review');
            var starRating = document.querySelectorAll('.is-active.rating-insert');
            var productNumber = No_;

            if (!customerID) return Toast.fire({
                type: 'error',
                position: 'center',
                title: 'You must be logged in to submit a review'
            });

            if (!message.value) { message.style.border = '1px solid red'; return; } 


            var data_ = { "CustomerId": customerID, "No_": productNumber, "starRating": starRating.length, "message": message.value };
            console.log(data_);

            var completed = await $.ajax({
                method: 'POST',
                url: '/Details.aspx/addReview',
                contentType: 'application/json',
                data: JSON.stringify(data_),
                headers: {
                    'Accept': 'application/json, text/plain, */*',
                    'Content-type': 'application/json'
                },
                success: function (data) {
                    var data = data.d;

                    var defaultType = 'error';
                    var defaultTitle = 'You have already submitted a review for this product, or something went wrong. Please try again later!';

                    if (data) {
                        defaultType = 'success';
                        defaultTitle = 'Review has been submitted. Thank you';
                    }

                    return Toast.fire({
                        type: defaultType,
                        position: 'center',
                        title: defaultTitle
                    });

                },
                error: function (error) { console.log("FAIL....================="); console.log(error); }
            });

            if (completed.d) {
                setTimeout(function () { location.reload(); }, 3000);             
            }
        }


        var descriptionTab = document.getElementById('prodetails-area1-tab');
        var descriptionValue = `<%=Description%>`;

        if (!descriptionValue) {
            $('#prodetails-area1').removeClass('show active');
            $('#prodetails-area2').addClass('show active');
            descriptionTab.style.display = 'none';
        }






    </script>



</asp:Content>