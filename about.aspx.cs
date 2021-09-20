using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class about : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getHeader();
        
    }

    protected void getHeader()
    {
        Label about = new Label();
        DataTable g = Access.get_Page_Content_ByPage_Location("JimEdwards About", "Header");
        if(g.Rows.Count > 0)
        {
            about.Text +=
            "<div class='tm-breadcrumb-area tm-padding-section bg-grey' data-bgimage='/images/Headers/"+g.Rows[0]["HeaderImage"].ToString()+"' data-white-overlay='2'>"
            +    "<div class='container'>"
            +        "<div class='tm-breadcrumb'>"
            +            "<h2 style='color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);'>"+g.Rows[0]["HeaderTitle"].ToString()+"</h2>"                    
            +            "<ul>"
            +                "<li><a style='color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);' href='/'>Home</a></li>"
            +                "<li style='color:#eee; text-shadow: 0px 4px 3px rgba(0,0,0,0.4),0px 8px 13px rgba(0,0,0,0.1),0px 18px 23px rgba(0,0,0,0.1);'>About</li>"
            +            "</ul>"
            +        "</div>"
            +    "</div>"
           + "</div>";

            header_panel.Controls.Add(about);
        }

    }


}