<%@ Control Language="C#" AutoEventWireup="true" CodeFile="_JimEdwards_Navigation.ascx.cs" Inherits="_Controls_JimEdwards_Navigation" %>


<style>

        #login_mobile, #username_mobile, #logOut_mobile{
            display: none;
        }

        #search_appear{
            position: absolute; width: 500px; left: -180px; top: 35px; display:inline-block;
        }

    @media only screen and (max-width: 750px) {
        #login_mobile, #username_mobile, #logOut_mobile{
            display: inline-block;
        }

        #login_, #username_, #logOut_, #search_appear, .tm-header-searchtrigger{
            display:none !important;
        }

        #search_appear{
            width:100%;
        }

        .tm-header-utils {
            margin-left: unset; 
            padding-left: 0;
            margin-bottom: 0;
        }
    }
</style>

         <!-- Header -->
 <div class="tm-header tm-header-sticky">

            <div class="tm-header-bottomarea">
                <div class="container">
                    <div class="tm-header-inner">
                        <a href="/" class="tm-header-logo">
                            <img src="/images/newImages/JElogoblbk.jpg" alt="malic">
                        </a>
                        <nav class="tm-header-nav">
                            <ul>
                                <%--<li><a href="/">Home</a></li>--%>
                                <li><a href="/shop.aspx">Shop</a></li>
                                <li><a href="/about.aspx">About</a></li>
                                <li><a href="/videos.aspx">Jim Says</a></li>
                                <li ClientIDMode="Static" runat="server" id="login_mobile"><a href="/login.aspx">Log In</a></li>
                                <li ClientIDMode="Static" runat="server" id="username_mobile" visible="false"><a href="/account.aspx"><%=Name %></a></li>
                                <li ClientIDMode="Static" runat="server" id="logOut_mobile" visible="false" ><a href="#" runat="server" onclick="logout();" onserverclick="logout_serverClick">Log Out</a></li> 

                            </ul>
                        </nav>
                        <ul class="tm-header-utils">
                            <li>
                                <button class="tm-header-searchtrigger"><i class="ion-android-search"></i></button>
                                <div class="tm-header-searchform">
                                    <input type="text" placeholder="Search" id="search_textbox">
                                    <button onclick="search_page()" type="submit"><i class="ion-android-search"></i></button>
                                    <div id="search_appear"></div>
                                </div>
                            </li>
                                <li ClientIDMode="Static" runat="server" id="login_"><a style="display: inline-block; padding: 15px 0; color: #111111; font-family: 'Hind', sans-serif; font-weight: 600; font-size: 16px;" href="/login.aspx">Log In</a></li>
                                <li ClientIDMode="Static" runat="server" id="username_" visible="false"><a style="display: inline-block; padding: 15px 0; color: #111111; font-family: 'Hind', sans-serif; font-weight: 600; font-size: 16px; text-decoration: underline #ccc;" href="/account.aspx"><%=Name %></a></li>
                                <li ClientIDMode="Static" runat="server" id="logOut_" visible="false" ><a style="display: inline-block; padding: 15px 0; color: #111111; font-family: 'Hind', sans-serif; font-weight: 600; font-size: 16px;" href="#" runat="server" onclick="logout();" onserverclick="logout_serverClick">Log Out</a></li>   
                            <li><a href="/cart.aspx"><span id="cart_span" runat="server" class="ion-android-cart mycart"></span></a></li>                     
                        </ul>
                        <div class="tm-mobilenav"></div>
                    </div>
                </div>
            </div>

        </div>       
        <!--// Header -->


<script type="text/javascript">


    const setCookie = (cookieKey, cookieValue, expirationDays) => {
        let expiryDate = '';

        if (expirationDays) {
            const date = new Date();

            date.setTime(`${date.getTime()}${(expirationDays || 30 * 24 * 60 * 60 * 1000)}`);

            expiryDate = `; expiryDate=" ${date.toUTCString()}`;
        }

        document.cookie = `${cookieKey}=${cookieValue || ''}${expiryDate}; path=/`;

        return document.cookie;
    }


    async function logout() {
        let jim_email = await setCookie("JIM_B_CustomerEmail", "", -1);
        let jim_id = await setCookie("JIM_B_CustomerID", "Logout", -1);

        if (jim_email && jim_id)
            window.location.href = '/';
    }


    const searchTextBox = document.querySelector('#search_textbox');

    function signOut(){

        setTimeout(function(){ 

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
                type: 'warning',
                title: 'Signed Out Successfully'
            })

        }, 1000);
    }


    function noItems() {
        setTimeout(function () {

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
                type: 'warning',
                title: 'No Items In Cart'
            })

        }, 1000);
    }


    if (searchTextBox) {
        document.getElementById("search_textbox").addEventListener("keyup", event => {

            var list = document.getElementById('search_appear');


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

        var list = document.getElementById('search_appear');
        const position = "beforeend";
        
        $.ajax({
            method: 'POST',
            url: 'Default.aspx/searchProduct',
            contentType: 'application/json',
            data: '{searching:"' + searching + '"}',
            headers: {
                'Accept': 'application/json, text/plain, */*',
                'Content-type': 'application/json'
            },
            success: function (data) {          
                var data = JSON.parse(data.d);
                console.log(data);
                //var data = data.d;
                list.innerHTML = "";
                data.forEach(function (item, key) {
                    if (item.Name) {
                        const show_item = `<a href='/details/${item.Name.trim()}/${item.No_.trim()}'><li class="list-group-item d-flex justify-content-between align-items-center">
                                        ${item.Name} <img src='/images/products/${item.Image}' style='width:40px; margin-left:20px;'>
                                        <span class="badge badge-primary badge-pill">Price: $${item.Price}</span>
                                      </li></a>`
                        list.insertAdjacentHTML(position, show_item);
                    }
                });
            },
            error: function (error) { console.log(error); }
        });
    }


    function search_page() {
        var txt = document.getElementById('search_textbox').value
        window.location.href = `/search/${txt}`;
    }


</script>