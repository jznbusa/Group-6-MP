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
    public partial class ManageAcc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Insert(object sender, EventArgs e)
        {
            using (SqlConnection xConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand xCmd = new SqlCommand())
                {
                    xCmd.Connection = xConn;
                    xCmd.CommandText = "INSERT INTO [Users] (xLastname, xFirstname, xEmail, xPassword, xPayment, xAddress) " +
                        "VALUES (@xLastname, @xFirstname, @xEmail, @xPassword, @xPayment, @xAddress)";

                    xCmd.Parameters.AddWithValue("@xLastname", LastTB.Text);
                    xCmd.Parameters.AddWithValue("@xFirstname", FirstTB.Text);
                    xCmd.Parameters.AddWithValue("@xEmail", EmailTB.Text);
                    xCmd.Parameters.AddWithValue("@xPassword", PasswordTB.Text);
                    xCmd.Parameters.AddWithValue("@xPayment", PaymentDDL.SelectedValue);
                    xCmd.Parameters.AddWithValue("@xAddress", Address.Text);
                    xConn.Open();
                    xCmd.ExecuteNonQuery();
                }
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}