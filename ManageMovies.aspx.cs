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
    public partial class AdminMov : System.Web.UI.Page
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
                    xCmd.CommandText = "INSERT INTO [Movies] (Mov_name, Mov_time, Mov_date, Price) " +
                        "VALUES (@Mov_name, @Mov_time, @Mov_date, @Price)";

                    xCmd.Parameters.AddWithValue("@Mov_name", MovName.Text);
                    xCmd.Parameters.AddWithValue("@Mov_time", MovTime.Text);
                    xCmd.Parameters.AddWithValue("@Mov_date", MovDate.Text);
                    xCmd.Parameters.AddWithValue("@Price", int.Parse(Price.Text));
                    xConn.Open();
                    xCmd.ExecuteNonQuery();
                }
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}