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
    public partial class Printers : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
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

            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(cs))
            {
                //SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Printers", con);
                string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                                FROM [dbo].[Printers],[dbo].[PrinterMakes]
                                WHERE Printers.PrinterMakeID = PrinterMakes.PrinterMakeID";
                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    gvData.DataSource = dt;
                    gvData.DataBind();
                }
            }


        }

        protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvData.DataKeys[e.RowIndex].Value.ToString());
            TextBox txtPrintername = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_printerName");
            TextBox txtPrinterMake = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_printerMake");
            TextBox txtFolderToMonitor = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_folderToMonitor");
            TextBox txtOutputType = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_OutputType");
            TextBox txtFileOutput = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_FileOutput");
            TextBox txtActive = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_active");
            TextBox txttime = (TextBox)gvData.Rows[e.RowIndex].FindControl("txt_CreateTimeStamp");
            updatePrinters(id, txtPrintername.Text, txtFolderToMonitor.Text, txtOutputType.Text, txtFileOutput.Text, txtActive.Text, txttime.Text);
            gvData.EditIndex = -1;
            bidingdata();
        }

        protected void gvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            gvData.EditIndex = -1;
            bidingdata();
        }

        protected void gvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(gvData.DataKeys[e.RowIndex].Value.ToString());
            deletePrinter(id);
            bidingdata();
        }

        protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvData.EditIndex = e.NewEditIndex;
            bidingdata();
        }

        private void updatePrinters(int id, string Printer_Name, string Folder_To_Monitor, string Output_Type, string File_Output, string active, string time)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Printers SET PrinterName = '" + Printer_Name + "', FolderToMonitor = '" + Folder_To_Monitor + "', OutputType = '" + Output_Type
                                              + "', FileOutput ='" + File_Output + "', Active ='" + active + "', CreateTimeStamp ='" + time + "' WHERE EngenPrintersID = " + id + "";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();
            }


        }
        private void deletePrinter(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Printers WHERE EngenPrintersID =" + id + "";
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

        protected DataTable GetDataFromProcedure()
        {
            string connectionString = "Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);

            string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                            FROM [dbo].[Printers],[dbo].[PrinterMakes]
                            WHERE Printers.PrinterMakeID = PrinterMakes.PrinterMakeID";

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
            for (int i = 1; i < gvData.Columns.Count; i++)
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

        // This code underneath is for adding a printer
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
            // int IDS = drpPrinterMaker.SelectedValue;
            string sql = "INSERT INTO [Printers] (PrinterName,PrinterMakeID,FolderToMonitor,OutputType,FileOutput,Active,CreateTimeStamp )" +
            " VALUES ('" + txtPrinterName.Text + "', '" + drpPrinterMaker.SelectedValue + "', '" + txtFolderToMonitor.Text + "', '" + txtOutputType.Text + "', '" + txtFileOutput.Text + "','" + rblActive.SelectedValue + "','" + DateTime.Now + "')";
            SqlCommand com = new SqlCommand(sql, con);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            //Response.Redirect("~/NewFolder1/Printers.aspx");

            //clearing textboxes 

            txtPrinterName.Text = string.Empty;
            txtFolderToMonitor.Text = string.Empty;
            txtFileOutput.Text = string.Empty;
            txtOutputType.Text = string.Empty;
        }

        // This code underneath is for searching / filtering data 
        //    protected void btnFilter_Click(object sender, EventArgs e)
        //    {
        //        // 1. Create a database connection
        //        SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");

        //        // 2. Populate the dropdownlist
        //        SqlCommand cmd = new SqlCommand("SELECT * FROM PrinterMakes", con);
        //        con.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        while (reader.Read())
        //        {
        //            DropDownList1.Items.Add(reader["PrinterMake"].ToString());
        //        }
        //        con.Close();

        //        // 3. Get the selected value and dates
        //        string selectedValue = DropDownList1.SelectedValue;
        //        DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
        //        DateTime endDate = Convert.ToDateTime(txtEndDate.Text);
        //        //DateTime endDate = DateTime.Parse(txtEndDate.Text);

        //        // 4. Use SQL queries to retrieve data
        //        string sqlQuery = "SELECT * FROM Printers WHERE CreateTimeStamp = @selectedValue AND CreateTimeStamp BETWEEN @startDate AND @endDate";
        //        SqlCommand cmd2 = new SqlCommand(sqlQuery, con);
        //        cmd2.Parameters.AddWithValue("@selectedValue", selectedValue);
        //        cmd2.Parameters.AddWithValue("@startDate", startDate);
        //        cmd2.Parameters.AddWithValue("@endDate", endDate);
        //        con.Open();
        //        //SqlDataReader reader2 = cmd2.ExecuteReader();
        //        DataSet ds = new DataSet();
        //        SqlDataAdapter da = new SqlDataAdapter(cmd2);
        //        da.Fill(ds);
        //        // 5. Display the results
        //        gvData.DataSource = ds;
        //        gvData.DataBind();
        //        con.Close();

        //    }
        //}
        //}

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            // 1. Create a database connection
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");

            // 2. Populate the dropdownlist
            //SqlCommand cmd = new SqlCommand("SELECT DISTINCT PrinterMake FROM PrinterMakes", con);
            //con.Open();
            //SqlDataReader reader = cmd.ExecuteReader();
            //while (reader.Read())
            //{
            //    drpdownprinter.Items.Add(reader["PrinterMake"].ToString());
            //}
            //con.Close();

            // 3. Get the selected value and dates
            string selectedValue = drpdownprinter.SelectedItem.Text;
            DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime endDate = Convert.ToDateTime(txtEndDate.Text);

            

            // Construct a query or filter expression that includes the selected date range
            //string query = "SELECT * FROM Printers WHERE CreateTimeStamp BETWEEN @StartDate AND @EndDate";
            string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, 
                            Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                           FROM Printers,PrinterMakes
                           WHERE (Printers.CreateTimeStamp BETWEEN @StartDate AND @EndDate) AND PrinterMakes.PrinterMake = @selectedValue ";

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

            //Bind the filtered data to the GridView
            gvData.DataSource = dt;
            gvData.DataBind();
        }
    }
}

