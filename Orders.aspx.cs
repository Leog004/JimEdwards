using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    [System.Web.Services.WebMethod]
    public static object getOrders(string email)
    {

        List<Dictionary<string, object>> list = new List<Dictionary<string, object>>();
        DataTable g = Access._G_GetOrdersBy_Email(email);

        if(g.Rows.Count > 0)
        {
            for(int x = 0; x < g.Rows.Count; x++)
            {
                list.Add(new Dictionary<string, object> {
                    { "OrderID",  g.Rows[x]["CustomerOrderNumber"].ToString()},
                    { "Date", Convert.ToDateTime(g.Rows[x]["DateAdded"].ToString()).ToString("MM/dd/yyyy") },
                    { "Status", g.Rows[x]["TrackingNumber"].ToString() },
                    { "Total", g.Rows[x]["TotalAmt"].ToString() }
                });
            }
        }

        return list;
    }
}