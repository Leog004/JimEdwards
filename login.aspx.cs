using SecurityLib;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getHeader();
    }


    protected void getHeader()
    {

    }





    public static bool UserHasLogin(string email, string password)
    {

        string passwordEncrypted = StringEncryptor.Encrypt(password);
        DataTable g = Access._G_Customer(email, passwordEncrypted);
        if (Convert.ToBoolean(g.Rows[0]["completed"]))
        {
            if (Access.LogIn(email, passwordEncrypted) != "0")
            {
                return true;
            }
        }
        else
        {
            return false;
        }

        return true;
    }


    public static bool addNewUser(string firstName, string lastName, string email, string password, string notification)
    {

        string passwordEncrypted = StringEncryptor.Encrypt(password);
        DataTable g = Access._A_Customer(firstName.ToUpper(), lastName.ToUpper(), email, passwordEncrypted, "", notification);


        return (Convert.ToBoolean(g.Rows[0]["completed"]));

    }


    public static bool resendNewPassword(string name, string email)
    {
        var names = name.Split(' ');
        string firstName = names[0], lastName = names[1];


        DataTable g = Access._G_Customer_Password(firstName, lastName, email);
            if (Convert.ToBoolean(g.Rows[0]["completed"]))
            {
                string body = HTMLEmail.SendPassword(email);
                Utilities.SendPassword(email, "Jim Edwards Bits Password Reset", body);

                return true;
            }

            return false;
    }

    [System.Web.Services.WebMethod]
    public static object getUserLogin(string email, string password)
    {       
        return UserHasLogin(email, password);
    }



    [System.Web.Services.WebMethod]
    public static object AddNewUser(string firstName, string lastName, string email, string password, string notification)
    {
        //return String.Format("firstName: {0}, lastName: {1}, email: {2}, password: {3}, notifications: {4}", firstName, lastName, email, password, notification);
        return addNewUser(firstName, lastName, email, password, notification);
    }


    [System.Web.Services.WebMethod]
    public static object resendPassword(string name, string email)
    {
        return resendNewPassword(name, email);
        //return String.Format("Name: {0}, Email: {1}", name, email);
    }


}