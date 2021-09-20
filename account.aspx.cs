using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account : System.Web.UI.Page
{
    public string Name = "";
    public string FirstName = "";
    public string LastName = "";
    public string DisplayName = "";
    public string EmailAddress = "";
    public static string Cookie = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        get_Header();
        

        if (HttpContext.Current.Request.Cookies["JIM_B_CustomerID"] != null)
        {

            string cookie = Request.Cookies["JIM_B_CustomerID"].Value;
            get_information(cookie);

            Cookie = cookie;

        }
        else
        {
            redirectToLogin();
        }
    }


    protected void get_Header()
    {

    }

    protected void redirectToLogin()
    {
        Response.Redirect("~/login.aspx");
    }

    protected void get_information(string cookie)
    {
        DataTable g = Access._G_Customer_ByCustomerID(cookie);
        if (g.Rows.Count > 0)
        {
            Name = String.Format("{0} {1}", g.Rows[0]["FirstName"].ToString(), g.Rows[0]["LastName"].ToString());


            FirstName = g.Rows[0]["FirstName"].ToString();
            LastName = g.Rows[0]["LastName"].ToString();
            EmailAddress = g.Rows[0]["EmailAddress"].ToString();
            DisplayName = g.Rows[0]["DisplayName"].ToString();

        
        }

        Label shipping = new Label(); Label billing = new Label();
        DataTable g1 = Access._G_Address_ByCustomerID(cookie);
        if(g1.Rows.Count > 0)
        {

            for(int x = 0; x < g1.Rows.Count; x++)
            {
                if(g1.Rows[x]["Type"].ToString() == "Billing" && !String.IsNullOrEmpty(g1.Rows[x]["Type"].ToString()))
                {
                    billing.Text = g1.Rows[x]["Name"].ToString() + "<br>"
                    + g1.Rows[x]["Address"].ToString() + "<br>"
                    + g1.Rows[x]["City"].ToString() + ", " + g1.Rows[x]["State"].ToString() + "<br>";
                }
                else if (g1.Rows[x]["Type"].ToString() == "Shipping" && !String.IsNullOrEmpty(g1.Rows[x]["Type"].ToString()))
                {
                    shipping.Text = g1.Rows[x]["Name"].ToString() + "<br>"
                    + g1.Rows[x]["Address"].ToString() + "<br>"
                    + g1.Rows[x]["City"].ToString() + ", " + g1.Rows[x]["State"].ToString() + "<br>";
                }
                else
                {
                    billing.Text = "No Information has been provided! </br>";
                    shipping.Text = "No Information has been provided! </br>";
                }

            }
        }
        else
        {
            billing.Text = "No Information has been provided! </br>";
            shipping.Text = "No Information has been provided! </br>";
        }


        DataTable g2 = Access._G_Order_ByCustomerID(cookie);
        if(g2.Rows.Count > 0)
        {
            Label orders = new Label();
            System.Web.Script.Serialization.JavaScriptSerializer javaScriptSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            int count = 0;

            for (int x = 0; x < g2.Rows.Count; x++)
            {
                string status = String.IsNullOrEmpty(g2.Rows[x]["Status"].ToString()) ? "In Process" : g2.Rows[x]["Status"].ToString();    
                        
                        orders.Text += "<tr>";
                        orders.Text += String.Format("<td>{0}</td> <td>{1}</td> <td>{2}</td><td>{3}</td>", g2.Rows[x]["CustomerOrderNumber"].ToString(), Convert.ToDateTime(g2.Rows[x]["DateAdded"].ToString()).ToString("MM/dd/yyyy"), status, g2.Rows[x]["Total"].ToString());
                        orders.Text += "<td><a onclick='getOrderDetails(" + javaScriptSerializer.Serialize(g2.Rows[x]["CustomerOrderNumber"].ToString()) + ", " + javaScriptSerializer.Serialize(status) + ");' href='#' class='tm-button tm-button-small'>View</a>";
                        orders.Text += "</tr>";
                 
            }
            orders_panel.Controls.Add(orders);
        }


        billing_address_panel.Controls.Add(billing);
        shipping_address_panel.Controls.Add(shipping);
        
    }


    protected void logout_serverClick(object sender, EventArgs e)
    {
        HttpCookie c_Email = new HttpCookie("JIM_B_CustomerEmail");
        HttpCookie c_Password = new HttpCookie("JIM_B_CustomerID");

        c_Email.Expires = DateTime.Now.AddDays(-1);
        c_Password.Expires = DateTime.Now.AddDays(1);

        c_Password.Value = "Logout";

        Response.Cookies.Add(c_Email);
        Response.Cookies.Add(c_Password);



        Response.Redirect("/");
    }


    public static bool updateUserAddress(string Name, string Address, string State, string City, string Zip, string Type)
    {
        DataTable u = Access._U_Customer_Address(Name, Address, State, City, Zip, Type, Cookie);
        return Convert.ToBoolean(u.Rows[0]["INSERTED"]);
    }


    public static bool updateUserAccountDetails(string firstName, string lastName, string displayName, string emailAddress)
    {
        DataTable u = Access._U_Customer_AccountDetails(emailAddress, firstName, lastName, displayName);
        return Convert.ToBoolean(u.Rows[0]["INSERTED"]);
    }

    public static object getUserOrderDetailsByOrderID(string orderID)
    {
        DataTable g = Access._G_Order_ByOrderID(orderID);
        var list = new List<Dictionary<string, object>>();
        var row = new List<Dictionary<string, object>>();
        if (g.Rows.Count > 0)
        {
           
            list.Add(new Dictionary<string, object> {
                    { "IsRow", false },
                    { "Name", g.Rows[0].Field<string>("Name") },
                    { "No_", g.Rows[0].Field<string>("No_") },
                    { "Style",  g.Rows[0].Field<string>("Style") },
                    { "Type", g.Rows[0].Field<string>("Type")},
                    { "Length",g.Rows[0].Field<string>("Length")},
                    {"MouthPiece", g.Rows[0].Field<string>("MouthPiece") },
                    {"Shipping", g.Rows[0].Field<decimal>("ShippingAmount").ToString().Trim() },
                    {"Tax", g.Rows[0].Field<decimal>("Tax").ToString().Trim() },
                    {"SubTotal", g.Rows[0].Field<decimal>("SubTotalAmount").ToString().Trim() },
                    {"Total", g.Rows[0].Field<decimal>("TotalAmount").ToString().Trim() },
                    {"Date", g.Rows[0].Field<DateTime>("DateAdded").ToString("MM/dd/yyyy") },
                    {"CustomerName", g.Rows[0].Field<string>("customerName") },
                    {"Email", g.Rows[0].Field<string>("email") },
                    {"Address", g.Rows[0].Field<string>("Address").ToUpper() },
                    {"City", g.Rows[0].Field<string>("city").ToUpper() },
                    {"Zip", g.Rows[0].Field<string>("Zip").ToUpper() },
                    {"State", g.Rows[0].Field<string>("state").ToUpper() }
            });


            for(int x = 0; x < g.Rows.Count; x++)
            {
                row.Add(new Dictionary<string, object>
                {
                    { "IsRow", true },
                    { "Name", g.Rows[x].Field<string>("Name") },
                    { "ProductNumber", g.Rows[x].Field<string>("No_") },
                    { "Style",  g.Rows[x].Field<string>("Style") },
                    { "Type", g.Rows[x].Field<string>("Type")},
                    {"MouthPiece", g.Rows[x].Field<string>("MouthPiece") },
                    {"Price", g.Rows[x].Field<decimal>("UnitPrice").ToString() },
                    { "QTY", g.Rows[x].Field<int>("UnitQuantity").ToString() },
                });
            }

            list.AddRange(row);
        }

        return list;
    }


    [System.Web.Services.WebMethod]
    public static object getOrderDetails(string OrderID)
    {
        return getUserOrderDetailsByOrderID(OrderID);
    }


    [System.Web.Services.WebMethod]
    public static object updateAccountDetails(string firstName, string lastName, string displayName, string emailAddress)
    {
        //return String.Format("Firstname: {0}, Lastname: {1}, DisplayName: {2}, EmailAddress: {3}", firstName, lastName, displayName, emailAddress);
        return updateUserAccountDetails(firstName, lastName, displayName, emailAddress);
    }


    [System.Web.Services.WebMethod]
    public static object updateAddress(string Name, string Address, string State, string City, string Zip, string Type)
    {
        //return String.Format("Name: {0}, Address: {1}, State: {2}, State: {3}, Zip: {4}, Type: {5}", Name, Address, State, City, Zip, Type);
        return updateUserAddress(Name, Address, State, City, Zip, Type);
    }

}