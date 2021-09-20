using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
{
    public string SubTotal;
    public string Shipping;
    public string Total;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Request.Cookies["JIM_E_CartID"] != null)
        {
            getProducts();
        }
        else
        {
            checkout_btn.InnerText = "Your Cart Is Empty";
            empty_cart.Visible = true;
        }

    }



    protected void getProducts()
    {
        string cartId = Access.GetCartID("");
        if (!String.IsNullOrEmpty(cartId))
        {
            DataTable g = Access._G_Cart_ByCartID(cartId);
            System.Web.Script.Serialization.JavaScriptSerializer javaScriptSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            //this.Controls.Add(new LiteralControl("<script>alert('" + cartId + "')</script>"));
            if (g.Rows.Count > 0)
            {
                Label products = new Label();
                for (int x = 0; x < g.Rows.Count; x++)
                {
                    string image = "/images/products/" + g.Rows[x]["No_"].ToString() + ".png";
                    string link = "/details/" + g.Rows[x]["Name"].ToString() + "/" + g.Rows[x]["No_"].ToString();

                    if (!File.Exists(@"C:\Home\JimEdwards Site\images\products\" + g.Rows[x]["No_"].ToString() + ".png"))
                    {
                        image = "/images/products/" + g.Rows[x]["No_"].ToString() + ".jpg";
                    }

                    products.Text += "<tr class='productRow_' id='" + g.Rows[x]["ShoppingCartID"].ToString() + "'>"
                               +     "<td>"
                               +        "<a href='"+link+"' class='tm-cart-productimage'>"
                               +             "<img src='"+image+"' alt='"+ g.Rows[x]["Name"].ToString() + "'>"
                               +         "</a>"
                               +     "</td>"
                               +     "<td>"
                               + "<a href='" + link + "' class='tm-cart-productname'>" + g.Rows[x]["Name"].ToString() + "</a>"
                               +     "</td>"
                               +     "<td class='tm-cart-price'>" + g.Rows[x]["Price"].ToString() + "</td>"
                               +     "<td>"
                               +         "<div class='tm-quantitybox'>"
                               +             "<input type='text' id='" + g.Rows[x]["ShoppingCartID"].ToString() + "_quantity' value='" + g.Rows[x]["Quantity"].ToString() + "'>"
                               +         "</div>"
                               +     "</td>"
                               +     "<td>"
                               +         "<span class='tm-cart-totalprice'>"+g.Rows[x]["No_"].ToString()+"</span>"
                               +     "</td>"
                               +     "<td>"
                               +         "<a href='javascript:removeProductFromCart("+javaScriptSerializer.Serialize(g.Rows[x]["ShoppingCartID"].ToString()) +")' class='tm-cart-removeproduct'><i class='ion-close'></i></a>"
                               +     "</td>"
                               + "</tr>";

                }

                SubTotal = String.Format("${0}",g.Rows[0]["ProductTotal"].ToString());


                double localTotal = 0.0;
                DataTable getShipping = Access._G_Freight(cartId);
                if(getShipping.Rows.Count > 0)
                {
                    Shipping = String.Format("${0}", getShipping.Rows[0]["Freight Cost"].ToString());
                    localTotal = Convert.ToDouble(g.Rows[0]["ProductTotal"]) + Convert.ToDouble(getShipping.Rows[0]["Freight Cost"]);
                }

                

                Total = String.Format("${0}", localTotal.ToString("0.00"));

                UserProducts_panel.Controls.Add(products);
            }
            else
            {
                checkout_btn.InnerText = "Your Cart Is Empty";
                empty_cart.Visible = true;
            }
        }
    }



    [System.Web.Services.WebMethod]
    public static bool DeleteProduct(string cartID)
    {
        DataTable d = Access._D_Cart_ByShoppingCartID(cartID.ToString());
        if (Convert.ToInt32(d.Rows[0]["rowsDeleted"]) > 0)
        {
            return true;
        }

        return false;
    }


    public class ForUpdatedProducts
    {
        public string cartID { get; set; }
        public string quantity { get; set; }
    }


    [System.Web.Services.WebMethod]
    public static bool updateProduct(List<ForUpdatedProducts> myData)
    {

        if(myData.Count > 0)
        {
            DataTable update, delete = new DataTable();

            for (int x = 0; x < myData.Count; x++)
            {
                if (Convert.ToInt32(myData[x].quantity) <= 0)
                     delete = Access._D_Cart_ByShoppingCartID(myData[x].cartID.ToString());

                else
                    update = Access._U_CartQuantity(myData[x].cartID.ToString(), myData[x].quantity.ToString());
            }

            return true;
        }

        return false;
       
    }

}