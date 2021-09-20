using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using MessageBird;
using System.Threading.Tasks;
using System.ServiceModel.Web;
using MessageBird.Net;

public partial class checkout : System.Web.UI.Page
{
    public string SubTotal;
    public string Total;
    public string Taxes;

    public string Name, Address, City, State, Zip, FirstName, LastName, Email;

    public bool userHasAddress = false;
    public string list_;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Request.Cookies["JIM_E_CartID"] != null)
        {

            if (noItemsInCart(HttpContext.Current.Request.Cookies["JIM_E_CartID"].Value)) Response.Redirect("/");

            if (String.IsNullOrEmpty(HttpContext.Current.Request.Cookies["JIM_E_CartID"].Value) || HttpContext.Current.Request.Cookies["JIM_E_CartID"].Value == "")
            {
                this.Controls.Add(new LiteralControl("<script>alert('You have no items in your cart')</script>"));
            }

            if (HttpContext.Current.Request.Cookies["JIM_B_CustomerID"] != null)
            {
                DataTable g = Access._G_Address_ByCustomerID(HttpContext.Current.Request.Cookies["JIM_B_CustomerID"].Value);
                if(g.Rows.Count > 0)
                {
                    userHasAddress = true;

                    for(int x = 0; x < g.Rows.Count; x++)
                    {
                        if(g.Rows[x]["Type"].ToString() == "Shipping")
                        {
                            string firstname = g.Rows[x]["firstName"].ToString(), lastName = g.Rows[x]["lastName"].ToString();

                            if (!String.IsNullOrEmpty(g.Rows[x]["Name"].ToString()))
                            {
                                if(g.Rows[x]["Name"].ToString().Contains(" "))
                                {
                                    firstname = g.Rows[x]["Name"].ToString().Split(' ')[0];
                                    lastName = g.Rows[x]["Name"].ToString().Split(' ')[1];
                                }
                            }

                            var list = new List<Dictionary<string, object>>();
                            list.Add(new Dictionary<string, object>
                            {
                                {"firstName" , firstname },
                                {"lastName" , lastName },
                                {"Email" , g.Rows[x]["EmailAddress"].ToString() },
                                { "Address",  g.Rows[x]["Address"].ToString()},
                                { "City", g.Rows[x]["City"].ToString()},
                                { "State", g.Rows[x]["State"].ToString() },
                                {"Zip", g.Rows[x]["Zip"].ToString() },
                                {"Phone", g.Rows[x]["Zip"].ToString() }
                            });

                            list_ = (new JavaScriptSerializer()).Serialize(list);

                        }
                    }

                }
                
            }

        }
        else
        {

            HttpCookie c_Password = new HttpCookie("JIM_B_CustomerID");
            c_Password.Expires = DateTime.Now.AddDays(1);
            c_Password.Value = "NoItems";
            Response.Cookies.Add(c_Password);

            Response.Redirect("/");
        }


        //string link = "http://google.com";

        //MessageBirdApi messageBirdApi = new MessageBirdApi("Payment", String.Format("Your purhase has been proccessed. Click on the link to view your order! {0}", link), 9562834035);

        //var sendingMessage = messageBirdApi.SendMessageToCustomer();

        //if (sendingMessage)
        //{
        //   this.Controls.Add(new LiteralControl("<script>console.log("+ messageBirdApi.getMessageStatus() +")</script>")); 
        //}

    }

    private bool noItemsInCart(string cookie)
    {

        DataTable g = Access._G_Cart_ByCartID(cookie);
        if (g.Rows.Count <= 0) 
        {
            HttpCookie c_Password = new HttpCookie("JIM_B_CustomerID");
            c_Password.Expires = DateTime.Now.AddDays(1);
            c_Password.Value = "NoItems";
            Response.Cookies.Add(c_Password);


            return true; 
        } 

        return false;
    }


    public static string getNewCustomerID(string firstName, string Lastname, string email, string password, string phone)
    {
        DataTable g = Access._A_Customer(firstName, Lastname, email, "", phone, "False");
        return g.Rows[0]["ID"].ToString();
    }



    [System.Web.Services.WebMethod]
    public static object payment(string firstName, string lastName, string cardNum, string expiry, string code, string email, string address_, string state, string city, string zip, string phone, bool isNew, string billing_address, string billing_state, string billing_city, string billing_zip)
    {

        // Getting Customer ID, If customer is not logged in, then you will create a new ID for the current Customer (getNewCustomerID)
        var customerid = HttpContext.Current.Request.Cookies["JIM_B_CustomerID"] != null ?
                HttpContext.Current.Request.Cookies["JIM_B_CustomerID"].Value :
                getNewCustomerID(firstName, lastName, email, "", phone);

        // Add Address
        var cartId = Access.GetCartID("");
        Address address = new Address("", "", "", "", "", "", "");
        Address shipping_address = new Address("", "", "", "", "", "", "");
        Address billing_address_ = new Address("", "", "", "", "", "", "");
        DataTable a1 = new DataTable(), gTax = new DataTable(), a2 = new DataTable();
        string ShippingState = state, ShippingAddress = "";
        double shipping = 0, subtotal = 0, tax = 0, productTotal = 0;

        if (!string.IsNullOrEmpty(cartId))
        {
            DataTable getAddress = Access._G_Address_ByCustomerID(customerid);

            shipping_address = new Address(firstName + " " + lastName,  address_, "", city.ToUpper(), zip, state.ToUpper(), phone);
            billing_address_ = new Address(firstName + " " + lastName, billing_address, "", billing_city, billing_zip, billing_state, phone);

            Console.WriteLine("{0}", shipping_address.phone);


            a1 = Access._A_Address(customerid, "Shipping", firstName + " " + lastName, address_, "", city.ToUpper(), state.ToUpper(), zip.ToUpper(), phone);
            a2 = Access._A_Address(customerid, "Billing", firstName + " " + lastName, billing_address, "", billing_city.ToUpper(), billing_state.ToUpper(), billing_zip.ToUpper(), phone);
            
            DataTable getProducts = Access._G_Cart_ByCartID(cartId);
            if(getProducts.Rows.Count > 0)
            {
                
                subtotal = Convert.ToDouble(getProducts.Rows[0]["SubTotal"]);

                productTotal = Convert.ToDouble(getProducts.Rows[0]["productTotal"]);

                DataTable gfreight = Access._G_Freight(cartId);
                shipping = Convert.ToDouble(gfreight.Rows[0]["Freight Cost"]);

                gTax = Access._G_Tax(state);
                tax = (Convert.ToDouble(gTax.Rows[0]["Tax"]) * productTotal);

            }
        }

        
       
        // Get Items From Cart

        DataTable getItemsFromCart = Access._G_Cart_ByCartID(cartId);
        List<WebItem> items = new List<WebItem>();

        if (getItemsFromCart.Rows.Count > 0)
        {
            for (int x = 0; x < getItemsFromCart.Rows.Count; x++)
            {
                WebItem item = new WebItem(getItemsFromCart.Rows[x]["No_"].ToString(), (decimal)getItemsFromCart.Rows[x]["Price"], (int)getItemsFromCart.Rows[x]["Quantity"]);
                items.Add(item);
            }
        }

        WebItem item1 = new WebItem("461200", Convert.ToDecimal(shipping), 1);
        items.Add(item1);

        // Submit Payment

        // getting year and month from expiry variable
        string getYear = expiry.Split('-')[0];
        string getMonth = expiry.Split('-')[1];

        string newYear = String.Format("{0}{1}", getYear[2], getYear[3]);
        //return String.Format("Address: {0}, {1}, Items: {2}, CardNum: {3}, Month: {4}, Year: {5}, State: {6}", address, address, items, cardNum, getMonth, getYear, ShippingState);
        string orderNumber = "";

        try
        {
            orderNumber = Access.createNavSalesOrder(billing_address_, shipping_address, items, cardNum, getMonth, newYear, ShippingState);
            DataTable add = Access._A_ToOrder(cartId, customerid, orderNumber,
            Convert.ToInt32(a2.Rows[0]["ID"]), Convert.ToInt32(a1.Rows[0]["ID"]), productTotal, shipping, 0, tax, 0, 0, "");
        }
        catch (Exception ex)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();            
            return js.Serialize(ex.Message);
        }


        try
        {
            HttpCookie c_Cart = new HttpCookie("JIM_E_CartID");
            c_Cart.Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Cookies.Add(c_Cart);
        }
        catch (Exception ex)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(ex.Message);
        }

       

        try
        {
            string body = HTMLEmail.SendOrderDetails(email, orderNumber, a2.Rows[0]["ID"].ToString(), a1.Rows[0]["ID"].ToString());
            Utilities.SendCustomerMessage(email, "Jim Edwards - Thank you for your purchase.", body);

        }catch(Exception ex)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(ex.Message);
        }

        return orderNumber;
        return String.Format("FirstName: {0}, LastName: {1}, CardNum: {2}, Expiry: {3}, Code:{4}, Customer ID: {5}, Cart ID: {6}, Month: {7}, Year: {8}, Address: {9}", firstName, lastName, cardNum, expiry, code, customerid, cartId, getMonth, getYear, address);
    }


    [System.Web.Services.WebMethod]
    public static object getProductInformation(string state)
    {

        string cartId = Access.GetCartID("");
        var list = new List<Dictionary<string, object>>();

        if (!String.IsNullOrEmpty(cartId))
        {
            DataTable g = Access._G_Cart_ByCartID(cartId);
            if (g.Rows.Count > 0)
            {
                

                for (int x = 0; x < g.Rows.Count; x++)
                {

                    list.Add(new Dictionary<string, object> {
                        { "Name",  g.Rows[x]["Name"].ToString()},
                        { "Price", g.Rows[x]["Price"].ToString() },
                        { "QTY", g.Rows[x]["Quantity"].ToString() }
                    });

                }

                DataTable gTax = Access._G_Tax(state);
                DataTable gfreight = Access._G_Freight(cartId);
                double shipping = Convert.ToDouble(gfreight.Rows[0]["Freight Cost"]);
                   
                double productTotal = 0;
                double tax = 0;
                if (gTax.Rows.Count > 0)
                { 
                    productTotal = Convert.ToDouble(g.Rows[0]["ProductTotal"]) + (Convert.ToDouble(gTax.Rows[0]["Tax"]) * Convert.ToDouble(g.Rows[0]["ProductTotal"]) + shipping);
                    tax = (Convert.ToDouble(gTax.Rows[0]["Tax"]) * Convert.ToDouble(g.Rows[0]["ProductTotal"]));
                }
                var subTotal = new List<Dictionary<string, object>>();
                subTotal.Add(new Dictionary<string, object>
                {
                    { "Total" ,   g.Rows[0]["ProductTotal"].ToString()},
                    { "Tax" ,   String.Format("{0:F2}", tax)},
                    { "frieght" ,   String.Format("{0:F2}", shipping)},
                    { "TotalWTax", String.Format("{0:F2}", productTotal)}
                });

                list.InsertRange(list.Count, subTotal);
                
            }
        }


        return list;
    }




    //public void CreateMessage()
    //{
    //    const string YourAccessKey = "DnSfA00BxAVs3HS4mX3K4nSJ0"; // your access key here.
    //    const long Msisdn = 9562834035; // your phone number here.

    //    MessageBird.Net.ProxyConfigurationInjector.IProxyConfigurationInjector proxyConfigurationInjector = null; // for no web proxies, or web proxies not requiring authentication
    //    Client client = Client.CreateDefault(YourAccessKey, proxyConfigurationInjector);

    //    try
    //    {
    //        MessageBird.Objects.Message message = client.SendMessage("MessageBird", "Tjirp tjirp", new[] { Msisdn });
    //        this.Controls.Add(new LiteralControl("<script>console.log(" + message + ")</script>"));
    //    }
    //    catch (MessageBird.Exceptions.ErrorException e)
    //    {
    //        // Either the request fails with error descriptions from the endpoint.
    //        if (e.HasErrors)
    //        {
    //            foreach (MessageBird.Objects.Error error in e.Errors)
    //            {
    //                string errorMessage = String.Format("code: {0} description: '{1}' parameter: '{2}'", error.Code, error.Description, error.Parameter);
    //                this.Controls.Add(new LiteralControl("<script>console.log(" + errorMessage + ")</script>"));
                    
    //            }
    //        }
    //        // or fails without error information from the endpoint, in which case the reason contains a 'best effort' description.
    //        if (e.HasReason)
    //        {
    //            this.Controls.Add(new LiteralControl("<script>console.log(" + e.Reason + ")</script>"));

    //        }
    //    }

       
    //}








}







//protected void getInformation()
//{

//    string cartId = Access.GetCartID("");
//    if (!String.IsNullOrEmpty(cartId))
//    {
//        DataTable g = Access._G_Cart_ByCartID(cartId);
//        System.Web.Script.Serialization.JavaScriptSerializer javaScriptSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();

//        if(g.Rows.Count > 0)
//        {
//            Label products = new Label();
//            for(int x = 0; x < g.Rows.Count; x++)
//            {
//                products.Text += "<tr>" +
//                    "<td>"+g.Rows[x]["Name"].ToString()+"</td>" +
//                    "<td>" + g.Rows[x]["Price"].ToString() + "</td>" +
//                    "</tr>";
//            }

//            SubTotal = String.Format("${0}", g.Rows[0]["ProductTotal"].ToString());
//            Total = String.Format("${0}", g.Rows[0]["ProductTotal"].ToString());

//            DataTable gTax = Access._G_Tax("TX");
//            Taxes = String.Format("${0}", Convert.ToDouble(gTax.Rows[0]["Tax"]) * Convert.ToDouble(g.Rows[0]["ProductTotal"]));

//            double productTotal = Convert.ToDouble(g.Rows[0]["ProductTotal"]) + (Convert.ToDouble(gTax.Rows[0]["Tax"]) * Convert.ToDouble(g.Rows[0]["ProductTotal"]));

//            Total = productTotal.ToString();

//            //products_panel.Controls.Add(products);
//        }
//    }


//}
//protected void hasBillingInformation()
//{
//    if (HttpContext.Current.Request.Cookies["JIM_B_CustomerID"] != null)
//    {
//        var cookie = Request.Cookies["JIM_B_CustomerID"].Value;
//        DataTable g = Access._G_Address_ByCustomerID(cookie);
//        if (g.Rows.Count > 0)
//        {
//            for(int x = 0; x < g.Rows.Count; x++)
//            { 
//                if(g.Rows[x]["Type"].ToString() == "Billing")
//                {
//                    Name = g.Rows[x]["Name"].ToString();
//                    //Address = g.Rows[x]["Address"].ToString();
//                    //City = g.Rows[x]["City"].ToString();
//                    //State = g.Rows[x]["State"].ToString();
//                    //Zip = g.Rows[x]["Zip"].ToString();
//                    //Email = g.Rows[x]["EmailAddress"].ToString();

//                    if (Name.Contains(""))
//                    {
//                        //FirstName = Name.Split(' ')[0];
//                        //LastName = Name.Split(' ')[1];
//                    }

//                }
//            }
//        }
//    }
//}


















