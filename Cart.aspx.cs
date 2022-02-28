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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usermail"] != null)
            {
                ((Label)Master.FindControl("UsernameLBL")).Text = Session["usermail"].ToString();
                DisplayTotal();
            }
        }
        protected void Purchase_Click(object sender, EventArgs e)
        {
            // add to purchase table
            using (SqlConnection xConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand xCmd = new SqlCommand())
                {
                    xCmd.Connection = xConn;
                    xConn.Open();
                    string insert = "INSERT INTO Purchase (Total) VALUES (@Total);";
                    xCmd.CommandText = insert;
                    xCmd.Parameters.AddWithValue("@Total", Total.Text);

                    xCmd.ExecuteNonQuery();
                }
            }
            // delete from cart
            using (SqlConnection xConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand xCmd = new SqlCommand())
                {
                    xCmd.Connection = xConn;
                    xConn.Open();
                    string del = "DELETE FROM MovieChoice " +
                        "WHERE User_email = '" + Session["usermail"].ToString() + "';";
                    xCmd.CommandText = del;
                    xCmd.ExecuteNonQuery();
                }
            }
            Total.Text = "";
            Response.Write("<script>alert('Purchase successful!');</script>");
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movies.aspx");
        }

        private void DisplayTotal()
        {
            using (SqlConnection xConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand xCmd = new SqlCommand())
                {
                    xCmd.Connection = xConn;
                    xConn.Open();
                    xCmd.CommandText = "SELECT SUM(Total) AS Total FROM MovieChoice " +
                        "WHERE User_email = '" + Session["usermail"].ToString() + "';";
                    SqlDataReader xReader = xCmd.ExecuteReader();
                    if (xReader.HasRows)
                    {
                        xReader.Read();
                        Total.Text = xReader["Total"].ToString();
                    }
                    xReader.Close();
                }
            }

        }
    }
}