using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Group_6_MP
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void Register_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != "Select payment method")
            {
                using (SqlConnection xConn = new SqlConnection(
                        ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    using (SqlCommand xCmd = new SqlCommand())
                    {
                        xCmd.Connection = xConn;
                        xConn.Open();
                        xCmd.CommandText = "SELECT xEmail FROM [Users] WHERE xEmail = @param";
                        xCmd.Parameters.AddWithValue("@param", Email.Text);
                        SqlDataReader xReader = xCmd.ExecuteReader();
                        if (xReader.Read())
                        {
                            Response.Write("<script>alert('Account already exists.');</script>");
                            xReader.Close();
                        }
                        else
                        {
                            xReader.Close();
                            xCmd.CommandText = "INSERT INTO [Users] (xLastname, xFirstname, xEmail, xPassword, xPayment, xAddress) " +
                                            "VALUES (@xLastname, @xFirstname, @xEmail, @xPassword, @xPayment, @xAddress)";
                            xCmd.Parameters.AddWithValue("@xLastname", Lastname.Text);
                            xCmd.Parameters.AddWithValue("@xFirstname", Firstname.Text);
                            xCmd.Parameters.AddWithValue("@xEmail", Email.Text);
                            xCmd.Parameters.AddWithValue("@xPassword", Passw.Text);
                            xCmd.Parameters.AddWithValue("@xPayment", DropDownList1.SelectedValue);
                            xCmd.Parameters.AddWithValue("@xAddress", Address.Text);
                            xCmd.ExecuteNonQuery();
                            Response.Write("<script>alert('Success!');</script>");
                            Session["usermail"] = Email.Text;
                            Response.Redirect("Movies.aspx");
                        }
                        }
                    }
                }
            else
            {
                Response.Write("<script>alert('Please select payment method.');</script>");
            }

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("FirstPage.aspx");
        }
    }
}