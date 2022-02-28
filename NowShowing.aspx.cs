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
    public partial class NowShowing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            MovieWarning.Visible = false;
            if (Session["usermail"] != null)
            {
                ((Label)Master.FindControl("UsernameLBL")).Text = Session["usermail"].ToString();
            }
        }

        protected void QuantityTB_TextChanged(object sender, EventArgs e)
        {
            MovieInfo();
        }

        private void MovieInfo()
        {
            int Quantity = int.Parse(QuantityTB.Text);

            using (SqlConnection xConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand xCmd = new SqlCommand())
                {
                    xCmd.Connection = xConn;
                    xConn.Open();
                    xCmd.CommandText = "SELECT * FROM [Movies] WHERE Mov_name = '"
                        + MovieDDL.SelectedValue + "';";
                    SqlDataReader xReader = xCmd.ExecuteReader();

                    if (xReader.HasRows)
                    {
                        xReader.Read();

                        Time.Text = xReader["Mov_time"].ToString();
                        Date.Text = xReader["Mov_date"].ToString();
                        int Price = int.Parse(xReader["Price"].ToString());
                        Total.Text = Convert.ToString(Quantity * Price); // compute total
                    }
                    xReader.Close();
                }
            }
        }

        private void AddtoDatabase()
        {
            // generate a ticketID for every ticket
            foreach (ListItem li in ParkingLotCBL.Items)
            {
                string selectedItems = "";
                if (li.Selected)
                {
                    selectedItems += li.Text;

                    using (SqlConnection xConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                    {
                        using (SqlCommand xCmd = new SqlCommand())
                        {
                            xCmd.Connection = xConn;
                            xCmd.CommandText = "INSERT INTO MovieChoice " +
                                "(User_email, Mov_name, Mov_time, Mov_date, Parkingspace, Total)" +
                                "VALUES (@User_email, @Mov_name, @Mov_time, @Mov_date, @Parkingspace, @Total)";
                            xCmd.Parameters.AddWithValue("@User_email", Session["usermail"].ToString());
                            xCmd.Parameters.AddWithValue("@Mov_name", MovieDDL.SelectedValue);
                            xCmd.Parameters.AddWithValue("@Mov_time", Time.Text);
                            xCmd.Parameters.AddWithValue("@Mov_date", Date.Text);
                            xCmd.Parameters.AddWithValue("@Parkingspace", selectedItems);
                            xCmd.Parameters.AddWithValue("@Total", int.Parse(Total.Text));
                            xConn.Open();
                            xCmd.ExecuteNonQuery();
                        }
                    }
                }
            }
            Response.Write("<script>alert('Added to cart!');</script>");
            Reset(); //Clear values
        }

        // Limit the selection of parking lots based on the amount of ticket
        protected void ParkingLotCBL_SelectedIndexChanged(object sender, EventArgs e)
        {
            int a = ParkingLotCBL.Items.Count;
            int count = 0;
            for (int i = 0; i < a; i++)
            {
                if (ParkingLotCBL.Items[i].Selected == true)
                    count++;
            }

            if (count > int.Parse(QuantityTB.Text))
            {
                for (int i = 0; i < a; i++)
                {
                    if (ParkingLotCBL.Items[i].Selected == true)
                    {
                        ParkingLotCBL.Items[i].Selected = false;
                        break;
                    }
                }
            }
        }
        private void Reset()
        {
            MovieDDL.ClearSelection();
            QuantityTB.Text = "";
            ParkingLotCBL.ClearSelection();
            Total.Text = "";
        }

        //Buttons here
        protected void Cancel_Click(object sender, EventArgs e)
        {
            Reset();
        }

        protected void Purchase_Click(object sender, EventArgs e)
        {
            if (MovieDDL.SelectedValue == "Select a movie")
                MovieWarning.Visible = true;
            else
                AddtoDatabase();
        }
    }
}