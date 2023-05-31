using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;

namespace CompanyPrinters.Roles
{
    public partial class Admin : System.Web.UI.Page
    {
        //string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            

            lblmsg.Text = " Displaying Page  " + (gvData.PageIndex + 1).ToString() + "  Of  " + gvData.PageCount.ToString();

            if (!IsPostBack)
            {
                bidingdata();
            }
        }

        private void bidingdata()
        {

            //SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
            string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                             FROM [dbo].[Printers],[dbo].[PrinterMakes]
                             WHERE Printers.PrinterMakeID = PrinterMakes.PrinterMakeID
                             ORDER BY Printers.EngenPrintersID DESC";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvData.DataSource = dt;
            gvData.DataBind();
            //DataTable dt = new DataTable();

            //using (SqlConnection con = new SqlConnection(cs))
            //{
            //    //SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Printers", con);
            //    string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
            //                    FROM [dbo].[Printers],[dbo].[PrinterMakes]
            //                    WHERE Printers.PrinterMakeID = PrinterMakes.PrinterMakeID";
            //    SqlDataAdapter da = new SqlDataAdapter(query, con);

            //    da.Fill(dt);

            //    if (dt.Rows.Count > 0)
            //    {
            //        gvData.DataSource = dt;
            //        gvData.DataBind();
            //    }
            //}


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(PName.Text.Trim()))
            {
                lblprinterName.Text = "Required Field";
                
            }
            else if (string.IsNullOrEmpty(FolderM.Text.Trim()))
            {
                lblFolderM.Text = "Required Field";
             
            }
            else if (string.IsNullOrEmpty(Output.Text.Trim()))
            {
                lblOutputType.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(File.Text.Trim()))
            {
                lblFileOutput.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(Status.SelectedValue.Trim()))
            {
                lblrblActive.Text = "Requierd Field";
            }

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
            con.Open();
            //SqlCommand cmd = new SqlCommand("UPDATE [Printers] SET FirstName=@FirstName,LastName=@LastName, City=@City,Designation=@Designation where UserId=@UserId", con);
            string query = "UPDATE Printers SET PrinterName = '" + PName.Text + "', PrinterMakeID='" + drplsPMake.SelectedValue + "', FolderToMonitor = '" + FolderM.Text + "', OutputType = '" + Output.Text
            + "', FileOutput ='" + File.Text + "', Active ='" + Status.SelectedValue + "', CreateTimeStamp ='" + Convert.ToDateTime(Time.Text) + "' WHERE EngenPrintersID = " + lblID.Text + "";
            //string query = "UPDATE Printers SET Printers.PrinterName = '" + txtPrinterName.Text + "',PrinterMakes.PrinterMake = '" + drplsPrintermake.SelectedValue + "', Printers.FolderToMonitor = '" + txtFolderToMonitor.Text + "', Printers.OutputType = '" + txtOutputType.Text
            //                                 + "', Printers.FileOutput ='" + txtFileOutput.Text + "', Printers.Active ='" + txtActive.Text + "', Printers.CreateTimeStamp ='" + Convert.ToDateTime(txtCreateTimeStamp.Text) + " FROM Printers JOIN PrinterMakes ON Printers.PrinterMakeID = PrinterMakes.PrinterMakeID  WHERE Printers.EngenPrintersID =" + lblPrinterID.Text + "";


            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@PrinterName", PName.Text);
            cmd.Parameters.AddWithValue("@PrinterMakeID", drplsPMake.SelectedValue);
            cmd.Parameters.AddWithValue("@FolderToMonitor", FolderM.Text);
            cmd.Parameters.AddWithValue("@OutputType", Output.Text);
            cmd.Parameters.AddWithValue("@FileOutput", File.Text);
            cmd.Parameters.AddWithValue("@Active", Status.Text);
            cmd.Parameters.AddWithValue("@CreateTimeStamp", Time.Text);
            cmd.Parameters.AddWithValue("@EngenPrintersID", Convert.ToInt32(lblID.Text));
            cmd.ExecuteNonQuery();
            con.Close();
            lblID.Text = lblID.Text + " Details Updated Successfully";
            //lblPrinterID.ForeColor = Color.Green;
            Response.Write("<script>alert('Successfull Updated')</script>");
            bidingdata();
            //ScriptManager.RegisterStartupScript(Page, this.GetType(), "Alert", "alert('User Successfully updated')", true);


            //SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
            //con.Open();
            ////SqlCommand cmd = new SqlCommand("UPDATE [Printers] SET FirstName=@FirstName,LastName=@LastName, City=@City,Designation=@Designation where UserId=@UserId", con);
            //string query = "UPDATE Printers SET PrinterName = '" + PName.Text + "', PrinterMakeID='" + drplsPMake.SelectedValue + "', FolderToMonitor = '" + FolderM.Text + "', OutputType = '" + Output.Text
            //                                + "', FileOutput ='" + File.Text + "', Active ='" + Status.SelectedValue + "', CreateTimeStamp ='" + Convert.ToDateTime(Time.Text) + "' WHERE EngenPrintersID = " + lblID.Text + "";
            ////string query = "UPDATE Printers SET Printers.PrinterName = '" + txtPrinterName.Text + "',PrinterMakes.PrinterMake = '" + drplsPrintermake.SelectedValue + "', Printers.FolderToMonitor = '" + txtFolderToMonitor.Text + "', Printers.OutputType = '" + txtOutputType.Text
            ////                                 + "', Printers.FileOutput ='" + txtFileOutput.Text + "', Printers.Active ='" + txtActive.Text + "', Printers.CreateTimeStamp ='" + Convert.ToDateTime(txtCreateTimeStamp.Text) + " FROM Printers JOIN PrinterMakes ON Printers.PrinterMakeID = PrinterMakes.PrinterMakeID  WHERE Printers.EngenPrintersID =" + lblPrinterID.Text + "";

            //SqlCommand cmd = new SqlCommand(query, con);
            //cmd.Parameters.AddWithValue("@PrinterName", PName.Text);
            //cmd.Parameters.AddWithValue("@PrinterMake", drplsPMake.SelectedValue);
            //cmd.Parameters.AddWithValue("@FolderToMonitor", FolderM.Text);
            //cmd.Parameters.AddWithValue("@OutputType", Output.Text);
            //cmd.Parameters.AddWithValue("@FileOutput", File.Text);
            //cmd.Parameters.AddWithValue("@Active", Status.SelectedValue);
            //cmd.Parameters.AddWithValue("@CreateTimeStamp", Time.Text);
            //cmd.Parameters.AddWithValue("@EngenPrintersID", Convert.ToInt32(lblID.Text));
            //cmd.ExecuteNonQuery();
            //con.Close();
            //lblID.Text = lblID.Text + " Details Updated Successfully";
            //lblID.ForeColor = Color.Green;
            //bidingdata();
        }

        protected void imgbtn_Click(object sender, ImageClickEventArgs e)
        {

            DataSet ds = new DataSet();
            drplsPMake.ClearSelection();



            ImageButton btndetails = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;

            //string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
            //                 FROM [dbo].[Printers],[dbo].[PrinterMakes]
            //                 WHERE Printers.PrinterMakeID = PrinterMakes.PrinterMakeID
            //                 ORDER BY Printers.CreateTimeStamp DESC";

            string query = "SELECT * FROM Printers WHERE EngenPrintersID = @ENgenPrintersID";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@EngenPrintersID", int.Parse(gvData.DataKeys[gvrow.RowIndex].Value.ToString()));

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds);
            //string text = ds.Tables[0].Rows[0][0].ToString();
            lblID.Text = gvData.DataKeys[gvrow.RowIndex].Value.ToString();
            PName.Text = ds.Tables[0].Rows[0]["PrinterName"].ToString();
            drplsPMake.Items.FindByValue(ds.Tables[0].Rows[0]["PrinterMakeID"].ToString()).Selected = true;
            FolderM.Text = ds.Tables[0].Rows[0]["FolderToMonitor"].ToString();
            Output.Text = ds.Tables[0].Rows[0]["OutputType"].ToString();
            File.Text = ds.Tables[0].Rows[0]["FileOutput"].ToString();
            Status.SelectedValue = ds.Tables[0].Rows[0]["Active"].ToString();
            Time.Text = ds.Tables[0].Rows[0]["CreateTimeStamp"].ToString();
            this.ModalPopupExtender1.Show();
            bidingdata();

            //drplsPMake.ClearSelection();

            //ImageButton btndetails = sender as ImageButton;
            //GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
            //lblID.Text = gvData.DataKeys[gvrow.RowIndex].Value.ToString();
            ////lblID.Text = gvrow.Cells[0].Text;
            //PName.Text = gvrow.Cells[1].Text;
            //drplsPMake.Items.FindByText(gvrow.Cells[2].Text).Selected = true;
            //FolderM.Text = gvrow.Cells[3].Text;
            //Output.Text = gvrow.Cells[4].Text;
            //File.Text = gvrow.Cells[5].Text;
            //Status.SelectedValue = gvrow.Cells[6].Text;
            //Time.Text = gvrow.Cells[7].Text;
            //this.ModalPopupExtender1.Show();




            //drplsPMake.ClearSelection();

            //ImageButton btndetails = sender as ImageButton;
            //GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
            //lblID.Text = gvData.DataKeys[gvrow.RowIndex].Value.ToString();
            //PName.Text = gvrow.Cells[2].Text;
            ////drplsPMake.Items.FindByText(gvrow.Cells[3].Text).Selected = true;
            //drplsPMake.SelectedItem.Text = gvrow.Cells[3].Text;
            //FolderM.Text = gvrow.Cells[4].Text;
            //Output.Text = gvrow.Cells[5].Text;
            //File.Text = gvrow.Cells[6].Text;
            //Status.SelectedValue = gvrow.Cells[7].Text;
            //Time.Text = gvrow.Cells[8].Text;
            //this.ModalPopupExtender1.Show();
        }
        //protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    int id = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
        //    TextBox txtPrintername = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_printerName");
        //    TextBox txtPrinterMake = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_printerMake");
        //    TextBox txtFolderToMonitor = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_folderToMonitor");
        //    TextBox txtOutputType = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_OutputType");
        //    TextBox txtFileOutput = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_FileOutput");
        //    TextBox txtActive = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_active");
        //    TextBox txttime = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_CreateTimeStamp");
        //    updatePrinters(id, txtPrintername.Text, txtFolderToMonitor.Text, txtOutputType.Text, txtFileOutput.Text, txtActive.Text, txttime.Text);
        //    gvData.EditIndex = -1;
        //    bidingdata();
        //}

        //protected void gvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    gvData.EditIndex = -1;
        //    bidingdata();
        //}

        //protected void gvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    int id = int.Parse(gvData.DataKeys[e.RowIndex].Value.ToString());
        //    deletePrinter(id);
        //    bidingdata();
        //}

        //protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    gvData.EditIndex = e.NewEditIndex;
        //    bidingdata();
        //}
        //private void updatePrinters(int id, string Printer_Name, string Folder_To_Monitor, string Output_Type, string File_Output, string active, string time)
        //{
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        string query = "UPDATE Printers SET PrinterName = '" + Printer_Name + "', FolderToMonitor = '" + Folder_To_Monitor + "', OutputType = '" + Output_Type
        //                                      + "', FileOutput ='" + File_Output + "', Active ='" + active + "', CreateTimeStamp ='" + time + "' WHERE EngenPrintersID = " + id + "";
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //    }


        //}
        //private void deletePrinter(int id)
        //{
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        string query = "DELETE FROM Printers WHERE EngenPrintersID =" + id + "";
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //    }
        //}
        protected DataTable GetDataFromProcedure()
        {
            string connectionString = "Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);

            string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                            FROM [dbo].[Printers],[dbo].[PrinterMakes]
                            WHERE Printers.PrinterMakeID = PrinterMakes.PrinterMakeID
                            ORDER BY Printers.CreateTimeStamp DESC";

            SqlCommand command = new SqlCommand(query, connection);
            //command.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            bidingdata();
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
        //This code underneath is for adding a printer
        protected void Button1_Click(object sender, EventArgs e)
        {
            // int IDS = drpPrinterMaker.SelectedValue;

            //Validations
            if (string.IsNullOrEmpty(txtPrinterName.Text.Trim()))
            {
                lblprinterName.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(txtFolderToMonitor.Text.Trim()))
            {
                lblFolderM.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(txtOutputType.Text.Trim()))
            {
                lblOutputType.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(txtFileOutput.Text.Trim()))
            {
                lblFileOutput.Text = "Required Field";
            }
            else if (string.IsNullOrEmpty(rblActive.SelectedValue.Trim()))
            {
                lblrblActive.Text = "Requierd Field";
            }

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");

            try
            {
               
                string sql = "INSERT INTO [Printers] (PrinterName,PrinterMakeID,FolderToMonitor,OutputType,FileOutput,Active,CreateTimeStamp )" +
                    " VALUES ('" + txtPrinterName.Text + "', '" + drpPrinterMaker.SelectedValue + "', '" + txtFolderToMonitor.Text + "', '" + txtOutputType.Text + "', '" + txtFileOutput.Text + "','" + rblActive.SelectedValue + "','" + DateTime.Now + "')";
                    SqlCommand com = new SqlCommand(sql, con);
                    con.Open();
                    com.ExecuteNonQuery();
                    con.Close();
                Response.Write("<script>alert('Successfully Added')</script>");
                bidingdata();
                //Response.Redirect("~/NewFolder1/Printers.aspx");
                //}
                //Bind the filtered data to the GridView

            }
            catch (Exception exp)
            {
                Response.Write(exp.Message);
            }

            //clearing textboxes 

            txtPrinterName.Text = string.Empty;
            txtFolderToMonitor.Text = string.Empty;
            txtFileOutput.Text = string.Empty;
            txtOutputType.Text = string.Empty;
        }

        //this code underneath is for filtering data using dropdown and dates
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            // 1. Create a database connection
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");

            if (string.IsNullOrEmpty(txtStartDate.Text.Trim()))
            {
                lblstartdate.Text = "Required Field";
                
            }
            else if (string.IsNullOrEmpty(txtEndDate.Text.Trim()))
            {
                lblenddate.Text = "Required Field";
             
            }
            
            try
            {

                //3.Get the selected value and dates
                string selectedValue = drpdownprinter.SelectedItem.Text;
                DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
                DateTime endDate = Convert.ToDateTime(txtEndDate.Text);

                // Construct a query or filter expression that includes the selected date range
                //string query = "SELECT * FROM Printers WHERE CreateTimeStamp BETWEEN @StartDate AND @EndDate";
                string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, 
                            Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                            FROM Printers,PrinterMakes
                            WHERE (Printers.CreateTimeStamp BETWEEN @StartDate AND @EndDate) AND PrinterMakes.PrinterMake = @selectedValue 
                            ORDER BY Printers.CreateTimeStamp ASC";

                //string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName, PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                //        FROM [dbo].Printers, [dbo].PrinterMakes
                //        WHERE (Printers.CreateTimeStamp BETWEEN @startDate AND @endDate) AND PrinterMakes.PrinterMake = @selectedValue ";
                con.Open();
                SqlCommand cmd2 = new SqlCommand(query, con);
                cmd2.Parameters.AddWithValue("@selectedValue", selectedValue);
                cmd2.Parameters.AddWithValue("@StartDate", startDate);
                cmd2.Parameters.AddWithValue("@EndDate", endDate);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd2);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                con.Close();
                //Bind the filtered data to the GridView
                gvData.DataSource = dt;
                gvData.DataBind();

            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);
            }
}

        // The following code is for clearing the dropdown and textboxes
        protected void BtnClear_Click(object sender, EventArgs e)
        {
            //System.Threading.Thread.Sleep(1000);

            txtStartDate.Text = string.Empty;
            txtEndDate.Text = string.Empty;
            drpdownprinter.SelectedIndex = 0;
            ViewState["dt"] = Get();
            bidingdata();
        }

        protected void Clearbtn_Click(object sender, EventArgs e)
        {
            txtPrinterName.Text = string.Empty;
            drpPrinterMaker.SelectedIndex = 0;
            txtFolderToMonitor.Text = string.Empty;
            txtOutputType.Text = string.Empty;
            rblActive.Items.Clear();
           
            ViewState["dt"] = Get();
            bidingdata();
        }

        protected DataTable Get()
        {
            string connectionString = "Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True";

            SqlConnection connection = new SqlConnection(connectionString);

            string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                            FROM[dbo].[Printers],[dbo].[PrinterMakes]
                            WHERE Printers.PrinterMakeID = PrinterMakes.PrinterMakeID
                            ORDER BY Printers.CreateTimeStamp DESC";

            SqlCommand command = new SqlCommand(query, connection);

            SqlDataAdapter adapter = new SqlDataAdapter(command);

            DataTable dt = new DataTable();

            adapter.Fill(dt);
           
            return dt;


        }

        private void deletePrinter(int id)
        {
            string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Printers WHERE EngenPrintersID =" + id + "";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                bidingdata();
            }
        }

        protected void gvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvData.PageIndex = e.NewPageIndex;
            bidingdata();
            e.Cancel = true;
        }

        protected void gvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(gvData.DataKeys[e.RowIndex].Value.ToString());
            deletePrinter(id);
            bidingdata();
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            int pageSize = int.Parse(ddlPageSize.SelectedValue);
            gvData.PageSize = pageSize;
            bidingdata();
        }

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
                        SqlCommand cmd = new SqlCommand("DELETE FROM Printers WHERE EngenPrintersID=" + ID, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }



                    selectedRecCount++; // Increment the count for each deleted record
                }
            }

            //this.bidingdata();
            bidingdata();


            // Display the alert with the count of deleted records
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type='text/javascript'>");
            sb.Append("alert('");
            sb.Append(selectedRecCount.ToString() + " rows deleted.');");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());
        }


        // the underneath is for multiple delete
        //private void Delete(string EngenPrintersID)
        //{
        //    try
        //    {
        //        string cs = "Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True";
        //        string query = $"DELETE FROM Printers WHERE Cast(EngenPrintersID as varchar(200)) IN (' {EngenPrintersID} ') ";

        //        SqlConnection con = new SqlConnection(cs);

        //        SqlCommand cmd = new SqlCommand(query, con);

        //        SqlParameter parameter = new SqlParameter("@EngenPrintersID", EngenPrintersID);

        //        cmd.Parameters.Add(parameter);

        //        con.Open();

        //        cmd.ExecuteNonQuery();

        //        con.Close();

        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }

        //}

        // protected void lblDeleteSelected_Click(object sender, EventArgs e)
        // {

        //    StringBuilder sb = new StringBuilder();

        //    foreach (GridViewRow gr in gvData.Rows)
        //    {

        //        CheckBox cb = (CheckBox)gr.FindControl("CheckBox1");

        //        if (cb.Checked)

        //        {
        //            string id = ((Label)gr.FindControl("lblEngenPrintersID")).Text;
        //            sb.Append(id + ",");

        //        }



        //    }

        //    sb.Remove(sb.ToString().LastIndexOf(","), 1);

        //    Delete(sb.ToString());

        //    gvData.DataBind();

        //}
    }
}

