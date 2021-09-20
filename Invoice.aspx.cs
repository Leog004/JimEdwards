using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Invoice : System.Web.UI.Page
{
    public string InvoiceNo_;
    public string Name;
    public string Total;
    public string Tax;
    public string Address;
    public string City;
    public string State;
    public string Country;
    public string Zip;
    public string Phone;
    public string Subtotal;
    public string Date;
    public string Frieght;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (RouteData.Values["Order"] != null)
        {
            var order = RouteData.Values["order"].ToString();
            InvoiceNo_ = order;

            getOrderInfo(order);
        }
        else
        {
            Response.Redirect("/");
        }
    }

    protected void getOrderInfo(string order)
    {


        DataTable g = Access._G_Order_ByOrderID(order);
        if (g.Rows.Count > 0)
        {
            string firstName = String.IsNullOrEmpty(g.Rows[0]["FirstName"].ToString()) ? "" : g.Rows[0]["FirstName"].ToString();
            string lastName = String.IsNullOrEmpty(g.Rows[0]["LastName"].ToString()) ? "" : g.Rows[0]["LastName"].ToString();

            Name = firstName + " " + lastName;
            Address = g.Rows[0]["Address"].ToString();
            Zip = g.Rows[0]["Zip"].ToString();
            State = g.Rows[0]["State"].ToString();
            City = g.Rows[0]["City"].ToString();
            Phone = g.Rows[0]["Phone"].ToString();
            Tax = g.Rows[0]["Tax"].ToString();
            Total = g.Rows[0]["TotalAmount"].ToString();
            Subtotal = g.Rows[0]["SubTotalAmount"].ToString();
            Date = g.Rows[0]["DateAdded"].ToString();
            Frieght = g.Rows[0]["ShippingAmount"].ToString();

            Label oders = new Label();
            for (int x = 0; x < g.Rows.Count; x++)
            {
                oders.Text +=
                "<tr class='list-item'>" +
                    "<td data-label='No_' class='tableitem' style='text-align:left'>" + g.Rows[x]["No_"].ToString() + "</td>" +
                    "<td data-label='Quantity' class='tableitem'>" + g.Rows[x]["UnitQuantity"].ToString() + "</td>" +
                    "<td data-label='Unit Price' class='tableitem'>" + g.Rows[x]["UnitPrice"].ToString() + "</td>" +
                    "<td data-label='Total' class='tableitem'>" + g.Rows[x]["UnitTotal"].ToString() + "</td>" +
                  "</tr>";
            }

            order_panel.Controls.Add(oders);
        }
        else
        {
            Response.Redirect("/");
        }
    }
}