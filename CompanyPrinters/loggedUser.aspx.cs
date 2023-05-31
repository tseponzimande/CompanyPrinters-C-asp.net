using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CompanyPrinters
{
    public partial class loggedUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                string username = User.Identity.Name;
                // Use the username as needed
                // For example, you can display it on the page
                lblLoggedInUser.Text = "Logged in as: " + username;
            }
        }
    }
}