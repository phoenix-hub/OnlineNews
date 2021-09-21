using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace onlinenews.Admin
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Session["UserEmail"] = "ajaynath.be@gmail.com";
                bindLoggedInUser();
            }
        }
        protected void bindLoggedInUser()
        {

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            cmd.Connection = con;
            cmd.CommandText = $"select * from  [dbo].[Users] where   Email= '{ Convert.ToString(Session["UserEmail"]) }' and ActiveStatus='Active'";
            con.Open();

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtFirstName.Text = Convert.ToString(ds.Tables[0].Rows[0]["FirstName"]);
                txtLastName.Text = Convert.ToString(ds.Tables[0].Rows[0]["LastName"]);
                txtMidName.Text = Convert.ToString(ds.Tables[0].Rows[0]["MidName"]);
                txtDateOfBirth.Text = Convert.ToString(ds.Tables[0].Rows[0]["DateOfBirth"]);
                txtEmail.Text = Convert.ToString(ds.Tables[0].Rows[0]["Email"]);
                txtMobileNo.Text = Convert.ToString(ds.Tables[0].Rows[0]["MobileNo"]);
                txtAddress.Text = Convert.ToString(ds.Tables[0].Rows[0]["Address"]);
                txtCity.Text = Convert.ToString(ds.Tables[0].Rows[0]["City"]);
                txtState.Text = Convert.ToString(ds.Tables[0].Rows[0]["State"]);
                txtCountry.Text = Convert.ToString(ds.Tables[0].Rows[0]["Country"]);
                drpActiveStatus.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["ActiveStatus"]);

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int effectedRows = 0;
                string query = "UPDATE[dbo].[Users] SET[LastName] =@LastName,[FirstName] =@FirstName,MidName=@MidName,DateOfBirth=Convert(dateTime,@DateOfBirth,105),  MobileNo=@MobileNo, Address=@Address, City=@City, State=@State,  Country=@Country where Email=@Email";

                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                        cmd.Parameters.AddWithValue("@MidName", txtMidName.Text.Trim());
                        cmd.Parameters.AddWithValue("@DateOfBirth", txtDateOfBirth.Text.Trim());
                        cmd.Parameters.AddWithValue("@MobileNo", txtMobileNo.Text.Trim());
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
                        cmd.Parameters.AddWithValue("@State", txtState.Text.Trim());
                        cmd.Parameters.AddWithValue("@Country", txtCountry.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", Convert.ToString(Session["UserEmail"]));
                        cmd.Connection = con;
                        con.Open();
                        effectedRows = cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                if (effectedRows > 0)
                {
                    Response.Write("<script>alert('Profile has been updated successfully.')</script>");
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}