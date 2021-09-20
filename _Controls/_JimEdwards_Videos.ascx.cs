using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Controls__JimEdwards_Videos : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        get_videos();
    }


    private void get_videos()
    {

        DataTable g = Access._G_videos();


        if (g.Rows.Count > 0)
        {

            Label videos = new Label();

            videos.Text += "<div id='tm-news-area' class='tm-section tm-blog-area tm-padding-section-bottom bg-pattern-transparent'>"
               + "<div class='container'>"
               +     "<div class='row justify-content-center'>"
               +         "<div class='col-xl-7 col-lg-8 col-md-9 col-12'>"
               +             "<div class='tm-sectiontitle text-center'>"
               +                 "<h2>Latest Videos</h2>"
               +                  "<img src='/Images/newImages/TitleIllustration.jpg' alt='section divider' style='width:100px; margin: 10px 0;'>"
               //+                 "<p>Lorem Ipsum is a latin placeholder text commonly used to fulfill certain areas of"
               //+                     "your website or app where content is not the main concern of the developer.</p>"
               +             "</div>"
               +         "</div>"
               +     "</div>"
               +     "<div class='row tm-blog-slider'>";


            for (int x = 0; x < g.Rows.Count; x++)
            {

                      videos.Text +=  "<div class='col-lg-4'>"
                          +  "<div class='tm-blog tm-scrollanim'>"
                          +      "<div class='tm-blog-topside'>"
                          +  "<div class='tm-mission-video'>"
                          +      "<img src='/images/"+g.Rows[x]["ImageURL"].ToString()+"' alt='mission image'>"
                          +      "<a href='"+g.Rows[x]["VideoURL"].ToString()+"' class='tm-videobutton' data-fancybox>"
                          +          "<img src='./assets/images/icons/icon-video-button.png' alt='video icon'>"
                          +      "</a>"
                          +  "</div>"
                          +          "<a href='#' class='tm-blog-metahighlight'><i class='ion-chatbubbles'></i> View Video</a>"
                          +      "</div>"
                          +      "<div class='tm-blog-content'>"
                          + "<h6 class='tm-blog-title'><a href='blog-details.html'>" + g.Rows[x]["Title"].ToString().ToUpper() + "</a></h6>"
                          //+          "<ul class='tm-blog-meta'>"
                          //+ "<li><a href='#'><i class='ion-android-person'></i> " + g.Rows[x]["HostName"].ToString() + "</a></li>"
                          //+ "<li><i class='ion-android-calendar'></i> " + g.Rows[x]["DateUploaded"].ToString() + "</li>"
                          //+          "</ul>"
                          +         "<p>" + g.Rows[x]["titleText"].ToString() + "</p>"
                          //+          "<a href='#' class='tm-readmore'>View more</a>"
                          +      "</div>"
                          +  "</div>"
                      + "</div>";



            }


            videos.Text += "</div>" +
                "</div>" +
                "</div>";

            video_panel.Controls.Add(videos);
        }

       


    }



}