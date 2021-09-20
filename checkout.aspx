<%@ Page Language="C#" MasterPageFile="/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="breadcrumb" Runat="Server">


</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


                <!-- Breadcrumb Area -->
        <div class="tm-breadcrumb-area tm-padding-section bg-grey" data-bgimage="/images/newImages/hd_shopbl2.jpg"
            data-white-overlay="2">
            <div class="container">
                <div class="tm-breadcrumb">
                    <h2 style="color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">CheckOut</h2>
                    <ul>
                        <li><a style="color:#fff; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);" href="/">Home</a></li>
                        <li style="color:#fff; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);">Check Out</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--// Breadcrumb Area -->


            <!-- Page Content -->
        <main class="page-content">

            <!-- Checkout Area -->
            <div class="tm-section tm-checkout-area bg-white tm-padding-section">
                <div class="container">
<%--                    <div class="tm-checkout-coupon">
                        <a href="#checkout-couponform" data-toggle="collapse"><span>Have a coupon code?</span> Click
                            here and enter your code.</a>
                        <div id="checkout-couponform" class="collapse">
                            <div  class="tm-checkout-couponform">
                                <input type="text" id="coupon-field" placeholder="Enter coupon code"
                                    required="required">
                                <button type="submit" class="tm-button">Submit</button>
                            </div>
                        </div>
                    </div>--%>
                    <div class="tm-form tm-checkout-form">
                        <div class="row justify-content-md-center">
                            <div class="col-lg-8">
                                <h4 class="small-title">SHIPPING INFORMATION</h4>

                                <!-- Billing Form -->
                                <div class="tm-checkout-billingform">
                                    <div class="tm-form-inner">
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="billingform-firstname">First name*</label>
                                            <input value="" type="text" id="billingform-firstname">
                                        </div>
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="billingform-lastname">Last name*</label>
                                            <input value="" type="text" id="billingform-lastname">
                                        </div>
                                        <div class="tm-form-field">
                                            <label for="billingform-email">Email address*</label>
                                            <input value=""  type="email" id="billingform-email">
                                        </div>
                                        <div class="tm-form-field tm-form-field">
                                            <label for="billingform-state">State</label>
                                            <select name="state" id="billingform-state" style="display:block">
                                                  <option selected="selected">- Please Choose A State - </option>
                                                  <option value="AL">Alabama</option>
                                                  <option value="AK">Alaska</option>
                                                  <option value="AZ">Arizona</option>
                                                  <option value="AR">Arkansas</option>
                                                  <option value="CA">California</option>
                                                  <option value="CO">Colorado</option>
                                                  <option value="CT">Connecticut</option>
                                                  <option value="DE">Delaware</option>
                                                  <option value="FL">Florida</option>
                                                  <option value="GA">Georgia</option>
                                                  <option value="HI">Hawaii</option>
                                                  <option value="ID">Idaho</option>
                                                  <option value="IL">Illinois</option>
                                                  <option value="IN">Indiana</option>
                                                  <option value="IA">Iowa</option>
                                                  <option value="KS">Kansas</option>
                                                  <option value="KY">Kentucky</option>
                                                  <option value="LA">Louisiana</option>
                                                  <option value="ME">Maine</option>
                                                  <option value="MD">Maryland</option>
                                                  <option value="MA">Massachusetts</option>
                                                  <option value="MI">Michigan</option>
                                                  <option value="MN">Minnesota</option>
                                                  <option value="MS">Mississippi</option>
                                                  <option value="MO">Missouri</option>
                                                  <option value="MT">Montana</option>
                                                  <option value="NE">Nebraska</option>
                                                  <option value="NV">Nevada</option>
                                                  <option value="NH">New Hampshire</option>
                                                  <option value="NJ">New Jersey</option>
                                                  <option value="NM">New Mexico</option>
                                                  <option value="NY">New York</option>
                                                  <option value="NC">North Carolina</option>
                                                  <option value="ND">North Dakota</option>
                                                  <option value="OH">Ohio</option>
                                                  <option value="OK">Oklahoma</option>
                                                  <option value="OR">Oregon</option>
                                                  <option value="PA">Pennsylvania</option>
                                                  <option value="RI">Rhode Island</option>
                                                  <option value="SC">South Carolina</option>
                                                  <option value="SD">South Dakota</option>
                                                  <option value="TN">Tennessee</option>
                                                  <option value="TX">Texas</option>
                                                  <option value="UT">Utah</option>
                                                  <option value="VT">Vermont</option>
                                                  <option value="VA">Virginia</option>
                                                  <option value="WA">Washington</option>
                                                  <option value="WV">West Virginia</option>
                                                  <option value="WI">Wisconsin</option>
                                                  <option value="WY">Wyoming</option>
                                            </select>
                                        </div>
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="billingform-city">City</label>
                                            <input value=""  type="text" id="billingform-city">
                                        </div>
                                        <div class="tm-form-field tm-form-fieldhalf">
                                            <label for="billingform-zipcode">Zip / Postcode</label>
                                            <input value=""  type="text" id="billingform-zipcode">
                                        </div>
                                        <div class="tm-form-field">
                                            <label for="billingform-address">Address</label>
                                            <input value=""  type="text" id="billingform-address"
                                                placeholder="Apartment, Street Address">
                                        </div>
                                        <div class="tm-form-field">
                                            <label for="billingform-phone">Phone (Optional)</label>
                                            <input type="text" id="billingform-phone">
                                        </div>
                                        <div class="tm-form-field">
                                            <input type="checkbox" name="billformCheck-billingAddress" id="billformCheck-billingAddress">
                                            <label for="billformCheck-billingAddress"><b style="text-decoration:underline; font-size:18px;">Use Same Information For Billing Address</b></label>
                                        </div>
                                    </div>
                                </div>
                                <!-- Button trigger modal -->
                                <button type="button" onclick="runContinue()" class="btn btn-primary mt-5">
                                  Continue
                                </button>
                                <!--// Billing Form -->
                            </div>
                        </div>
                    </div>
                </div>
              </div>
            <!--// Checkout Area -->

        </main>
        <!--// Page Content -->

    <style>
        .modal{
            background: rgba(0,0,0,0.7);
        }
    </style>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <span style="color:red; font-size:12px;">*Please Allow 4-6 weeks for your product to arrive</span>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
                        <div class="tm-form tm-checkout-form">
                        <div class="row justify-content-md-center">
                                <div class="col-lg-12">
                                <div class="tm-checkout-orderinfo">
                                    <div class="table-responsive">
                                        <table class="table table-borderless tm-checkout-ordertable">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Qty</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody id="products_purchasing">

                                                <div id="ContentPlaceHolder1_products_panel"></div>
                                            </tbody>
                                            <tfoot>
                                                <tr class="tm-checkout-subtotal">
                                                    <td>Cart Subtotal</td>
                                                    <td></td>
                                                    <td id="subTotal"></td>
                                                </tr>
                                                <tr class="tm-checkout-shipping">
                                                    <td>(+) Shipping Charge</td>
                                                    <td></td>
                                                    <td id="frieght"></td>
                                                </tr>
                                                <tr class="tm-checkout-shipping">
                                                    <td>(+) Tax</td>
                                                    <td></td>
                                                    <td id="taxes"></td>
                                                </tr>
                                                <tr class="tm-checkout-total">
                                                    <td>Total</td>
                                                    <td></td>
                                                    <td id="Total"></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>

                                    <div class="tm-checkout-payment">
                                        <h4>Payment Information</h4>
                                        <div class="tm-form-inner">
                                                <div class="tm-form-field tm-form-field">
                                                    <label for="paymentform-name">Name On Card*</label>
                                                    <input type="text" id="paymentform-name">
                                                </div>
                                                <div id="billing_address_form" class="tm-form-field tm-form-field" style="display:none;">
                                                    <label for="billing_address">Billing Address*</label>
                                                    <input type="text" id="billing_address">
                                                </div>
                                                <div id="billing_state_form" class="tm-form-field tm-form-field" style="display:none;">
                                                    <label for="billing_state">State</label>
                                                    <select name="state" id="billing_state" style="display:block">
                                                          <option selected="selected">- Please Choose A State - </option>
                                                          <option value="AL">Alabama</option>
                                                          <option value="AK">Alaska</option>
                                                          <option value="AZ">Arizona</option>
                                                          <option value="AR">Arkansas</option>
                                                          <option value="CA">California</option>
                                                          <option value="CO">Colorado</option>
                                                          <option value="CT">Connecticut</option>
                                                          <option value="DE">Delaware</option>
                                                          <option value="FL">Florida</option>
                                                          <option value="GA">Georgia</option>
                                                          <option value="HI">Hawaii</option>
                                                          <option value="ID">Idaho</option>
                                                          <option value="IL">Illinois</option>
                                                          <option value="IN">Indiana</option>
                                                          <option value="IA">Iowa</option>
                                                          <option value="KS">Kansas</option>
                                                          <option value="KY">Kentucky</option>
                                                          <option value="LA">Louisiana</option>
                                                          <option value="ME">Maine</option>
                                                          <option value="MD">Maryland</option>
                                                          <option value="MA">Massachusetts</option>
                                                          <option value="MI">Michigan</option>
                                                          <option value="MN">Minnesota</option>
                                                          <option value="MS">Mississippi</option>
                                                          <option value="MO">Missouri</option>
                                                          <option value="MT">Montana</option>
                                                          <option value="NE">Nebraska</option>
                                                          <option value="NV">Nevada</option>
                                                          <option value="NH">New Hampshire</option>
                                                          <option value="NJ">New Jersey</option>
                                                          <option value="NM">New Mexico</option>
                                                          <option value="NY">New York</option>
                                                          <option value="NC">North Carolina</option>
                                                          <option value="ND">North Dakota</option>
                                                          <option value="OH">Ohio</option>
                                                          <option value="OK">Oklahoma</option>
                                                          <option value="OR">Oregon</option>
                                                          <option value="PA">Pennsylvania</option>
                                                          <option value="RI">Rhode Island</option>
                                                          <option value="SC">South Carolina</option>
                                                          <option value="SD">South Dakota</option>
                                                          <option value="TN">Tennessee</option>
                                                          <option value="TX">Texas</option>
                                                          <option value="UT">Utah</option>
                                                          <option value="VT">Vermont</option>
                                                          <option value="VA">Virginia</option>
                                                          <option value="WA">Washington</option>
                                                          <option value="WV">West Virginia</option>
                                                          <option value="WI">Wisconsin</option>
                                                          <option value="WY">Wyoming</option>
                                                    </select>
                                                </div>
                                                <div id="billing_city_form" class="tm-form-field tm-form-fieldhalf" style="display:none;">
                                                    <label for="billing_city">City</label>
                                                    <input type="text" id="billing_city">
                                                </div>
                                                <div id="billing_zipcode_form" class="tm-form-field tm-form-fieldhalf">
                                                    <label for="billing_zipcode">Zip / Postcode</label>
                                                    <input type="text" id="billing_zipcode">
                                                </div>
                                                <div class="tm-form-field tm-form-field">
                                                    <label for="paymentform-card">Card Number*</label>
                                                    <input type="tel" maxlength="19" placeholder="xxxx-xxxx-xxxx-xxxx" id="paymentform-card">
                                                </div>
                                                <div class="tm-form-field tm-form-fieldhalf">
                                                    <label for="paymentform-expiry">Card Expiry*</label>
                                                    <input  name="paymentform-expiry" id="paymentform-expiry" type="month" min="2021-01" value="2021-01" required/>
                                                </div>
                                                <div class="tm-form-field tm-form-fieldhalf">
                                                    <label for="paymentform-securityCode">Security Number*</label>
                                                    <input type="tel" maxlength="3" placeholder="xxx" name="paymentform-securityCode" id="paymentform-securityCode"required/>
                                                </div>
                                        </div>
                                    </div>

                                    <div class="tm-checkout-submit">
                                        <div class="tm-form-inner">
                                            <div class="tm-form-field">
                                                <button id="submit_payment" type="submit" class="tm-button ml-auto">Place Order</button>
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





    <script type="text/javascript">

        var firstName = document.getElementById('billingform-firstname');
        var lastName = document.getElementById('billingform-lastname');
        var email = document.getElementById('billingform-email');
        var address = document.getElementById('billingform-address');
        var state = document.getElementById('billingform-state');
        var city = document.getElementById('billingform-city');
        var zipCode = document.getElementById('billingform-zipcode');
        var phone = document.getElementById('billingform-phone');
        var country = document.getElementById('billingform-country');
        var isNew = false;

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


        $('#paymentform-card').keyup(function () {
            var foo = $(this).val().split("-").join(""); // remove hyphens
            if (foo.length > 0) {
                foo = foo.match(new RegExp('.{1,4}', 'g')).join("-");
            }
            $(this).val(foo);
        });


        $('#submit_payment').on('click', function (e) {
            e.preventDefault();

            const name = document.getElementById('paymentform-name').value;
            const cardNum = document.getElementById('paymentform-card').value;
            const expiry = document.getElementById('paymentform-expiry').value;
            const code = document.getElementById('paymentform-securityCode').value;
            const billingForm_address = document.getElementById('billing_address');
            const billingForm_state = document.getElementById('billing_state');
            const billingForm_zip = document.getElementById('billing_zipcode');
            const billingForm_city = document.getElementById('billing_city');


            if (!name || !cardNum || !expiry || !code) return;

            const firstName = name.split(' ')[0];
            const lastName = name.split(' ')[1];


            if (!document.querySelector('#billformCheck-billingAddress').checked) {
                if (!billingForm_address.value || !billingForm_city.value || !billingForm_zip.value || !billingForm_state.value) return;
            } else {
                billingForm_address.value = document.getElementById('billingform-address').value;
                billingForm_state.value = document.getElementById('billingform-state').value;
                billingForm_zip.value = document.getElementById('billingform-zipcode').value;
                billingForm_city.value = document.getElementById('billingform-city').value;
            }

            console.log(billingForm_address.value);

            var status = "error", message = `Account Details update has failed! Please try again.`;
            var data_ = { "firstName": firstName, "lastName": lastName, "cardNum": cardNum, "expiry": expiry, "code": code, "email": email.value, "address_": address.value, "state": state.value, "city": city.value, "zip": zipCode.value, "phone": phone.value, "isNew": isNew, "billing_address": billingForm_address.value, "billing_state": billingForm_state.value, "billing_city": billingForm_city.value, "billing_zip": billingForm_zip.value };

            console.log(data_);

            $('.tm-preloader').css({ "display": "block", "z-index": "1051", "padding": "100px" });
            $('#proccessing_order').text('Processing Order...');
            $('#preOrder').css('display', 'none');

            $.ajax({
                method: 'POST',
                url: '/checkout.aspx/payment',
                contentType: 'application/json',
                data: JSON.stringify(data_),
                headers: {
                    'Accept': 'application/json, text/plain, *',
                    'Content-type': 'application/json',
                    'dataType': 'json'
                },
                success: function (data) {
                    var data = data.d;
                    console.log(data);

                    if (data) {
                        status = "success";
                        message = `Your purchase has been successfully completed!`;
                        setTimeout(function () { window.location.href = `/invoice/${data}`; }, 3000); //location.reload()
                    }

                    $('#proccessing_order').text('Process Complete!');
                    $('#preOrder').css('display', 'block').text('Back To Home Page').attr("href", "/");

                    Toast.fire({
                        type: status,
                        title: message
                    })


                },
                error: function (error) {
                    $('.tm-preloader').css({ "display": "None" });
                    Toast.fire({
                        type: "error",
                        title: "Something went wrong, please check if all information inserted is accurate."
                    })
                }
            });

        });


        function checkIfFilled() {

            var firstName = document.getElementById('billingform-firstname');
            var lastName = document.getElementById('billingform-lastname');
            var email = document.getElementById('billingform-email');
            var country = document.getElementById('billingform-country');


            if (!firstName.value || !lastName.value || !email.value) return false;



            return true;
        }

        async function runContinue() {

            var isFilled = await checkIfFilled();
            document.getElementById('products_purchasing').innerHTML = '';

            if (!isFilled) {
                return Toast.fire({
                    type: 'error',
                    position: 'center',
                    title: 'Please fill in all the fields and try again!'
                })
            }


            if (!document.querySelector('#billformCheck-billingAddress').checked) {

                $('#billing_address_form').css('display', 'block');
                $('#billing_state_form').css('display', 'block');
                $('#billing_city_form').css('display', 'block');
                $('#billing_zipcode_form').css('display', 'block');

            } else {
                $('#billing_address_form').css('display', 'none');
                $('#billing_state_form').css('display', 'none');
                $('#billing_city_form').css('display', 'none');
                $('#billing_zipcode_form').css('display', 'none');
            }


            var data_ = { state: document.getElementById('billingform-state').value };

            $.ajax({
                method: 'POST',
                url: '/checkout.aspx/getProductInformation',
                contentType: 'application/json',
                data: JSON.stringify(data_),
                headers: {
                    'Accept': 'application/json, text/plain, *',
                    'Content-type': 'application/json',
                    'dataType': 'json'
                },
                success: function (data) {
                    var data = data.d;
                    var newHtml = '';

                    data.forEach((element, index) => {
                        console.log(element, index);

                        if (element.Name && element.Price) {
                            newHtml += `<tr><td>${element.Name}</td> <td>${element.QTY}</td> <td>${element.Price}</td></tr>`;
                        }

                        if (!element.Name) {
                            document.getElementById('subTotal').innerHTML = element.Total;
                            document.getElementById('taxes').innerHTML = element.Tax;
                            document.getElementById('frieght').innerHTML = element.frieght;
                            document.getElementById('Total').innerHTML = element.TotalWTax;
                        }
                    });


                    document.getElementById('products_purchasing').insertAdjacentHTML('afterbegin', newHtml);
                },
                error: function (error) {
                    Toast.fire({
                        type: 'error',
                        position: 'center',
                        title: 'Something went wrong! Please try again'
                    })
                }
            });



            $('#exampleModal').modal('toggle');

        }

        $(window).ready(function () {
            // executes when HTML-Document is loaded and DOM is ready

            var userAddressExists = 'False';
            var userProperty = JSON.parse('<%=list_%>');


            console.log(userProperty[0]);

            if (userAddressExists) {
                Swal.fire({
                    title: 'Shipping Address?',
                    html: `<p>We found this shipping address associated to your account. 
                                Would you like to continue with this address?</p>
                            <p>${userProperty[0].Address}, ${userProperty[0].City} ${userProperty[0].State}, ${userProperty[0].Zip}</p>`,
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes'
                }).then((result) => {
                    console.log(result);
                    if (!result.value) {

                        isNew = true;
                        return Swal.fire(
                            'Canceled!',
                            'Please fill in the following information.',
                            'success'
                        )
                    }


                    firstName.value = `${userProperty[0].firstName}`;
                    lastName.value = `${userProperty[0].lastName}`;
                    email.value = `${userProperty[0].Email}`;
                    address.value = `${userProperty[0].Address}`;
                    city.value = `${userProperty[0].City}`;
                    state.value = `${userProperty[0].State}`;
                    zipCode.value = `${userProperty[0].Zip}`;
                })

            }
        });



    </script>

</asp:Content>