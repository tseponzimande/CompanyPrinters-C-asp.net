using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace CompanyPrinters.NewFolder2
{
    public partial class gridUsers : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {        
              lblmsg.Text = " Displaying Page  " + (gvData.PageIndex + 1).ToString() + "  Of  " + gvData.PageCount.ToString();
            if(!IsPostBack)
            {
                bidingdata();
                DataTable dt = GetDataFromProcedure();
                ViewState["dt"] = dt;
                BindGridData();
            }
        }

        //This code underneath is for Biding data
        private void bidingdata()
        {
            string query = @"SELECT users.UserID, Users.FirstName, Users.LastName, Designations.DesignationName, Users.Email, Users.UserName, Users.Password, Users.Address
                            FROM[dbo].Users, [dbo].Designations
                            WHERE Users.DesignationID = Designations.DesignationID
                            ORDER BY Users.FirstName";

            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvData.DataSource = dt;
                    gvData.DataBind();
                }
            }


        }

        //protected void btnUpdate_Click(object sender, EventArgs e)
        //{
        //    //validations
        //    if (string.IsNullOrEmpty(txt_firstname.Text.Trim()))
        //    {
        //        lblfnames.Text = "Required Field";
        //        return;
        //    }
        //    else if (string.IsNullOrEmpty(txt_lastname.Text.Trim()))
        //    {
        //        lbllnames.Text = "Required Field";
        //        return;
        //    }
        //    else if (string.IsNullOrEmpty(txt_email.Text.Trim()))
        //    {
        //        lblemails.Text = "Required Field";
        //    }
        //    else if (string.IsNullOrEmpty(txt_username.Text.Trim()))
        //    {
        //        lblusernames.Text = "Required Field";
        //    }
        //    else if (string.IsNullOrEmpty(txt_password.Text.Trim()))
        //    {
        //        lblpasswords.Text = "Requierd Field";
        //    }
        //    else if (string.IsNullOrEmpty(searchBox.Text.Trim()))
        //    {
        //        lbladdresses.Text = "Requierd Field";
        //    }


        //    SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
        //    con.Open();
        //    string query = "UPDATE Users SET FirstName = '" + FName.Text + "', LastName='" + LName.Text + "', Email = '" + Email.Text + "', UserName = '" + UserName.Text
        //               + "', Password ='" + Password.Text + "', Address ='" + Address.Text + "' WHERE UserID = " + lblID.Text + "";
        //    //string query = "UPDATE Printers SET Printers.PrinterName = '" + txtPrinterName.Text + "',PrinterMakes.PrinterMake = '" + drplsPrintermake.SelectedValue + "', Printers.FolderToMonitor = '" + txtFolderToMonitor.Text + "', Printers.OutputType = '" + txtOutputType.Text
        //    //                                 + "', Printers.FileOutput ='" + txtFileOutput.Text + "', Printers.Active ='" + txtActive.Text + "', Printers.CreateTimeStamp ='" + Convert.ToDateTime(txtCreateTimeStamp.Text) + " FROM Printers JOIN PrinterMakes ON Printers.PrinterMakeID = PrinterMakes.PrinterMakeID  WHERE Printers.EngenPrintersID =" + lblPrinterID.Text + "";



        //    SqlCommand cmd = new SqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("@FirstName", FName.Text);
        //    cmd.Parameters.AddWithValue("@LastName", LName.Text);
        //    cmd.Parameters.AddWithValue("@Email", Email.Text);
        //    cmd.Parameters.AddWithValue("@UserName", UserName.Text);
        //    cmd.Parameters.AddWithValue("@Password", Password.Text);
        //    cmd.Parameters.AddWithValue("@Address", Address.Text);
        //    cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(lblID.Text));
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //    lblID.Text = lblID.Text + " Details Updated Successfully ";
        //    //Response.Write("<script>alert('Successfully Updated')</script>");
        //    //lblPrinterID.ForeColor = Color.Green;
        //    bidingdata();
        //}
        protected void imgbtn_Click(object sender, ImageClickEventArgs e)
        {
            //string con = "Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True";
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
            DataSet ds = new DataSet();
            //drplsPMake.ClearSelection();



            ImageButton btndetails = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
            //string query = "SELECT * FROM Users WHERE UserID = @UserID";
            string query = @"SELECT users.UserID, Users.FirstName, Users.LastName, Designations.DesignationID, Users.Email, Users.UserName, Users.Password, Users.Address
                            FROM [dbo].Users, [dbo].Designations
                            WHERE Users.DesignationID = Designations.DesignationID";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@UserID", int.Parse(gvData.DataKeys[gvrow.RowIndex].Value.ToString()));

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds);
            //string text = ds.Tables[0].Rows[0][0].ToString();
            lblID.Text = gvData.DataKeys[gvrow.RowIndex].Value.ToString();
            FName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
            drplstDesi.SelectedValue = ds.Tables[0].Rows[0]["DesignationID"].ToString();
            LName.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
            Email.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            UserName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
            Password.Text = ds.Tables[0].Rows[0]["Password"].ToString();
            Address.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            this.ModalPopupExtender1.Show();
            bidingdata();






            //ImageButton btndetails = sender as ImageButton;
            //GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
            //lblID.Text = gvData.DataKeys[gvrow.RowIndex].Value.ToString();
            ////lblID.Text = gvrow.Cells[0].Text;
            //FName.Text = gvrow.Cells[1].Text;
            ////drplsPMake.Items.FindByText(gvrow.Cells[2].Text).Selected = true;
            //LName.Text = gvrow.Cells[2].Text;
            //Email.Text = gvrow.Cells[3].Text;
            //UserName.Text = gvrow.Cells[4].Text;
            //Password.Text = gvrow.Cells[5].Text;
            //Address.Text = gvrow.Cells[6].Text;
            //this.ModalPopupExtender1.Show();
        }

        protected DataTable GetDataFromProcedure()
        {
            string connectionString = "Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);

            //string query = "SELECT * FROM Users";
            string query = @"SELECT users.UserID, Users.FirstName, Users.LastName, Designations.DesignationName, Users.Email, Users.UserName, Users.Password, Users.Address
                            FROM[dbo].Users, [dbo].Designations
                            WHERE Users.DesignationID = Designations.DesignationID
                            AND Users.UserID = UserID";

            SqlCommand command = new SqlCommand(query, connection);
            //command.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            return dt;
        }


        protected void BindGridData()
        {
            gvData.DataSource = ViewState["dt"] as DataTable;
            gvData.DataBind();
        }

        protected void OnDataBound(object sender, EventArgs e)
        {
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            for (int i = 1; i < 8; i++)
            {
                TableHeaderCell cell = new TableHeaderCell();
                TextBox txtboxSearch = new TextBox();
                txtboxSearch.Attributes["placeholder"] = gvData.Columns[i].HeaderText;
                txtboxSearch.CssClass = "search_textbox";
                cell.Controls.Add(txtboxSearch);
                row.Controls.Add(cell);
            }
            gvData.HeaderRow.Parent.Controls.AddAt(1, row);
        }

        //protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    int id = int.Parse(gvData.DataKeys[e.RowIndex].Value.ToString());
        //    TextBox txtfname = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_fname");
        //    TextBox txtlname = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_lname");
        //    TextBox txtemail = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_email");
        //    TextBox txtusername = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_username");
        //    TextBox txtpassword = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_password");
        //    TextBox txtaddress = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_address");
        //    updateUsers(id, txtfname.Text, txtlname.Text, txtemail.Text, txtusername.Text, txtpassword.Text, txtaddress.Text);
        //    gvData.EditIndex = -1;
        //    bidingdata();
        //}

        //protected void gvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    gvData.EditIndex = -1;
        //    bidingdata();
        //}

        protected void gvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(gvData.DataKeys[e.RowIndex].Value.ToString());
            deleteuser(id);
            bidingdata();
        }

        //protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    gvData.EditIndex = e.NewEditIndex;
        //    bidingdata();
        //}

        //private void updateUsers(int id, string First_Name, string Last_Name, string email, string User_Name, string Pass_word, string address)
        //{
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        string query = "UPDATE Users SET FirstName = '" + First_Name + "', LastName = '" + Last_Name + "', Email = '" + email
        //                                      + "', UserName ='" + User_Name + "',Password ='" + Pass_word + "', Address='" + address + "' WHERE UserID = " + id + "";
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //    }


        //}

        private void deleteuser(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Users WHERE UserID=" + id + "";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void gvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvData.PageIndex = e.NewPageIndex;
            bidingdata();
            e.Cancel = true;
        }


        //This code underneath is for filtering
        private DataTable GetDataFromDataSource()
        {
            // Fetch data from database 
            //string connectionString = "Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True";
            //string query = "SELECT UserID, FirstName, LastName, Email, UserName, Password, Address  FROM Users";

            string query = @"SELECT Users.UserID, Users.FirstName, Users.LastName, Designations.DesignationName, Users.Email, Users.UserName, Users.Password, Users.Address
                            FROM[dbo].Users, [dbo].Designations
                            WHERE Users.DesignationID = Designations.DesignationID
                            ORDER BY Users.FirstName";
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
        // This code underneath is for filtering
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchName = txtFilter.Text.Trim();



            // Fetch data from data source
            DataTable dt = GetDataFromDataSource();

            // Filter data based on sear
            DataView dv = dt.DefaultView;
            dv.RowFilter = "UserName LIKE '%" + searchName + "%'";

            // Bind filtered data to GridView
            gvData.DataSource = dv;
            gvData.DataBind();

            txtFilter.Text = string.Empty;
        }

        //This code underneath is for adding a user
        protected void Button1_Click(object sender, EventArgs e)
        {
            //validations
            if (string.IsNullOrEmpty(txt_firstname.Text.Trim()))
            {
                lblfirstname.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(txt_lastname.Text.Trim()))
            {
                lbllastname.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(txt_email.Text.Trim()))
            {
                lblEmail.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(txt_username.Text.Trim()))
            {
                lblusername.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(txt_password.Text.Trim()))
            {
                lblpassword.Text = "Requierd Field";
            }
            else if (string.IsNullOrEmpty(searchBox.Text.Trim()))
            {
                lbladdress.Text = "Requierd Field";
            }


            SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
            // int IDS = drpPrinterMaker.SelectedValue;
            try
            {
                string sql = "INSERT INTO [Users] (FirstName,LastName,Email,UserName,Password,Address,DesignationID)" +
                " VALUES ('" + txt_firstname.Text + "', '" + txt_lastname.Text + "', '" + txt_email.Text + "', '" + txt_username.Text + "', '" + txt_password.Text + "','" + searchBox.Text + "','" + Drplst.SelectedValue + "')";
                SqlCommand com = new SqlCommand(sql, con);
                con.Open();
                com.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully Added')</script>");
                //Response.Redirect("~/NewFolder1/Printers.aspx");
                bidingdata();
            }
            catch (Exception exp)
            {
                Response.Write(exp.Message);
            }
            //clearing textboxes 

            txt_firstname.Text = string.Empty;
            txt_lastname.Text = string.Empty;
            txt_email.Text = string.Empty;
            txt_username.Text = string.Empty;
            txt_password.Text = string.Empty;
            searchBox.Text = string.Empty;


        }

        protected void gvData_SelectedIndexChanged(object sender, EventArgs e)
        {
            int pageSize = int.Parse(ddlPageSize.SelectedValue);
            gvData.PageSize = pageSize;
            bidingdata();
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            int pageSize = int.Parse(ddlPageSize.SelectedValue);
            gvData.PageSize = pageSize;
            bidingdata();
        }

        //The code underneath is for multi delete
        protected void multiDel_Click(object sender, EventArgs e)
        {
            int selectedRecCount = 0; // Variable to store the count of deleted records



            foreach (GridViewRow row in gvData.Rows)
            {
                if ((row.FindControl("chkxDel") as CheckBox).Checked)
                {
                    int ID = Convert.ToInt32(gvData.DataKeys[row.RowIndex].Value);
                    using (SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-JTMP973\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True"))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("DELETE FROM Users WHERE UserID=" + ID, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }



                    selectedRecCount++; // Increment the count for each deleted record
                }
            }

            this.bidingdata();



            // Display the alert with the count of deleted records
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type='text/javascript'>");
            sb.Append("alert('");
            sb.Append(selectedRecCount.ToString() + " rows deleted.');");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txt_firstname.Text.Trim()))
            {
                lblfnames.Text = "Required Field";
                //return;
            }
            else if (string.IsNullOrEmpty(txt_lastname.Text.Trim()))
            {
                lbllnames.Text = "Required Field";
                //return;
            }
            else if (string.IsNullOrEmpty(txt_email.Text.Trim()))
            {
                lblemails.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(txt_username.Text.Trim()))
            {
                lblusernames.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(txt_password.Text.Trim()))
            {
                lblpasswords.Text = "Requierd Field";
            }
            else if (string.IsNullOrEmpty(searchBox.Text.Trim()))
            {
                lbladdresses.Text = "Requierd Field";
            }


            SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
            con.Open();
            string query = "UPDATE Users SET FirstName = '" + FName.Text + "', LastName='" + LName.Text + "', DesignationID= '" + drplstDesi.SelectedValue + "', Email = '" + Email.Text + "', UserName = '" + UserName.Text
                       + "', Password ='" + Password.Text + "', Address ='" + Address.Text + "' WHERE UserID = " + lblID.Text + "";
            //string query = "UPDATE Printers SET Printers.PrinterName = '" + txtPrinterName.Text + "',PrinterMakes.PrinterMake = '" + drplsPrintermake.SelectedValue + "', Printers.FolderToMonitor = '" + txtFolderToMonitor.Text + "', Printers.OutputType = '" + txtOutputType.Text
            //                                 + "', Printers.FileOutput ='" + txtFileOutput.Text + "', Printers.Active ='" + txtActive.Text + "', Printers.CreateTimeStamp ='" + Convert.ToDateTime(txtCreateTimeStamp.Text) + " FROM Printers JOIN PrinterMakes ON Printers.PrinterMakeID = PrinterMakes.PrinterMakeID  WHERE Printers.EngenPrintersID =" + lblPrinterID.Text + "";



            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@FirstName", FName.Text);
            cmd.Parameters.AddWithValue("@LastName", LName.Text);
            cmd.Parameters.AddWithValue("@DesignationName", drplstDesi.SelectedValue);
            cmd.Parameters.AddWithValue("@Email", Email.Text);
            cmd.Parameters.AddWithValue("@UserName", UserName.Text);
            cmd.Parameters.AddWithValue("@Password", Password.Text);
            cmd.Parameters.AddWithValue("@Address", Address.Text);
            cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(lblID.Text));
            cmd.ExecuteNonQuery();
            con.Close();
            lblID.Text = lblID.Text + " Details Updated Successfully ";
            Response.Write("<script>alert('Successfully Updated')</script>");
            //lblPrinterID.ForeColor = Color.Green;
            bidingdata();
        }
    }
}


