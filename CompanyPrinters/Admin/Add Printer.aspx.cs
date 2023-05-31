using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CompanyPrinters.Admin
{
    public partial class Add_Printer : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-JTMP973\\SQLEXPRESS;Initial Catalog=Companyprinters2;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
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
    }
}