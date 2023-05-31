using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CompanyPrinters.NewFolder1
{
    public partial class Users : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblmsg.Text = " Displaying Page  " + (grd_users.PageIndex + 1).ToString() + "  Of  " + grd_users.PageCount.ToString();

            if (!IsPostBack)
            {
                bidingdata();
            }
        }

        private void bidingdata()
        {

            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Users", con);
                da.Fill(dt);

                if(dt.Rows.Count > 0)
                {
                    grd_users.DataSource = dt;
                    grd_users.DataBind();
                }
            }


        }

        protected void grd_users_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = int.Parse(grd_users.DataKeys[e.RowIndex].Value.ToString());
            TextBox txtfname = (TextBox)grd_users.Rows[e.RowIndex].FindControl("txt_fname");
            TextBox txtlname = (TextBox)grd_users.Rows[e.RowIndex].FindControl("txt_lname");
            TextBox txtemail = (TextBox)grd_users.Rows[e.RowIndex].FindControl("txt_email");
            TextBox txtusername = (TextBox)grd_users.Rows[e.RowIndex].FindControl("txt_username");
            TextBox txtpassword = (TextBox)grd_users.Rows[e.RowIndex].FindControl("txt_password");
            TextBox txtaddress = (TextBox)grd_users.Rows[e.RowIndex].FindControl("txt_address");
            updateUsers(id, txtfname.Text, txtlname.Text, txtemail.Text, txtusername.Text, txtpassword.Text, txtaddress.Text);
            grd_users.EditIndex = -1;
            bidingdata();

        }

        protected void grd_users_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grd_users.EditIndex = -1;
            bidingdata();
        }

        protected void grd_users_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(grd_users.DataKeys[e.RowIndex].Value.ToString());
            deleteuser(id);
            bidingdata();
        }
        protected void grd_users_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //grd_users.EditIndex = e.NewEditIndex;
            //bidingdata();

        }
        
        private void updateUsers(int id, string First_Name, string Last_Name, string email, string User_Name, string Pass_word, string address)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Users SET FirstName = '" + First_Name + "', LastName = '" + Last_Name + "', Email = '" + email
                                              + "', UserName ='" + User_Name + "',Password ='" + Pass_word + "', Address='" + address + "' WHERE UserID = " + id + "";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();
            }


        }

        private void deleteuser (int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Users WHERE UserID=" + id + "";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void grd_users_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd_users.PageIndex = e.NewPageIndex;
            bidingdata();
            e.Cancel = true;
        }

        private DataTable GetDataFromDataSource()
        {
            // Fetch data from database 
            //string connectionString = "Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True";
            string query = "SELECT UserID, FirstName, LastName, Email, UserName, Password, Address  FROM Users";
            using (SqlConnection connection = new SqlConnection(cs))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        return dt;
                    }
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchName = txtSearch.Text.Trim();



            // Fetch data from data source
            DataTable dt = GetDataFromDataSource();

            // Filter data based on sear
            DataView dv = dt.DefaultView;
            dv.RowFilter = "UserName LIKE '%" + searchName + "%'";

            // Bind filtered data to GridView
            grd_users.DataSource = dv;
            grd_users.DataBind();
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Reg.aspx");
        }
    }
}