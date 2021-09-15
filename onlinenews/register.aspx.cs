using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinenews
{
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            cmd.Connection = con;
            cmd.CommandText = @"INSERT INTO [dbo].[Users]
           ([LastName]
           ,[FirstName]
           ,[MobileNo]
           ,[Email]
           ,[Roles]
           ,[password]
           ,[ActiveStatus])
     VALUES
           (
            '" + txtLastName.Text.Trim() + "','" + txtFirstName.Text.Trim() + "', '" + txtMobileNo.Text.Trim() + "', '" + txtEmail.Text.Trim() + "','User', '" + txtpassword.Text.Trim() + "','Active')";
            con.Open();

            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                Response.Write("<script> alert('User has been created. Kindly go to login to explore this site.')</script>");
            }

            con.Close();
        }
    }
}