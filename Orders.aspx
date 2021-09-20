<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="/assets/css/invoice.css">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


            <!-- Breadcrumb Area -->
        <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="/images/newImages/hd_aboutbl2.jpg"
            data-white-overlay="2">
            <div class="container">
                <div class="tm-breadcrumb">
                    <h2 style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Account Orders</h2>
                    <ul>
                        <li><a style="color:#eee;" href="/">Home</a></li>
                        <li style="color:#eee;">Orders</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--// Breadcrumb Area -->



           <!-- Page Content -->
        <main class="page-content">

            <div class="tm-section tm-my-account-area bg-white tm-padding-section" style="padding: 50px 0 0 0; margin: 0">
                <div class="container">
                    <div class="tm-form tm-checkout-form">
                        <div class="row justify-content-md-center">
                            <div class="col-lg-8">
                                <h4 class="small-title">Order Information</h4>
                                    <div class="tm-form-field tm-form-field">
                                            <label for="orderform-email">Email</label>
                                            <input id="orderform-email" type="email" placeholder="Please Enter Your Email" />
                                    </div>
                                 <button type="button" onclick="findOrders()" class="btn btn-primary mt-3">
                                  View Orders
                                </button>
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>

            <!-- My Account Area -->
            <div class="tm-section tm-my-account-area bg-white tm-padding-section" style="padding:30px 0 50px 0">
                <div class="container">
                    <div class="tm-myaccount">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 col-md-10 col-12">
                                        <div class="tm-myaccount-orders">
                                            <div class="table-responsive">
                                                <table class="table table-bordered mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th class="tm-myaccount-orders-col-id">ORDER ID</th>
                                                            <th class="tm-myaccount-orders-col-date">DATE</th>
                                                            <th class="tm-myaccount-orders-col-status">STATUS</th>
                                                            <th class="tm-myaccount-orders-col-total">TOTAL</th>
                                                            <th class="tm-myaccount-orders-col-view">VIEW</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="order_panel">
                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                        </div>

                    </div>
                </div>
            </div>
            <!--// My Account Area -->

   
    
<div class="modal fade" id="invoiceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="invoice-box">
        <table>
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="title">
                                <img src="/images/newImages/JElogoblbk.jpg" style="width:100%; max-width:300px;">
                            </td>
                            
                            <td>
                                <strong>OrderID</strong><span id="invoice_orderID">: 123</span><br>
                                <strong>Date Ordered</strong><span id="invoice_date">: January 1, 2015</span><br>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr class="information">
                <td colspan="2">
                    <table>
                        <tr>
                            <td>
                                <strong style="text-decoration:underline;">Address</strong><br />                       
                                <span id="invoice_address">12345 Sunny Road</span><br>
                                <span id="invoice_state_city_zip">Sunnyville, CA 12345</span>
                            </td>
                            
                            <td>
                                <strong style="text-decoration:underline;">Customer</strong><br>
                                <span id="invoice_customerName">John Doe</span><br>
                                <span id="invoice_email">john@example.com</span>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            
            <tr class="heading" id="invoice_item_rows">
                <td>
                    Item
                </td>
                
                <td>
                    Price
                </td>
            </tr>
            <tr class="total">
                <td id="invoice_subtotal"></td>
                
                <td id="invoice_total">
                   Total: $385.00
                </td>
            </tr>
        </table>
    </div>      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
            

        
        </main>
        <!--// Page Content -->



<script type="text/javascript">


    function findOrders() {
        var userEmail = document.getElementById('orderform-email');

        if (!userEmail.value) {
            return userEmail.style.border = '1px solid red';
        }

        var data_ = { "email": userEmail.value }; 
        var html = '';
        var row = document.getElementById('order_panel');
        var position = 'afterbegin';

        $.ajax({
            method: 'POST',
            url: '/Orders.aspx/getOrders',
            contentType: 'application/json',
            data: JSON.stringify(data_),
            headers: {
                'Accept': 'application/json, text/plain, *',
                'Content-type': 'application/json',
                'dataType': 'json'
            },
            success: function (data) {
                var myData = data.d;

                myData.forEach(function (value, key) {

                    if (!value.Status) value.Status = 'Not Shipped';

                    html += `<tr>
                                <td><a style='color:#000; font-weight:600' href='javascript:getOrderDetails("${value.OrderID}")'> ${value.OrderID} </a></td>
                                <td> ${value.Date} </td>
                                <td> ${value.Status} </td>
                                <td> ${value.Total} </td>
                                <td><a style='color:#007BFF; font-weight:600' href='javascript:getOrderDetails("${value.OrderID}")'>View Details</td>
                             </tr>`;

                });

                row.insertAdjacentHTML(position, html);
            },
            error: function (error) { console.log("FAIL....================="); console.log(error); }
        });

    }

    function getOrderDetails(orderID){
    
        var No_ = document.getElementById("invoice_orderID");
        var date = document.getElementById("invoice_date");
        var customerName = document.getElementById("invoice_customerName");
        var email = document.getElementById("invoice_email");
        var address = document.getElementById("invoice_address");
        var state = document.getElementById("invoice_state_city_zip");
        var total = document.getElementById("invoice_total");
        var subTotal = document.getElementById("invoice_subtotal");
        
        const position = "afterend";
        var rows = document.getElementById("invoice_item_rows");
        var data_ = {"OrderID" : orderID};       
        var myhtml = '';

            $.ajax({
                method: 'POST',
                url: '/account.aspx/getOrderDetails',
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
                    No_.innerHTML = `: ${data[0].No_}`
                    date.innerHTML = `: ${data[0].Date}`;
                    customerName.innerHTML = `${data[0].CustomerName}`
                    email.innerHTML = `${data[0].Email}`
                    address.innerHTML = `${data[0].Address}`
                    state.innerHTML = `City: ${data[0].City} State: ${data[0].State} Zip: ${data[0].Zip}`
                    total.innerHTML = `SubTotal: $${data[0].SubTotal} <br>
                                       Total: $${data[0].Total}`;

                    data.forEach(function (newData, key) {
                        if (newData.IsRow && key != 0) {

                            myhtml += ` <tr class='item insertedRow'>
                                            <td>  ${newData.Name} </td>
                                            <td>  ${newData.Price}</td>
                                      </tr>`;
                        }
                    });


                    rows.insertAdjacentHTML(position, myhtml)
                  

                    $('#invoiceModal').modal('toggle');

                    
                },
                error: function (error) { console.log("FAIL....================="); console.log(error); }
            });

        $('.insertedRow').html('');

    }

</script>



</asp:Content>

