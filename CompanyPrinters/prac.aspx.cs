using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
namespace CompanyPrinters
{
    public partial class prac : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindGridData();
            }
        }

        protected void BindGridData()
        {
            con.Open();
            string query = @"SELECT Printers.EngenPrintersID, Printers.PrinterName,  PrinterMakes.PrinterMake, Printers.FolderToMonitor, Printers.OutputType, Printers.FileOutput, Printers.Active, Printers.CreateTimeStamp
                             FROM [dbo].[Printers],[dbo].[PrinterMakes]
                             WHERE Printers.PrinterMakeID = PrinterMakes.PrinterMakeID";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvdetails.DataSource = dt;
            gvdetails.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            con.Open();
            //SqlCommand cmd = new SqlCommand("UPDATE [Printers] SET FirstName=@FirstName,LastName=@LastName, City=@City,Designation=@Designation where UserId=@UserId", con);
            string query = "UPDATE Printers SET PrinterName = '" + txtPrinterName.Text + "', PrinterMakeID='" + drplsPrintermake.SelectedValue + "', FolderToMonitor = '" + txtFolderToMonitor.Text + "', OutputType = '" + txtOutputType.Text
                                            + "', FileOutput ='" + txtFileOutput.Text + "', Active ='" + DropDownList1.SelectedValue + "', CreateTimeStamp ='" + Convert.ToDateTime(txtCreateTimeStamp.Text) + "' WHERE EngenPrintersID = " + lblPrinterID.Text + "";
            //string query = "UPDATE Printers SET Printers.PrinterName = '" + txtPrinterName.Text + "',PrinterMakes.PrinterMake = '" + drplsPrintermake.SelectedValue + "', Printers.FolderToMonitor = '" + txtFolderToMonitor.Text + "', Printers.OutputType = '" + txtOutputType.Text
            //                                 + "', Printers.FileOutput ='" + txtFileOutput.Text + "', Printers.Active ='" + txtActive.Text + "', Printers.CreateTimeStamp ='" + Convert.ToDateTime(txtCreateTimeStamp.Text) + " FROM Printers JOIN PrinterMakes ON Printers.PrinterMakeID = PrinterMakes.PrinterMakeID  WHERE Printers.EngenPrintersID =" + lblPrinterID.Text + "";
            
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@PrinterName", txtPrinterName.Text);
            cmd.Parameters.AddWithValue("@PrinterMake", drplsPrintermake.SelectedValue);
            cmd.Parameters.AddWithValue("@FolderToMonitor", txtFolderToMonitor.Text);
            cmd.Parameters.AddWithValue("@OutputType", txtOutputType.Text);
            cmd.Parameters.AddWithValue("@FileOutput", txtFileOutput.Text);
            cmd.Parameters.AddWithValue("@Active", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@CreateTimeStamp", txtCreateTimeStamp.Text);
            cmd.Parameters.AddWithValue("@EngenPrintersID", Convert.ToInt32(lblPrinterID.Text));
            cmd.ExecuteNonQuery();
            con.Close();
            lblPrinterID.Text = lblPrinterID.Text + " Details Updated Successfully";
            lblPrinterID.ForeColor = Color.Green;
            BindGridData();
        }

        protected void imgbtn_Click(object sender, ImageClickEventArgs e)
        {
            drplsPrintermake.ClearSelection();

            ImageButton btndetails = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
            lblPrinterID.Text = gvdetails.DataKeys[gvrow.RowIndex].Value.ToString();
            txtPrinterName.Text = gvrow.Cells[1].Text;
            drplsPrintermake.Items.FindByText(gvrow.Cells[2].Text).Selected = true;
            //drplsPrintermake.SelectedItem.Text = gvrow.Cells[2].Text;
            txtFolderToMonitor.Text = gvrow.Cells[3].Text;
            txtOutputType.Text = gvrow.Cells[4].Text;
            txtFileOutput.Text = gvrow.Cells[5].Text;
            DropDownList1.SelectedItem.Text = gvrow.Cells[6].Text;
            txtCreateTimeStamp.Text = gvrow.Cells[7].Text;
            this.ModalPopupExtender1.Show();
        }


    }
}