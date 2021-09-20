using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class details : System.Web.UI.Page
{

    public string Name = "";
    public string Available = "";
    public string Image = "";
    public string Style_val = "";
    public string Type = "";
    public string Price_ = "";
    public string Length_val = "";
    public string No_ = "";
    public string MouthPiece = "";
    public string CheckShop = "";
    public string Quantity = "";
    public string InStock = "*Please allow 12 weeks for delivery";
    public string ReviewCount = "";
    public string metadescription_ = "";
    public string _MetaImage = "";
    public string URL_ = "";

    public string Description = "";

    public string Description2 = "";

    protected void Page_Load(object sender, EventArgs e)
    {

         CheckShop = ConfigurationManager.AppSettings["Shopping_Button"];

        if (RouteData.Values["Name"].ToString() != null && RouteData.Values["No"].ToString() != null)
        {

            var name = RouteData.Values["Name"].ToString();
            var no_ = RouteData.Values["No"].ToString();

            No_ = no_;
            getProductDetails(name, no_);
            //getCustomerReviews(no_);
        }
       

    }


    private bool IsShoppable(string checkShop)
    {
        return (checkShop == "true"); 
    }

    protected void getProductDetails(string name, string No_)
    {

        DataTable g = Access._G_Get_MouthPiece_ByNo_(No_);
        if (g.Rows.Count > 0 && Convert.ToBoolean(g.Rows[0]["ShowOnWeb"]))
        {

            DataTable sp = Access._G_Get_MouthPiece_ByType(g.Rows[0]["Type"].ToString());
            if (sp.Rows.Count > 2) { getSimiliarProducts(sp); }

            Name = g.Rows[0]["Name"].ToString().Trim();
            Price_ = g.Rows[0]["Price"].ToString().Trim();
           
            Style_val = g.Rows[0]["Style"].ToString().Trim();
            Type = g.Rows[0]["Type"].ToString().Trim();
            Length_val = g.Rows[0]["Length"].ToString();
            MouthPiece = g.Rows[0]["Mouthpiece"].ToString();
            Image = "/images/products/" + g.Rows[0]["No_"].ToString() + ".png";

            if (!String.IsNullOrEmpty(g.Rows[0]["Description"].ToString()))
            {
                Description = g.Rows[0]["Description"].ToString();
            }

            Description2 = g.Rows[0]["Description_2"].ToString();


            //this.Controls.Add(new LiteralControl("<script>console.log('" + No_ + "," +Name + "," + Price_ + "," + Description.ToString()+"')</script>"));

            if (!File.Exists(@"C:\Home\JimEdwards Site\images\products\" + g.Rows[0]["No_"].ToString() + ".png"))
            {
                Image = "/images/products/" + g.Rows[0]["Image"].ToString();
            }

            Quantity = Convert.ToInt32(g.Rows[0]["QuantityOnHand"]).ToString();
            //InStock = Convert.ToDecimal(g.Rows[0]["QuantityOnHand"]) > 0 ?
            //    "<span class='color-theme'>In Stock</span>" : "<span style='color:red; font-weight:500'>Out Of Stock</span>";


            if (!String.IsNullOrEmpty(MouthPiece))
            {
                getProductOptions(Access._G_Get_MouthpieceStyle_ByType(MouthPiece, Type), Style_, "Style", Style_val, Style);
                getProductOptions(Access._G_Get_MouthPieceLength_ByTypeAndStyle(MouthPiece, Type, Style_val), Length_, "Length", Length_val, Length);
            }
            else
            {
                getProductOptions(Access._G_Get_ProductStyle_ByType(Name, Type), Style_, "Style", Style_val, Style);
                getProductOptions(Access._G_Get_ProductLength_ByTypeAndStyle(Name, Type, Style_val), Length_, "Length", Length_val, Length);
                getProductOptions(Access._G_GetProductTypes_ByStyle(Name, Style_val), Type_dropdown, "Type", Type, Type_div);

            }

            if (!IsShoppable(CheckShop))
            {
                shopping.Visible = false;
            }


            Price.InnerText = ProductHasSalePrice(Convert.ToDouble(g.Rows[0]["Price"].ToString()), Convert.ToDouble(g.Rows[0]["SalePrice"].ToString())) 
                ? "<del>"+ Convert.ToDouble(g.Rows[0]["SalePrice"].ToString()) + "</del>" : g.Rows[0]["Price"].ToString();


            if (String.IsNullOrEmpty(MouthPiece))
            {
                Mouthpiece.Visible = false;
            }

            _MetaImage = Image;
            metadescription_ = Description;
            URL_ = HttpContext.Current.Request.Url.AbsoluteUri;

        }
      

    }


    protected void getCustomerReviews(string no_)
    {
        DataTable getReviews = Access._G_GetReviews_ByNo_(no_);
        Label reviews = new Label();
        
        if(getReviews.Rows.Count > 0)
        {
            ReviewCount = "(" + getReviews.Rows.Count + ")";


            for(int x = 0; x < getReviews.Rows.Count; x++)
            {
                string name = "";
                DataTable getCustomerName = Access._G_Get_CustomerInformation_By_Review_No_(no_, getReviews.Rows[x]["CustomerID"].ToString());

                if(getCustomerName.Rows.Count > 0)
                {
                   name = getCustomerName.Rows[0]["FirstName"].ToString() + " " + getCustomerName.Rows[0]["LastName"].ToString();
                }

              
                string image = "/images/products/" + getReviews.Rows[0]["productNo_"].ToString() + ".png";

                if (!File.Exists(@"C:\Home\JimEdwards Site\images\products\" + getReviews.Rows[0]["productNo_"].ToString() + ".png"))
                {
                    image = "/images/products/" + getReviews.Rows[0]["productNo_"].ToString() + ".jpg";
                }

                int starRating = Convert.ToInt32(getReviews.Rows[x]["StarRating"]);

                reviews.Text += "<div class='tm-comment'>"
                    +               "<div class='tm-comment-thumb'>"
                    +                   "<img src='"+image+"' alt='author image'>"
                    +               "</div>"
                    +               "<div class='tm-comment-content' style='width:100%'>"
                    +                   "<h6 class='tm-comment-authorname'><a href='#'>"+name+"</a></h6>"
                    +                   "<span class='tm-comment-date' style='font-size:12px; font-weight:600;'>Wednesday, October 17, 2018 at 4:00PM.</span>"
                    +                   "<div class='tm-ratingbox'>";

                for(int i = 1; i <= 5; i++)
                {
                    if(starRating >= i)
                    {
                        reviews.Text += "<span class='is-active'><i class='ion-android-star'></i></span>";
                    }
                    else
                    {
                        reviews.Text += "<span><i class='ion-android-star'></i></span>";
                    }
                }
                                       
                     reviews.Text +=   "</div>"
                    +                   "<p style='margin-top:0;'>"+getReviews.Rows[x]["Text"].ToString()+"</p>"
                    +               "</div>"
                    +           "</div>";       
            }

            //review_panel.Controls.Add(reviews);
        }

        
    }


    protected void getSimiliarProducts(DataTable similiarProducts)
    {
        
        Label product = new Label();
        product.Text += "<div class='tm-similliar-products tm-padding-section-sm-top'>"
                           +     "<h4 class='small-title'>Similliar Products</h4>"
                           +     "<div class='row mt-30-reverse row-justify-center'>";
  
                                   

        for(int x = 0; x < 3; x++)
        {
            //<!-- Single Product -->
            product.Text += 
            "<div class='col-lg-4 col-md-4 col-sm-6 col-12 mt-30'>"
               + "<div class='tm-product text-center tm-scrollanim'>"
               +     "<div class='tm-product-topside'>"
                     + "<img src='/images/products/" + similiarProducts.Rows[x]["No_"].ToString() + ".png' alt='product image'>"
                     + "<ul class='tm-product-actions'>"
                         + "<li><a href='/details/"+similiarProducts.Rows[x]["Name"].ToString()+"/"+similiarProducts.Rows[x]["No_"].ToString()+"'><i class='ion-android-cart' style='margin-right:10px;'></i>Customize</a></li>"
                     + "</ul>"
               +     "</div>"
                     + "<div class='tm-product-bottomside'>"
                        + "<h6 class='tm-product-title'><a href='/details/" + similiarProducts.Rows[x]["name"].ToString() + "/" + similiarProducts.Rows[x]["No_"].ToString() + "' >" + similiarProducts.Rows[x]["name"].ToString() + "</a></h6>"
                        + "<span class='tm-product-price'>$" + similiarProducts.Rows[x]["Price"].ToString() + "</span>"
                     + "</div>"
                    + "</div>"
            + "</div>";
            //<!--// Single Product -->
        }
        product.Text +=   "</div>"
                           + "</div>";

        similiar_products_panel.Controls.Add(product);
    }

    private static bool ProductHasSalePrice(double price, double salePrice)
    {
        if (salePrice > 0 && salePrice < price) return true;

        return false;
    }



    protected static void getProductOptions(DataTable data, HtmlSelect html, string option, string value, HtmlGenericControl div)
    {

        if (data.Rows.Count > 1)
        {
            html.Items.Add(new ListItem("- SELECT YOUR " + option.ToUpper() + " -", "type_0_0"));
            div.Visible = true;

            for (int x = 0; x < data.Rows.Count; x++)
            {

                html.Items.Add(new ListItem(data.Rows[x][option].ToString(), option.ToLower() + "_" + data.Rows[x]["No_"].ToString() + "_" + data.Rows[x][option].ToString().ToUpper()));

                if (value == data.Rows[x][option].ToString())
                    html.SelectedIndex = html.Items.IndexOf(html.Items.FindByValue(option.ToLower() + "_" + data.Rows[x]["No_"].ToString() + "_" + value.ToUpper()));
            }


        }
        else
        {
            div.Visible = false;
        }
    }


    public static object getDetails(string no_)
    {
        var list = new List<Dictionary<string, object>>();

        DataTable g = Access._G_Get_MouthPiece_ByNo_(no_);
        if (g.Rows.Count > 0 && Convert.ToBoolean(g.Rows[0]["ShowOnWeb"]))
        {

            list.Add(new Dictionary<string, object> {
                    { "Name", g.Rows[0]["Name"].ToString() },
                    { "No_", g.Rows[0]["No_"].ToString() },
                    { "Style",  g.Rows[0]["Style"].ToString() },
                    { "Type", g.Rows[0]["Type"].ToString()},
                    { "Length",g.Rows[0]["Length"].ToString()},
                    { "Price",Convert.ToDecimal(g.Rows[0]["Price"])},
                    {"MouthPiece", g.Rows[0]["MouthPiece"].ToString() } }
            );


            if (!String.IsNullOrEmpty(g.Rows[0]["MouthPiece"].ToString()))
            {
                getDetailsOptions(list, Access._G_Get_MouthPieceLength_ByTypeAndStyle(g.Rows[0]["MouthPiece"].ToString(), g.Rows[0]["Type"].ToString(), g.Rows[0]["Style"].ToString()), "Length");
                getDetailsOptions(list, Access._G_Get_MouthpieceStyle_ByType(g.Rows[0]["MouthPiece"].ToString(), g.Rows[0]["Type"].ToString()), "Style");
            }
            else
            {
                getDetailsOptions(list, Access._G_Get_ProductLength_ByTypeAndStyle(g.Rows[0]["Name"].ToString(), g.Rows[0]["Type"].ToString(), g.Rows[0]["Style"].ToString()), "Length");
                getDetailsOptions(list, Access._G_Get_ProductStyle_ByType(g.Rows[0]["Name"].ToString(), g.Rows[0]["Type"].ToString()), "Style");
                getDetailsOptions(list, Access._G_GetProductTypes_ByStyle(g.Rows[0]["Name"].ToString(), g.Rows[0]["Style"].ToString()), "Type");

            }

        }

        return list;
    }


    public static void getDetailsOptions(List<Dictionary<string, object>> list, DataTable data, string Option)
    {
        if (data.Rows.Count > 0)
        {
            for (int x = 0; x < data.Rows.Count; x++)
            {

                list.Add(new Dictionary<string, object>
                    {
                        { Option ,data.Rows[x][Option].ToString()},
                        {"No_", data.Rows[x]["No_"].ToString() }
                    });
            }

        }

    }

    public static bool addProductToCart(string No_, string Name, string Quantity, string Price)
    {
        string cartId = Access.GetCartID("");

        DataTable a = Access._A_ToCart(cartId, No_, Name, Convert.ToInt32(Quantity), Convert.ToDecimal(Price));

        return true;
    }




    [System.Web.Services.WebMethod]
    public static object updateData(string data_)
    {
        return getDetails(data_);
    }




    [System.Web.Services.WebMethod]
    public static object addToCart(string No_, string Name, string Quantity, string Price)
    {
        return addProductToCart(No_, Name, Quantity, Price);
        //return String.Format("No: {0}, Name: {1}, Quantity: {2}, Price: {3}", No_, Name, Quantity, Price);
    }



    [System.Web.Services.WebMethod]
    public static bool addReview(string CustomerId, string No_, string starRating, string message)
    {
        DataTable addReview = Access._A_Review(CustomerId, No_, message, Convert.ToInt32(starRating));
        return Convert.ToBoolean(addReview.Rows[0]["completed"]);

        //return String.Format("CustomerID: {0}, No_: {1}, StarRating: {2}, Message: {3}", CustomerId, No_, starRating, message);
    }


}