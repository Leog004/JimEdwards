<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


            <!-- Breadcrumb Area -->
        <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="/images/newImages/hd_shopbl2.jpg"
            data-white-overlay="2">
            <div class="container">
                <div class="tm-breadcrumb">
                    <h2 style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Shopping Cart</h2>                    
                    <ul>
                        <li><a style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);" href="/">Home</a></li>
                        <li><a style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);" href="/shop.aspx">Shop</a></li>
                        <li style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Cart</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--// Breadcrumb Area -->



            <!-- Page Content -->
        <main class="page-content">

            <!-- Shopping Cart Area -->
            <div class="tm-section shopping-cart-area bg-white tm-padding-section">
                <div class="container">
                    <h4 runat="server" id="empty_cart" visible="false">*Your Cart Is Empty</h4>
                    <!-- Shopping Cart Table -->
                    <div class="tm-cart-table table-responsive">
                        <table class="table table-bordered mb-0">
                            <thead>
                                <tr>
                                    <th class="tm-cart-col-image" scope="col">Image</th>
                                    <th class="tm-cart-col-productname" scope="col">Product</th>
                                    <th class="tm-cart-col-price" scope="col">Price</th>
                                    <th class="tm-cart-col-quantity" scope="col">Quantity</th>
                                    <th class="tm-cart-col-total" scope="col">No:</th>
                                    <th class="tm-cart-col-remove" scope="col">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Panel id="UserProducts_panel" runat="server"></asp:Panel>
                            </tbody>
                        </table>
                    </div>
                    <!--// Shopping Cart Table -->

                    <!-- Shopping Cart Content -->
                    <div class="tm-cart-bottomarea">
                        <div class="row">
                            <div class="col-lg-7 mt-50">
                                <div class="tm-buttongroup">
                                    <a href="/shop" class="tm-button">Continue Shopping</a>
                                    <a href="javascript:updateCart();" class="tm-button">Update Cart</a>
                                </div>

                            </div>
                            <div class="col-lg-5 mt-50">
                                <div class="tm-cart-pricebox">
                                    <h6>Cart Total</h6>
                                    <div class="table-responsive">
                                        <table class="table table-borderless">
                                            <tbody>
                                                <tr class="tm-cart-pricebox-shipping">
                                                    <td>(+) Shipping</td>
                                                    <td><%=Shipping %></td>
                                                </tr>
                                                <tr class="tm-cart-pricebox-subtotal">
                                                    <td>Cart Subtotal</td>
                                                    <td><%=SubTotal %></td>
                                                </tr>
                                                <tr class="tm-cart-pricebox-subtotal">
                                                    <td>Total</td>
                                                    <td><%=Total %></td>
                                                </tr>
                                                <tr class="tm-cart-pricebox-total">
                                                    <td>*Not Including Taxes</td>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <a href="/checkout.aspx" class="tm-button tm-button-dark" runat="server" id="checkout_btn">Proceed To Checkout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--// Shopping Cart Content -->

                </div>
            </div>
            <!--// Shopping Cart Area -->



        </main>
        <!--// Page Content -->


    <script type="text/javascript">

        function removeProductFromCart(cartID) {
            var data_ = { "cartID": cartID };

             $.ajax({
                    method: 'POST',
                    url: '/cart.aspx/DeleteProduct',
                    contentType: 'application/json',
                    data: JSON.stringify(data_),
                    headers: {
                        'Accept': 'application/json, text/plain, */*',
                        'Content-type': 'application/json'
                    },
                    success: function (data) {
                        var data = data.d;

                        if (data) {
                            addedStatus("success", "Item has been successfully removed");
                            setTimeout(function(){ window.location.reload(); }, 3000);
                            
                        } else {
                            addedStatus("failure", "Something went wrong, please try again!");
                            setTimeout(function(){ window.location.reload(); }, 3000);
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


        function updateCart() {

            var x = document.querySelectorAll('.productRow_');
            var data_ = [];
            var a = '';
            x.forEach(function (el) {
                var qty = document.getElementById(`${el.id}_quantity`).value;
                 a = { "cartID": el.id, "quantity": qty };
                data_.push(a);
            });

            //console.log(data_);

            

            $.ajax({
                    method: 'POST',
                    url: '/cart.aspx/updateProduct',
                    contentType: 'application/json',
                    data: JSON.stringify({ myData: data_ }),
                    headers: {
                        'Accept': 'application/json, text/plain, */*',
                        'Content-type': 'application/json'
                    },
                    success: function (data) {
                        var data = data.d;

                        console.log(data);
                        if (data) {
                            addedStatus("success", "Item has been successfully updated!");
                            setTimeout(function(){ window.location.reload(); }, 3000);
                            
                        } else {
                            addedStatus("failure", "Something went wrong, please try again!");
                            setTimeout(function(){ window.location.reload(); }, 3000);
                        }

                    },
                    error: function (error) { console.log("FAIL....================="); console.log(error.responseText); }
            });
            

        }


    </script>

</asp:Content>