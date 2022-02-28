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
    public partial class Signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("FirstPage.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if (Email.Text == "AdminTest@gmail.com" || Passw.Text == "12345")
            {
                Response.Redirect("ManageMovies.aspx");
            }
            else // Check if user account exists
            {
                using (SqlConnection xConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    using (SqlCommand xCmd = new SqlCommand())
                    {
                        xCmd.Connection = xConn;
                        xConn.Open();
                        xCmd.CommandText = "SELECT * FROM [Users] WHERE xEmail = '"
                            + Email.Text + "' AND xPassword = '" + Passw.Text + "';";
                        SqlDataReader xReader = xCmd.ExecuteReader();

                        if (xReader.HasRows)
                        {
                            xReader.Read();
                            Session["usermail"] = xReader["xEmail"].ToString();
                            Response.Redirect("Movies.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Account does not exist!');</script>");
                        }
                        xReader.Close();
                    }
                }
            }
        }
    }
}