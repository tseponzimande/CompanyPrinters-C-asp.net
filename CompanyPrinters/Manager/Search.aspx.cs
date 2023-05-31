using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace CompanyPrinters.NewFolder1
{
    public partial class Search : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
        string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblmsg.Text = " Displaying Page  " + (GridView1.PageIndex + 1).ToString() + "  Of  " + GridView1.PageCount.ToString();

            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    DataTable dt = GetDataFromDataSource();
                    gvData.DataSource = dt;
                    gvData.DataBind();
                    ViewState["dt"] = dt;
                    BindGridData();
                }
            }
        }

        private DataTable GetDataFromDataSource()
        {
            // Fetch data from database 
            //string connectionString = "Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True";
            string query = @"SELECT Users.FirstName, Users.LastName, Users.Email, Users.UserName, Users.Password, Users.Address, Designations.DesignationName
                            FROM [dbo].Users, [dbo].Designations
                            WHERE Users.DesignationID = Designations.DesignationID";
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


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchName = txtSearch.Text.Trim();

            // Fetch data from data source
            DataTable dt = GetDataFromDataSource();

            // Filter data based on search name
            DataView dv = dt.DefaultView;
            dv.RowFilter = "UserName LIKE '%" + searchName + "%'";

            // Bind filtered data to GridView
            gvData.DataSource = dv;
            gvData.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvData.PageIndex = e.NewPageIndex;
            GetDataFromDataSource();
            e.Cancel = true;
        }
    }
}