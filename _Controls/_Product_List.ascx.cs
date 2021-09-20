using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Controls_Product_List : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        get_products();
    }


    private void get_products()
    {

        DataTable g = Access._G_MostPopular();


        if(g.Rows.Count > 0)
        {

            Label get_popular = new Label();

            get_popular.Text = "<div id='tm-shop-area' class='tm-section tm-products-area tm-padding-section bg-white'>"
                +"<div class='container'>"
                +    "<div class='row justify-content-center'>"
                +        "<div class='col-xl-7 col-lg-8 col-md-9 col-12'>"
                +            "<div class='tm-sectiontitle text-center'>"
                +                "<h2>Most Popular</h2>"
                +                    "<img src='/Images/newImages/TitleIllustration.jpg' alt='section divider' style='width:100px; margin: 10px 0;'>"
                                //<span class="tm-sectiontitle-divider">
                                //    <img src="/Images/newImages/TitleIllustration.jpg" alt="section divider">
                                //</span>
                //+                "<p>Lorem Ipsum is a latin placeholder text commonly used to fulfill certain areas of"
                //+                    "your website or app where content is not the main concern of the developer.</p>"
                +            "</div>"
                +        "</div>"
                +    "</div>"
                +    "<div class='row tm-products-slider'>";

            for(int x = 0; x < g.Rows.Count; x++)
            {
                       

                       
                      get_popular.Text +=   "<div class='col-lg-3 col-md-4 col-sm-6 col-12'>"
                          +  "<div class='tm-product text-center tm-scrollanim'>"
                          +      "<div class='tm-product-topside'>"
                          +          "<img src='./images/products/"+g.Rows[x]["No_"].ToString()+".png' alt='product image'>"
                          +          "<ul class='tm-product-actions'>"
                          +              "<li><a href='/details/"+g.Rows[x]["Name"].ToString()+"/" + g.Rows[x]["No_"].ToString() + "'><i class='ion-android-cart' style='margin-right:12px;'></i>Customize</a></li>"
                          +          "</ul>"
                          +      "</div>"
                          +      "<div class='tm-product-bottomside'>"
                          + "<h6 class='tm-product-title'><a href='/details/" + g.Rows[x]["name"].ToString() + "/" +g.Rows[x]["No_"].ToString()+ "' >" + g.Rows[x]["name"].ToString()+"</a></h6>"
                          +          "<span class='tm-product-price'>$"+g.Rows[x]["Price"].ToString()+"</span>"
                          +      "</div>"
                         +   "</div>"
                       + "</div>";
                       
            }


            get_popular.Text += "</div>"
                + "</div>"
                + "</div>";



            Products_panel.Controls.Add(get_popular);
        }

       


    }



}