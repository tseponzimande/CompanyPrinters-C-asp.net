using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CompanyPrinters.Roles
{
    public partial class Manager : System.Web.UI.Page
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

        protected void gvData_SelectedIndexChanged(object sender, EventArgs e)
        {
            int pageSize = int.Parse(ddlPageSize.SelectedValue);
            gvData.PageSize = pageSize;
            bidingdata();
        }
    }
}
