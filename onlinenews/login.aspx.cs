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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            cmd.Connection = con;
            cmd.CommandText = @"select Email from  [dbo].[Users] where   Email= '" + txtEmail.Text.Trim() + "' and password= '" + txtpassword.Text.Trim() + "' and ActiveStatus='Active'";
            con.Open();

            string email = Convert.ToString(cmd.ExecuteScalar());

            con.Close();

            if (string.IsNullOrEmpty(email))
            {
                Response.Write("<script>alert('user not found or given account suspended.')</script>");
            }
            else
            {
                Session["UserEmail"] = txtEmail.Text.Trim();
                Response.Redirect("Admin/Index.aspx");
            }

        }
    }
}