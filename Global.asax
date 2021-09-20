<%@ Application Language="C#" %>

    <%@ Import Namespace="System.Web.Routing"%>
<script runat="server">

    private void RoutingData(RouteCollection routeCollection)
    {

        //PAGES
        //Response.RedirectToRoute("Home");
        routeCollection.MapPageRoute("Home", "Home", "~/Default.aspx");
        //Response.RedirectToRoute("Home", new { Id = 1 });
        routeCollection.MapPageRoute("HomeWid", "Home/{Id}", "~/Default.aspx");

  
        // SHOP ROUTES
        routeCollection.MapPageRoute("Shop Details", "Shop/page/{type}", "~/shop_details.aspx");
        routeCollection.MapPageRoute("Shop SubCategory", "Shop/{type}/{style}", "~/shop.aspx");
        routeCollection.MapPageRoute("Shop Category", "Shop/{type}", "~/shop.aspx");
        routeCollection.MapPageRoute("Shop", "Shop", "~/shop.aspx");
        routeCollection.MapPageRoute("Product Details", "Details/{name}/{no}", "~/details.aspx");

        // INVOICE ROUTE
        routeCollection.MapPageRoute("Invoice", "Invoice/{order}", "~/invoice.aspx");



        // Search ROUTES
        routeCollection.MapPageRoute("Search", "Search/", "~/search.aspx");
        routeCollection.MapPageRoute("SearchWP", "Search/{search}", "~/search.aspx");



    }



    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        RoutingData(RouteTable.Routes);

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {

        HttpUnhandledException httpUnhandledException =
        new HttpUnhandledException(Server.GetLastError().Message, Server.GetLastError());
       // Utilities.errorLog(Server.GetLastError().ToString());

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>