using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search : System.Web.UI.Page
{
    public string ProductSearched;
    public string itemsFound = "0";

    protected void Page_Load(object sender, EventArgs e)
    {

        
        if (RouteData.Values["search"] != null)
        {
            var product = RouteData.Values["search"].ToString();
            ProductSearched = product;

            getProducts(product);
        }
        else
        {
            getProducts("");
        }

        
    }

    protected void getProducts(string product)
    {
        Label search_products = new Label();


        DataTable g = Access.get_Product_Search(product, 1, 4, 1, "1");
        if (g.Rows.Count > 0)
        {
            itemsFound = g.Rows.Count.ToString();


            search_products.Text += "<div class='row tm-products-slider'>";

            for (int x = 0; x < g.Rows.Count; x++)
            {



                search_products.Text += "<div class='col-lg-4 col-md-4 col-sm-6 col-12'>"
                    + "<div class='tm-product text-center tm-scrollanim'>"
                    + "<div class='tm-product-topside'>"
                    + "<img src='/images/products/" + g.Rows[x]["No_"].ToString() + ".png' alt='product image'>"
                    + "<ul class='tm-product-actions'>"
                    + "<li><a href='/details/" + g.Rows[x]["Name"].ToString() + "/" + g.Rows[x]["No_"].ToString() + "'><i class='ion-android-cart' style='margin-right:12px;'></i>Customize</a></li>"
                    + "</ul>"
                    + "</div>"
                    + "<div class='tm-product-bottomside'>"
                    + "<h6 class='tm-product-title'><a href='/details/" + g.Rows[x]["name"].ToString() + "/" + g.Rows[x]["No_"].ToString() + "' >" + g.Rows[x]["name"].ToString() + "</a></h6>"
                    + "<span class='tm-product-price'>$" + g.Rows[x]["Price"].ToString() + "</span>"
                    + "</div>"
                   + "</div>"
                 + "</div>";

            }
            search_products.Text += "</div>";
            search_panel.Controls.Add(search_products);
        }  
    }

    public class Search_Product
    {
        public string Name { get; set; }
        public string Category { get; set; }

        public string Image { get; set; }

        public string No_ { get; set; }

        public int Quantity { get; set; }

        public double Price { get; set; }

        public Search_Product() { }
        public Search_Product(string name, string category, string image, int quantity, string no_, double price)
        {
            Name = name;
            Category = category;
            Image = image;
            Quantity = quantity;
            No_ = no_;
            Price = price;
        }

        public static object get_search_products(string searching)
        {
            List<Search_Product> ProductList = new List<Search_Product>();
            string products = "";

            DataSet data = new DataSet();

            DataTable g = Access.get_Product_Search(searching, 1, 5, 1, "1");

            data.Tables.Add(g);

            if (data.Tables[0].Rows.Count > 0)
            {
                products = JsonConvert.SerializeObject(data.Tables[0]);
            }

            return products;
        }

    };


    [System.Web.Services.WebMethod]
    public static object searchProduct(string searching)
    {
        return Search_Product.get_search_products(searching);
    }

}