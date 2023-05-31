using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CompanyPrinters.User
{
    public partial class UserPrinter : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
        //string conn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "Displaying Page  " + (GridView1.PageIndex + 1).ToString() + "  Of  " + GridView1.PageCount.ToString();
            
            if(!IsPostBack)
            {
                bidingdata();
            }
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");

            DateTime startDate = Convert.ToDateTime(txtStartDate.Text);
            DateTime endDate = Convert.ToDateTime(txtEndDate.Text);

            // Construct a query or filter expression that includes the selected date range
            //string query = "SELECT * FROM Printers WHERE CreateTimeStamp BETWEEN @StartDate AND @EndDate";
            string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, 
                            Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                            FROM Printers,PrinterMakes
                            WHERE Printers.CreateTimeStamp BETWEEN @StartDate AND @EndDate";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@StartDate", startDate);
            cmd.Parameters.AddWithValue("@EndDate", endDate);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            // Bind the filtered data to the GridView
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void bidingdata()
        {
            string cs = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(cs))
            {
                //SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Printers", con);
                string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                                 FROM[dbo].[Printers]
                                 FULL JOIN [dbo].[PrinterMakes]
                                 ON Printers.EngenPrintersID = PrinterMakes.[PrinterMakeID]";
                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }


        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bidingdata();
            e.Cancel = true;
        }
    }
}