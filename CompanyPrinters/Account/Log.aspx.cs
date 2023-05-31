using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CompanyPrinters.Account
{
    public partial class Log : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
        string str, UserName, Password;
        SqlCommand com;
        SqlDataAdapter sqlda;
        DataTable dt;
        int RowCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void submitbtn_Click(object sender, EventArgs e)
        {
          
            con.Open();
            str = "SELECT * FROM Users";
            com = new SqlCommand(str);
            sqlda = new SqlDataAdapter(com.CommandText, con);
            dt = new DataTable();
            sqlda.Fill(dt);
            RowCount = dt.Rows.Count;

        for (int i = 0; i < RowCount; i++)
            {
                UserName = dt.Rows[i]["UserName"].ToString();
                Password = dt.Rows[i]["Password"].ToString();
                if (UserName == Text_Username.Text && Password == Text_password.Text)
                {
                    Session["UserName"] = UserName;
                    if (dt.Rows[i]["DesignationID"].ToString() == "1")
                        Response.Redirect("~/Roles/Manager.aspx");
                    else if (dt.Rows[i]["DesignationID"].ToString() == "2")
                        Response.Redirect("~/Roles/Admin.aspx");
                    else if (dt.Rows[i]["DesignationID"].ToString() == "3")
                        Response.Redirect("~/Roles/user.aspx");
                }
                else
                {
                    lblError.Text = "Invalid User Name or Password! Please try again!";
                }



                //con.Open();
                //SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [Users] WHERE UserName = @UserName AND Password = @Password", con);
                //cmd.Parameters.AddWithValue("@User_Name", Text_Username);
                //cmd.Parameters.AddWithValue("@Password", Text_password);
                //SqlDataReader reader = cmd.ExecuteReader();

                //if (reader.HasRows)
                //{

                //    reader.Read();
                //    int desID = (int)reader["DesignationID"];
                //    Session["LoggedInUser"] = Text_Username;
                //    if (desID == 1)
                //    {
                //        Response.Redirect("~/Admin.aspx");
                //    }
                //    else if (desID == 2)
                //    {
                //        Response.Redirect("~/Manager.aspx");
                //    }
                //    else if (desID == 3)
                //    {
                //        Response.Redirect("~/user.aspx");
                //    }
                //}
                //else
                //{
                //    lblError.Text = "Error I";
                //}

                //reader.Close();
                //con.Close();

            }
        }
    }
}
