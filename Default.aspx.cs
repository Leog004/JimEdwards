using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Newtonsoft.Json;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getHeader();
        getHomeCategories();
        getHomeAbout();
        getHomeDetailProducts();
    }

    protected void getHeader()
    {

        //linear-gradient(90deg, rgba(13,11,45,0.5998774509803921) 0%, rgba(88,88,96,0.6587009803921569) 35%, rgba(253,255,255,0.04805672268907568) 100%),

        DataTable g = Access.get_Page_Content_ByPage_Location("JimEdwards Home", "Header");
        if(g.Rows.Count > 0)
        {
            DataTable g1 = Access._G_Page_Content_Images_ByContentID(Convert.ToInt32(g.Rows[0]["ID"]));
            if(g1.Rows.Count > 0)
            {
                Label slider = new Label();
                slider.Text += "<div class='tm-heroslider-area bg-grey'>"
                   + "<div class='tm-heroslider-slider'>";

                for(int x = 0; x < g1.Rows.Count; x++)
                {
                    slider.Text +=
                        "<div class='tm-heroslider' style='background-image:url(./Images/HomePage/" + g1.Rows[x]["ImageURL"].ToString() + ")'>"
                          + "<div class='container'>"
                           + "<div class='row align-items-center'>"
                            + "<div class='col-lg-10 col-md-8 order-2 order-md-1'>"
                             + "<div class='tm-heroslider-contentwrapper'>"
                              + "<div class='tm-heroslider-content'>"
                               + "<h1 style='color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);'>" + g1.Rows[x]["Title"].ToString() + "</h1>"
                                + "<p style='color:#eee; font-size:28px; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);'>" + g1.Rows[x]["TitleText"].ToString() + "</p>";

                    if (!String.IsNullOrEmpty(g1.Rows[x]["ButtonText"].ToString())) {
                        slider.Text += "<a href='" + g1.Rows[x]["ButtonURL"].ToString() + "' class='tm-button'>" + g1.Rows[x]["ButtonText"].ToString() + "</a>";
                            }
                    slider.Text += "</div>"
                                  +      "</div>"
                                 +   "</div>"
                              +  "</div>"
                           + "</div>"
                       + "</div>";
                }

                slider.Text += "</div>" 
                        +"<div class='tm-heroslider-pagination'>"
                        +    "<svg viewBox='0 0 33.83098862 33.83098862' xmlns='http://www.w3.org/2000/svg'>"
                        +        "<circle class='radialbg' cx='16.9' cy='16.9' r='15.9'></circle>"
                        +        "<circle class='radialactive' cx='16.9' cy='16.9' r='15.9' stroke-dasharray='33.333333333333336 100'>"
                        +        "</circle>"
                        +    "</svg>"
                        +    "<div class='slides-numbers'>"
                        +        "<span class='active'>1</span>/<span class='total'></span>"
                        +    "</div>"
                        +"</div>"

                        +"<ul class='tm-heroslider-social'>"
                        +    "<li><a href='#'><i class='ion-social-facebook'></i></a>"
                        +        "<span class='tm-heroslider-social-tooltip'>Facebook</span>"
                        +    "</li>"
                        +    "<li><a href='#'><i class='ion-social-youtube'></i></a>"
                        +        "<span class='tm-heroslider-social-tooltip'>Youtube</span>"
                        +    "</li>"
                       + "</ul>"
                    +"</div>";

                heroSlider.Controls.Add(slider);
            }        
        }
    }


    protected void getHomeCategories()
    {
        DataTable g = Access.get_Page_Content_ByPage_Location("JimEdwards Home", "Category");
        Label category = new Label();
        if (g.Rows.Count > 0)
        {
            category.Text +=
            "<div id='tm-service-area' class='tm-section tm-service-area tm-padding-section bg-white'>"
              + " <div class='container'>"
              +      "<div class='row justify-content-center'>"
              +          "<div class='col-xl-7 col-lg-8 col-md-9 col-12'>"
              +              "<div class='tm-sectiontitle text-center'>"
              +                  "<h2>"+g.Rows[0]["Title"].ToString()+"</h2>"
              +                   "<img src='/Images/newImages/TitleIllustration.jpg' alt='section divider' style='width:100px; margin: 10px 0;'>"
              +              "</div>"
              +          "</div>"
              +      "</div>"
              +      "<div class='row mt-30-reverse'>";

            DataTable g1 = Access._G_Page_Content_Images_ByContentID(Convert.ToInt32(g.Rows[0]["ID"]));
            if (g1.Rows.Count > 0)
            {

                for(int x = 0; x < g1.Rows.Count; x++)
                {

                    category.Text +=
                        "<div class='"+g1.Rows[x]["outer-col-class"].ToString()+" mt-30'>"
                     +       "<div class='tm-service text-center tm-scrollanim'>"
                      +          "<div class='tm-service-inner'>"
                       +             "<div class='tm-service-frontside' data-bgimage='/Images/newImages/"+g1.Rows[x]["ImageURL"].ToString()+"'>"
                        +                "<h6>" + g1.Rows[x]["Title"].ToString() + "</h6>"
                         +           "</div>"
                          +          "<div class='tm-service-backside'>"
                           +             "<h6><a href='" + g1.Rows[x]["ButtonURL"].ToString() + "'>" + g1.Rows[x]["Title"].ToString() + "</a></h6>"
                            +            "<p>"+g1.Rows[x]["TitleText"]+"</p>"
                             +           "<a href='" + g1.Rows[x]["ButtonURL"].ToString() + "' class='tm-readmore'>" + g1.Rows[x]["ButtonText"].ToString() + "</a>"
                             +       "</div>"
                             +   "</div>"
                           + "</div>"
                       + "</div>";

                }
            }
            category.Text += "</div></div></div>";
        }

        service_panel.Controls.Add(category);
    }


    protected void getHomeAbout()
    {
        DataTable g = Access.get_Page_Content_ByPage_Location("JimEdwards Home", "About");
        Label about = new Label();
        if (g.Rows.Count > 0)
        {
            about.Text += 
            "<section id='tm-about-area' class='tm-section tm-about-area tm-padding-section bg-white'>"
               + "<div class='container'>"
               +     "<div class='row align-items-center'>"
               +         "<div class='col-lg-6 col-12 order-2 order-lg-1'>"
               +             "<div class='tm-about-content tm-scrollanim'>"
               +                 "<h6>"+g.Rows[0]["Title"].ToString()+"</h6>"
               +                 "<h3>"+g.Rows[0]["subTitle"].ToString()+"</h3>"
               +                 "<p>"+g.Rows[0]["paragraph1"].ToString()+"</p>"
               +                 "<p>"+g.Rows[0]["paragraph2"].ToString()+"</p>"
               +                 "<a href='"+g.Rows[0]["buttonURL"].ToString()+"' class='tm-button'>"+g.Rows[0]["buttonText"].ToString()+"</a>"
               +             "</div>"
               +         "</div>"
               +         "<div class='col-lg-6 col-12 order-1 order-lg-2'>"
               +             "<div class='tm-mission-video'>"
               +                 "<img src='https://jimedwardsbits.com/Images/"+g.Rows[0]["ContentImageURL"].ToString()+ "' alt='" + g.Rows[0]["Title"].ToString() + "'>"
               +                 "<a href='"+g.Rows[0]["YoutubeURL"].ToString()+"' class='tm-videobutton' data-fancybox>"
               +                     "<img src='./assets/images/icons/icon-video-button.png' alt='video icon'>"
               +                 "</a>"
               +             "</div>"
               +         "</div>";



            about.Text += "</div></div></section>";
            about_panel.Controls.Add(about);
        }

    }


    protected void getHomeDetailProducts()
    {
        DataTable g = Access.get_Page_Content_ByPage_Location("JimEdwards Home", "SubCategory");
        Label subCategories = new Label();
        if (g.Rows.Count > 0)
        {
            subCategories.Text += "<div  class='tm-section tm-feature-area tm-padding-section bg-white' data-bgimage='https://jimedwardsbits.com/Images/Testimonial%20bg.jpg' data-white-overlay='8' style='background-image: url(https://jimedwardsbits.com/Images/Testimonial%20bg.jpg);/* opacity: 1; */'>"
               + "<div class='container'>"
               +     "<div class='row justify-content-end mt-30-reverse'>";
            DataTable g1 = Access._G_Page_Content_Images_ByContentID(Convert.ToInt32(g.Rows[0]["ID"]));
            if (g1.Rows.Count > 0)
            {
                for(int x = 0; x < g1.Rows.Count; x++)
                {
                   subCategories.Text +=     "<div class='"+g1.Rows[x]["outer-col-class"].ToString()+" mt-10'>"
                         +   "<div class='tm-feature text-center tm-scrollanim scrollanim-action'>"
                         +       "<a href='"+g1.Rows[x]["buttonURL"].ToString()+"'>"
                         +       "<span class='tm-feature-icon'>"
                         +           "<img src='/images/Products/"+g1.Rows[x]["ImageURL"].ToString()+"' alt='feature icon'>"
                         +       "</span>"
                         +       "<div class='tm-feature-content'>"
                         +           "<h6>"+g1.Rows[x]["Title"].ToString()+"</h6>"
                         +           "<p style='color: #808080;'>"+g1.Rows[x]["TitleText"].ToString()+"</p>"
                         +       "</div>"
                         +       "</a>"
                         +   "</div>"
                       + "</div>";
                }
            }

            subCategories.Text += "</div></div></div>";

            features_panel.Controls.Add(subCategories);
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