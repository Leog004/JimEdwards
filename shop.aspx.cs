using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices;
using System.ServiceModel.Channels;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shop : System.Web.UI.Page
{
    public string Type_ = "";
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Page.RouteData.Values["type"] != null && Page.RouteData.Values["style"] != null)
        {
            string type = RouteData.Values["type"].ToString() == null ? "" : RouteData.Values["type"].ToString();
            string style = RouteData.Values["style"].ToString() == null ? "" : RouteData.Values["style"].ToString();

            getHeader(type, style); // getting header and passing subcategory and category query strings
            getTypes(); // displaying categories and passing our category query string
            getProducts(type, style, true); // displaying products
            getPopularProducts();
        }
        else
        {

            if (Page.RouteData.Values["Type"] != null)
            {
                DataTable g = Access._G_All_Types();
                if(g.Rows.Count > 0)
                {
                    for(int x = 0; x < g.Rows.Count; x++)
                    {
                        if(g.Rows[x]["Name"].ToString() == RouteData.Values["type"].ToString())
                        {
                            getProducts(Page.RouteData.Values["Type"].ToString(), "NULL", Convert.ToBoolean(g.Rows[x]["isMouthPieceProduct"]));
                        }
                    }
                }

                Type_ = RouteData.Values["type"].ToString();
            }
            else
            {
                getCategories();
            }

            
            getTypes();
            getPopularProducts();
        }


    }


    protected void getHeader(string type, string style)
    {

      

    }

    protected void getCategories()
    {
        DataTable g = Access._G_All_Types_New_Sort(0);
        if(g.Rows.Count > 0)
        {
            Label products = new Label();
            string link = "", inImage = "";
            for (int x = 0; x < g.Rows.Count; x++) {

              link = "/shop/" + g.Rows[x]["Name"].ToString();
                if (Convert.ToInt32(g.Rows[x]["productCount"]) <= 1) link = "/details/" + g.Rows[x]["Name"].ToString() + "/" + g.Rows[x]["No_"].ToString();


                inImage = Convert.ToBoolean(g.Rows[x]["HasDetailPage"]) ?
                                   "<li><a href='/Shop/Page/" + g.Rows[x]["Name"].ToString() + "' style='padding: 0 10px;'>"
                                   + "<i class='ion-android-search' style='margin: 0 5px;'></i> Read More </a></li>"
                                   + "<li><a href='" + link + "' style='padding: 0 10px;'>"
                                   + "<i class='ion-android-cart' style='margin: 0 5px;'></i> Shop </a></li>" 
                                   : "<li><a href='" + link + "' style='padding: 0 10px;'>"
                                   + "<i class='ion-android-cart' style='margin: 0 5px;'></i> Shop </a></li>";



              products.Text += "<div class='col-lg-4 col-md-4 col-sm-6 col-12 mt-30' style='display:inline-flex;'>"
                                 +   "<div class='tm-product text-center tm-scrollanim'>"
                                 +       "<div class='tm-product-topside'>"
                                 +        "<img src='/images/Products/" + g.Rows[x]["Image"].ToString() + "' alt='product image'>"
                                 +           "<ul class='tm-product-actions'>"
                                 +            inImage
                                 +           "</ul>"
                                 +       "</div>"
                                 +       "<div class='tm-product-bottomside'>"
                                 +           "<h6 class='tm-product-title'><a href='/details/"+ g.Rows[x]["Name"].ToString() + "/"+ g.Rows[x]["Image"].ToString().Replace(".png", "") + "'>"+g.Rows[x]["Name"].ToString()+"</a>"
                                 +           "</h6>"
                                 +       "</div>"
                                 +   "</div>"
                               + "</div>";
            }

            products_panel.Controls.Add(products);
        }
    }

    protected void getTypes()
    {
        DataTable g = Access._G_All_Types_New_Sort(0);
        if (g.Rows.Count > 0)
        {
            Label sideCategory = new Label();

            for (int x = 0; x < g.Rows.Count; x++)
            {
                string link = Convert.ToInt32(g.Rows[x]["productCount"]) > 1 
                    ? "/shop/" + g.Rows[x]["Name"].ToString() 
                    : "/details/" + g.Rows[x]["name"].ToString() + "/" + g.Rows[x]["No_"].ToString();

                sideCategory.Text += "<li><a href='"+link+"'>" + g.Rows[x]["Name"].ToString() + "</a></li>";
            }


            category_panel.Controls.Add(sideCategory);    

        }
    }


    protected void getProducts(string type, string style, bool isMouthPiece)
    {
        //DataTable g = Access._G_Bits(type, style, "NULL", "NULL", "NULL");
        DataTable g = new DataTable();
        if (isMouthPiece)
        {
            g = Access._G_Get_MouthPiece_ByType(type);
        }
        else
        {
            g = Access._G_ProductsByCategory_new(type, 0);
        }


        if(g.Rows.Count > 0)
        {
            Label products = new Label();
           
            for(int x = 0; x < g.Rows.Count; x++) {

                products.Text += "<div class='col-lg-4 col-md-4 col-sm-6 col-12 mt-30' style='display:inline-flex;'>"
                                   + "<div class='tm-product text-center tm-scrollanim'>"
                                   + "<div class='tm-product-topside'>";

                if (isMouthPiece) { products.Text += "<img src='/images/Mouthpieces/" + g.Rows[x]["Image"].ToString() + "' alt='product image'>"; }
                else { products.Text += "<img src='/images/products/" + g.Rows[x]["Image"].ToString() + "' alt='product image'>"; }
                products.Text +=           "<ul class='tm-product-actions'>"
                                 +             "<li><a href='/details/" + g.Rows[x]["Name"].ToString() + "/" + g.Rows[x]["No_"].ToString() + "'><i class='ion-android-search' style='margin: 0 5px;'></i>Customize</a></li>"
                                 +           "</ul>"
                                 +       "</div>"
                                 +       "<div class='tm-product-bottomside'>"
                                 +           "<h6 class='tm-product-title'><a href='/details/"+ g.Rows[x]["Name"].ToString() + "/"+ g.Rows[x]["No_"].ToString() + "'>"+g.Rows[x]["Name"].ToString()+"</a>"
                                 +           "</h6>"
                                 + "<span class='tm-product-price'>$" + g.Rows[x]["Price"].ToString() + "</span>"
                                 +       "</div>"
                                 +   "</div>"
                               + "</div>";
            }

            products_panel.Controls.Add(products);

        }


    }




    protected void getPopularProducts()
    {


        DataTable g = Access._G_MostPopular();
        if(g.Rows.Count > 0)
        {
            Label popularProducts = new Label();
            

            for(int x = 0; x < g.Rows.Count; x++)
                popularProducts.Text += "<li>"
                                           + "<a href='/details/" + g.Rows[x]["Name"].ToString() + "/" + g.Rows[x]["No_"].ToString() + "' class='widget-popularproduct-image'>"
                                           + "<img src='/images/products/" + g.Rows[x]["No_"].ToString() + ".png' alt='product thumbnail'>"
                                           + "</a>"
                                           + "<div class='widget-popularproduct-content'>"
                                           + "<h6><a href='/details/" + g.Rows[x]["Name"].ToString() + "/" + g.Rows[x]["No_"].ToString() + "'>" + g.Rows[x]["Name"].ToString()+"</a></h6>"
                                           +     "<span>"+g.Rows[x]["price"].ToString()+"</span>"
                                           + "</div>"
                                       + "</li>";

            popularProducts_panel.Controls.Add(popularProducts);
            
        }

                                        

    }

    private bool ProductHasSalePrice(double price, double salePrice)
    {
        if (salePrice > 0 && salePrice < price) return true;

        return false;
    }



    [System.Web.Services.WebMethod]
    public static object sortProducts(string sort, string type)
    {
        List<Dictionary<string, object>> list = new List<Dictionary<string, object>>();
        if (!String.IsNullOrEmpty(type))
        {
            DataTable g = Access._G_All_Types();
            if (g.Rows.Count > 0)
            {

                for (int x = 0; x < g.Rows.Count; x++)
                {

                    if (g.Rows[x]["Name"].ToString() == type)
                    {
                        DataTable gCategory = new DataTable();
                        if (Convert.ToBoolean(g.Rows[x]["IsMouthPieceProduct"]))
                        {
                            gCategory = Access._G_ProductsByCategory_new(g.Rows[x]["Name"].ToString(), Convert.ToInt32(sort));
                        }
                        else
                        {
                            gCategory = Access._G_ProductsByCategory_new(g.Rows[x]["Name"].ToString(), Convert.ToInt32(sort));
                        }

                        if (gCategory.Rows.Count > 0)
                        {
                            for (int j = 0; j < gCategory.Rows.Count; j++)
                            {
                                list.Add(new Dictionary<string, object>
                                {
                                    {
                                        "Name", gCategory.Rows[j]["Name"].ToString()
                                    },
                                    {
                                        "No_", gCategory.Rows[j]["No_"].ToString()
                                    },
                                    {
                                        "Image", gCategory.Rows[j]["Image"].ToString()
                                    },
                                    {
                                        "Price", gCategory.Rows[j]["Price"].ToString()
                                    },
                                    {
                                        "IsMouthPiece", Convert.ToBoolean(g.Rows[x]["IsMouthPieceProduct"])
                                    }
                                });
                            }
                        }

                    }

                }
            }
        }
        else
        {
            DataTable getCategories = Access._G_All_Types_New_Sort(Convert.ToInt32(sort));
            if(getCategories.Rows.Count > 0)
            {
                for (int j = 0; j < getCategories.Rows.Count; j++)
                {
                    list.Add(new Dictionary<string, object>
                                {
                                    {
                                        "Name", getCategories.Rows[j]["Name"].ToString()
                                    },
                                    {
                                        "No_", getCategories.Rows[j]["No_"].ToString()
                                    },
                                    {
                                        "Image", getCategories.Rows[j]["Image"].ToString()
                                    },
                                    {
                                        "ProductCount", getCategories.Rows[j]["ProductCount"].ToString()
                                    },
                                    {
                                        "DetailPage", getCategories.Rows[j]["HasDetailPage"].ToString()
                                    }
                                });
                }

            }
        }

        return list;
    }


}