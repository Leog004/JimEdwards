using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shop_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.RouteData.Values["type"] != null)
        {
            string type = RouteData.Values["type"].ToString() == null ? "" : RouteData.Values["type"].ToString();

            getHeader();
            getContent();
            getProducts(type); // displaying products
        }
        else
        {
            getProducts("Palate Pressure");
        }

      
    }


    protected void getHeader()
    {
        DataTable g = Access.get_Page_Content_ByPage_Location("JimEdwards ShopPage " + RouteData.Values["type"].ToString(), "Header");
        if(g.Rows.Count > 0) {

            Label headerTxt = new Label();
            headerTxt.Text =
            "<div class='tm-breadcrumb-area tm-padding-section bg-grey' data-bgimage='/images/Headers/" + g.Rows[0]["HeaderImage"].ToString() + "' data-white-overlay='2'>"
              +  "<div class='container'>"
              +      "<div class='tm-breadcrumb'>"
              + "<h2 style='color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);'>"+g.Rows[0]["HeaderTitle"].ToString()+"</h2>"
              +          "<ul>"
              + "<li><a style='color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);' href='/'>Home</a></li>"
              + "<li style='color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);'>"+g.Rows[0]["HeaderTitle"].ToString()+"</li>"
              +          "</ul>"
              +      "</div>"
              +  "</div>"
           + "</div>";


            header_panel.Controls.Add(headerTxt);

        }
    }


    protected void getContent()
    {


        DataTable g = Access.get_Page_Content_ByPage_Location("JimEdwards ShopPage " + RouteData.Values["type"].ToString(), "Content");
        if(g.Rows.Count > 0)
        {
            DataTable g1 = Access._G_Page_Content_Images_ByContentID(Convert.ToInt32(g.Rows[0]["ID"]));
            if(g1.Rows.Count > 0)
            {
                Label contentTxt = new Label();
                for(int x = 0; x < g1.Rows.Count; x++)
                {
                    contentTxt.Text += 
                        "<div class='tm-service-details clearfix'>"
                      + "<img class='mb-4' src='/images/HomeBitType/" + g1.Rows[x]["ImageURL"].ToString()+"' alt='service image'>"
                      +  "<h4>" + g1.Rows[x]["Title"].ToString() + "</h4>"
                      +  "<p>" + g1.Rows[x]["paragraph1"].ToString() + "</p>"
                      +  "<p>" + g1.Rows[x]["paragraph2"].ToString() + "</p>"
                       + "<p>" + g1.Rows[x]["paragraph3"].ToString() + "</p>"
                       + "<h6>" + g1.Rows[x]["Qoute"].ToString() + "</h6>"
                   + "</div>";
                }

                content_panel.Controls.Add(contentTxt);
            }
        }





    }


    protected void getProducts(string type)
    {
        //DataTable g = Access._G_Bits(type, style, "NULL", "NULL", "NULL");
        DataTable g = Access._G_Get_MouthPiece_ByType(type);
        if (g.Rows.Count > 0)
        {
            Label products = new Label();

            for (int x = 0; x < g.Rows.Count; x++)
            {

                products.Text += "<div class='col-lg-3 col-md-4 col-sm-6 col-12 mt-30' style='display:inline-flex; margin-bottom:25px;'>"
                                   + "<div class='tm-product text-center tm-scrollanim'>"
                                   + "<div class='tm-product-topside'>"                             
                                   + "<img src='/images/Mouthpieces/" + g.Rows[x]["Image"].ToString() + "' alt='product image'>"
                                   + "<ul class='tm-product-actions'>"
                                   + "<li><a href='/details/" + g.Rows[x]["Name"].ToString() + "/" + g.Rows[x]["No_"].ToString() + "'><i class='ion-android-search' style='margin: 0 5px;'></i>Customize</a></li>"
                                   + "</ul>"
                                   + "</div>"
                                   + "<div class='tm-product-bottomside'>"
                                   + "<h6 class='tm-product-title'><a href='/details/" + g.Rows[x]["Name"].ToString() + "/" + g.Rows[x]["No_"].ToString() + "'>" + g.Rows[x]["Name"].ToString() + "</a>"
                                   + "</h6>"
                                   //+ "<span class='tm-product-text' style='padding: 0 2px'>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </span>"
                                   //+ "<span class='tm-product-price'>$" + g.Rows[x]["Price"].ToString() + "</span>"
                                   + "</div>"
                                   + "</div>"
                                 + "</div>";
            }

            products_panel.Controls.Add(products);

        }


    }

}