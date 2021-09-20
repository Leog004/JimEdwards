using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Videos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getHeader();
        getVideos();
    }

    protected void getHeader()
    {
       // DataTable g = Access.get_Page_Content_ByPage_Location("Jim","Header")
    }

    protected void getVideos()
    {
        Label videos = new Label();
        DataTable g = Access._G_videos();

        if(g.Rows.Count > 0)
        {

            for(int x = 0; x < g.Rows.Count; x++)
            {

            videos.Text +=  "<div class='col-lg-4 col-md-6 col-12 mt-50' style='float:left;'>"
                                +    "<div class='tm-blog tm-scrollanim'>"
                                 +       "<div class='tm-blog-topside'>"
                                      +  "<div class='tm-mission-video'>"
                                      +      "<img src='/images/"+g.Rows[x]["ImageURL"].ToString()+"' alt='mission image'>"
                                      +      "<a href='"+g.Rows[x]["VideoURL"].ToString()+"' class='tm-videobutton' data-fancybox>"
                                      +          "<img src='./assets/images/icons/icon-video-button.png' alt='video icon'>"
                                      +      "</a>"
                                    //+ "<a href='#' class='tm-blog-metahighlight'><i class='ion-chatbubbles'></i> View Video</a>"
                                      + "</div>"
                                      +  "</div>"
                                       + "<div class='tm-blog-content'>"
                                         + "<h6 class='tm-blog-title'><a href='#'>" + g.Rows[x]["Title"].ToString().ToUpper() + "</a></h6>"
                                            + "<p>" + g.Rows[x]["titleText"].ToString() + "</p>"
                                       + "</div>"
                                   + "</div>"
                               + "</div>";
            }

            video_panel.Controls.Add(videos);
        }

    }
}