using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CompanyPrinters.Roles
{
    public partial class user : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "Displaying Page  " + (gvData.PageIndex + 1).ToString() + "  Of  " + gvData.PageCount.ToString();

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
                                                    FROM[dbo].[Printers]
                                                    FULL JOIN [dbo].[PrinterMakes]
                                                    ON Printers.PrinterMakeID = PrinterMakes.[PrinterMakeID]";
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

            string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName, PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                                                    FROM[dbo].[Printers]
                                                    FULL JOIN[dbo].[PrinterMakes]
                                                    ON Printers.PrinterMakeID = PrinterMakes.[PrinterMakeID]";

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

        private DataTable GetDataFromDataSource()
        {
            // Fetch data from database 
            //string connectionString = "Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True";
            string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName, PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                                                    FROM[dbo].[Printers]
                                                    FULL JOIN[dbo].[PrinterMakes]
                                                    ON Printers.PrinterMakeID = PrinterMakes.[PrinterMakeID]";
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
            string searchName = txtFilter.Text.Trim();



            // Fetch data from data source
            DataTable dt = GetDataFromDataSource();

            // Filter data based on sear
            DataView dv = dt.DefaultView;
            dv.RowFilter = "PrinterName LIKE '%" + searchName + "%'";

            // Bind filtered data to GridView
            gvData.DataSource = dv;
            gvData.DataBind();

            txtFilter.Text = string.Empty;
        }

        protected void gvData_SelectedIndexChanged(object sender, EventArgs e)
        {
            int pageSize = int.Parse(ddlPageSize.SelectedValue);
            gvData.PageSize = pageSize;
            bidingdata();
        }
    }
}
