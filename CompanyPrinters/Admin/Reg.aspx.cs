using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CompanyPrinters.Account
{
    public partial class Reg : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerbtn_Click(object sender, EventArgs e)
        {

            string query = "INSERT INTO [Users] (FirstName,LastName,DesignationID,Email,UserName,Password,Address )" +
                "VALUES('" + fname.Text + "','" + lname.Text + "','" + drplstDesi.SelectedValue + "','" + email.Text + "','" + username.Text + "','" + password.Text + "','" + searchBox.Text + "')";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/Account/Log.aspx");


            fname.Text = string.Empty;
            lname.Text = string.Empty;
            email.Text = string.Empty;
            username.Text = string.Empty;
            password.Text = string.Empty;

            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            //con.Open();
            //SqlCommand com = new SqlCommand("INSERT INTO Users VALUES (@FirstName,@LastName,@Email,@UserName,@Password,@Address,@DesignationID)", con);
            //com.Parameters.AddWithValue("FirstName", fname.Text);
            //com.Parameters.AddWithValue("LastName", lname.Text);
            //com.Parameters.AddWithValue("Email", email.Text);
            //com.Parameters.AddWithValue("UserName", username.Text);
            //com.Parameters.AddWithValue("Password", password.Text);
            //com.Parameters.AddWithValue("Address", address.Text);
            //com.Parameters.AddWithValue("DesignationID", Drplst.SelectedValue);

            //com.ExecuteNonQuery();

            //con.Close();

            //Response.Redirect("~/Default.aspx");



            //fname.Text = "";
            //lname.Text = "";
            //email.Text = "";
            //username.Text = "";
            //password.Text = "";
            //address.Text = "";


        }
    }
}