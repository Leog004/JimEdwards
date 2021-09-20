<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/MasterPage.master" CodeFile="account.aspx.cs" Inherits="account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="/assets/css/invoice.css">

    <style>

@media only screen and (max-width: 600px) {

.tm-tabgroup2 li a {
    color: #111111;
    font-size: 20px;
    font-weight: 600;
    display: inline-block;
    padding: 0;
    padding-bottom: unset; 
    margin: 10px 0;
    position: relative;
}

}


    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


            <!-- Breadcrumb Area -->
        <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="/images/newImages/hd_aboutbl2.jpg"
            data-white-overlay="2">
            <div class="container">
                <div class="tm-breadcrumb">
                    <h2 style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Account Information</h2>
                    <ul>
                        <li ><a href="/" style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Home</a></li>
                        <li style="color:#ccc; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">My Account</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--// Breadcrumb Area -->



           <!-- Page Content -->
        <main class="page-content">

            <!-- My Account Area -->
            <div class="tm-section tm-my-account-area bg-white tm-padding-section">
                <div class="container">
                    <div class="tm-myaccount">

                        <ul class="nav text-center tm-tabgroup2" id="account" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="account-dashboard-tab" data-toggle="tab"
                                    href="#account-dashboard" role="tab" aria-controls="account-dashboard"
                                    aria-selected="true">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="account-orders-tab" data-toggle="tab" href="#account-orders"
                                    role="tab" aria-controls="account-orders" aria-selected="false">Orders</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="account-address-tab" data-toggle="tab" href="#account-address"
                                    role="tab" aria-controls="account-address" aria-selected="false">Address</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="account-acdetails-tab" data-toggle="tab"
                                    href="#account-acdetails" role="tab" aria-controls="account-acdetails"
                                    aria-selected="false">Account Details</a>
                            </li>
                            <li class="nav-item">
                                <a runat="server" onclick="logout();" onserverclick="logout_serverClick" class="nav-link" style="color:red;" id="account_logout_tab" href="#" role="tab"
                                    aria-controls="account-address" aria-selected="false">Logout</a>
                            </li>
                        </ul>

                        <div class="row justify-content-center">
                            <div class="col-lg-8 col-md-10 col-12">


                                <div class="tab-content" id="account-ontent">
                                    <div class="tab-pane fade show active" id="account-dashboard" role="tabpanel"
                                        aria-labelledby="account-dashboard-tab">
                                        <div class="tm-myaccount-dashboard">
                                            <p>Hello <b><%=Name %></b> (not <b><%=Name %></b>? <a
                                                    href="#" runat="server" onserverclick="logout_serverClick">Log
                                                    out</a>)</p>
                                            <p>From your account dashboard you can view your recent orders, manage your
                                                shipping and billing addresses, and edit your password and account
                                                details.</p>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="account-orders" role="tabpanel"
                                        aria-labelledby="account-orders-tab">
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
                                                    <tbody>
                                                        <asp:Panel ID="orders_panel" runat="server"></asp:Panel>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="account-address" role="tabpanel"
                                        aria-labelledby="account-address-tab">
                                        <div class="tm-myaccount-address">
                                            <p><b>The following addresses will be used on the checkout page by
                                                    default.</b></p>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="tm-myaccount-address-billing">
                                                        <a href="javascript:updateAddress_input('Billing');" class="edit-button">Edit</a>
                                                        <h5>Billing Address</h5>
                                                        <address>
                                                        <asp:Panel ID="billing_address_panel" runat="server"></asp:Panel>
                                                        </address>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 mt-30 mt-md-0">
                                                    <div class="tm-myaccount-address-shipping">
                                                        <a href="javascript:updateAddress_input('Shipping');" class="edit-button">Edit</a>
                                                        <h5>Shipping Address</h5>
                                                        <address>
                                                            <asp:Panel ID="shipping_address_panel" runat="server"></asp:Panel>
                                                        </address>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="account-acdetails" role="tabpanel"
                                        aria-labelledby="account-acdetails-tab">
                                        <div class="tm-myaccount-acdetails">
                                            <div class="tm-form tm-form-bordered">
                                                <h4>Account Details</h4>
                                                <div class="tm-form-inner">
                                                    <div class="tm-form-field tm-form-fieldhalf">
                                                        <label for="acdetails-firstname">First Name</label>
                                                        <input value="<%=FirstName %>" type="text" id="acdetails-firstname">
                                                    </div>
                                                    <div class="tm-form-field tm-form-fieldhalf">
                                                        <label for="acdetails-lastname">Last Name</label>
                                                        <input value="<%=LastName %>" type="text" id="acdetails-lastname">
                                                    </div>
                                                    <div class="tm-form-field">
                                                        <label for="acdetails-displayname">Display Name</label>
                                                        <input type="text" value="<%=DisplayName %>" id="acdetails-displayname">
                                                    </div>
                                                    <div class="tm-form-field">
                                                        <label for="acdetails-email">Email address</label>
                                                        <input value="<%=EmailAddress %>" type="email" id="acdetails-email" disabled="disabled">
                                                    </div>
                                                    <div class="tm-form-field">
                                                        <a href="javascript:updateAccountDetails();" class="tm-button" style="color:#fff;">Save Changes</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
                                <strong>Status</strong><span id="invoice_status">: January 1, 2015</span><br>
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
                    Quantity
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

    function updateAddress_input(type){

    var name, address, state, city, zip = "";
    var type = type;
   

var inputOptionsPromise = new Promise(function (resolve) {
  // get your data and pass it to resolve()
      setTimeout(function () {
        resolve({
            "AL": "Alabama",
            "AK": "Alaska",
            "AS": "American Samoa",
            "AZ": "Arizona",
            "AR": "Arkansas",
            "CA": "California",
            "CO": "Colorado",
            "CT": "Connecticut",
            "DE": "Delaware",
            "DC": "District Of Columbia",
            "FM": "Federated States Of Micronesia",
            "FL": "Florida",
            "GA": "Georgia",
            "GU": "Guam",
            "HI": "Hawaii",
            "ID": "Idaho",
            "IL": "Illinois",
            "IN": "Indiana",
            "IA": "Iowa",
            "KS": "Kansas",
            "KY": "Kentucky",
            "LA": "Louisiana",
            "ME": "Maine",
            "MH": "Marshall Islands",
            "MD": "Maryland",
            "MA": "Massachusetts",
            "MI": "Michigan",
            "MN": "Minnesota",
            "MS": "Mississippi",
            "MO": "Missouri",
            "MT": "Montana",
            "NE": "Nebraska",
            "NV": "Nevada",
            "NH": "New Hampshire",
            "NJ": "New Jersey",
            "NM": "New Mexico",
            "NY": "New York",
            "NC": "North Carolina",
            "ND": "North Dakota",
            "MP": "Northern Mariana Islands",
            "OH": "Ohio",
            "OK": "Oklahoma",
            "OR": "Oregon",
            "PW": "Palau",
            "PA": "Pennsylvania",
            "PR": "Puerto Rico",
            "RI": "Rhode Island",
            "SC": "South Carolina",
            "SD": "South Dakota",
            "TN": "Tennessee",
            "TX": "Texas",
            "UT": "Utah",
            "VT": "Vermont",
            "VI": "Virgin Islands",
            "VA": "Virginia",
            "WA": "Washington",
            "WV": "West Virginia",
            "WI": "Wisconsin",
            "WY": "Wyoming"
        })
      }, 2000)
    })

    Swal.mixin({
              input: 'text',
              confirmButtonText: 'Next &rarr;',
              showCancelButton: true,
              progressSteps: ['1', '2', '3', '4', 5]
            }).queue([
              {
                title: 'Update Billing Address',
                text: 'Name on address',
                input: 'text',
                inputPlaceholder: 'Enter your full name',
                inputValidator: (value) => {
                if (!value) {
                      return 'You need to enter your full name!'
                    }
                }

              },
              {
                title: 'Update Billing Address',
                text: 'Street Address',
                input: 'text',
                inputPlaceholder: 'Enter your street address',
                inputValidator: (value) => {
                if (!value) {
                      return 'You need to enter your street address!'
                    }
                }
              },
              {
                title: 'Update Billing Address',
                text: 'State',
                input: 'select',
                inputOptions: inputOptionsPromise,
                inputValidator: (value) => {
                if (!value) {
                      return 'You need to enter your email address!'
                    }
                }
              },
              {
                title: 'Update Billing Address',
                text: 'City',
                input: 'text',
                inputPlaceholder: 'Enter your city',
                inputValidator: (value) => {
                if (!value) {
                      return 'You need to enter your city!'
                    }
                }
              },
              {
                title: 'Update Billing Address',
                text: 'Zip',
                input: 'text',
                inputPlaceholder: 'Enter your zip code',
                inputValidator: (value) => {
                if (!value) {
                      return 'You need to enter your zip code!'
                    }
                }
              }
            ]).then((result) => {
              if (result.value) {
                 
                  Swal.fire({
                      title: 'Your billing address has been updated!',
                      html: `Please make any corrections if neccessary. Your information has been saved.`,
                      confirmButtonText: 'Thank You!'
                  });
            
                name = result.value[0];
                address = result.value[1];
                state = result.value[2];
                city = result.value[3];
                zip = result.value[4];

                    updateAddress(name, address, state, city, zip, type);
              }
            });

             

    }



    function updateAddress(Name, Address, State, City, Zip, Type){

            var status = "error", message = `${Type} update has failed! Please try again.`;
            var data_ = { "Name": Name, "Address" : Address, "State": State, "City" : City, "Zip": Zip, "Type": Type};
            console.log(data_);

            $.ajax({
                method: 'POST',
                url: '/account.aspx/updateAddress',
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
                        message = `${Type} address has been updated successfuly!`;
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


    
    function updateAccountDetails(){
    
        const firstName = document.getElementById('acdetails-firstname').value;
        const lastName = document.getElementById('acdetails-lastname').value;
        const displayName = document.getElementById('acdetails-displayname').value;
        const emailAddress = document.getElementById('acdetails-email').value;
    
        console.log(firstName, lastName, displayName, emailAddress);
        var status = "error", message = `Account Details update has failed! Please try again.`;
        var data_ = { "firstName": firstName, "lastName" : lastName, "displayName": displayName, "emailAddress" : emailAddress};

        console.log(JSON.stringify(data_));

            $.ajax({
                method: 'POST',
                url: '/account.aspx/updateAccountDetails',
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
                        message = `Account Details has been updated successfuly!`;
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



    function getOrderDetails(orderID, orderStatus){
    
        var No_ = document.getElementById("invoice_orderID");
        var date = document.getElementById("invoice_date");
        var customerName = document.getElementById("invoice_customerName");
        var email = document.getElementById("invoice_email");
        var address = document.getElementById("invoice_address");
        var state = document.getElementById("invoice_state_city_zip");
        var total = document.getElementById("invoice_total");
        var subTotal = document.getElementById("invoice_subtotal");
        var status = document.getElementById("invoice_status");

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
                    status.innerHTML = `: ${orderStatus}`
                    No_.innerHTML = `: ${data[0].No_}`
                    date.innerHTML = `: ${data[0].Date}`;
                    customerName.innerHTML = `${data[0].CustomerName}`
                    email.innerHTML = `${data[0].Email}`
                    address.innerHTML = `${data[0].Address}`
                    state.innerHTML = `<b>City</b>: ${data[0].City} <span style='margin:0 10px;'> <b>State</b>: ${data[0].State}</span> <span style='margin:0 10px;'> <b>Zip</b>: ${data[0].Zip}</span>`
                    total.innerHTML = `SubTotal: $${data[0].SubTotal} <br>
                                       Shipping: $${data[0].Shipping} <br>
                                       Tax: $${data[0].Tax} <br>
                                       Total: $${data[0].Total}`;

                    data.forEach(function (newData, key) {
                        if (newData.IsRow && key != 0) {

                            myhtml += ` <tr class='item insertedRow'>
                                            <td>  ${newData.Name} </td>
                                            <td>  ${newData.QTY} </td>
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

