using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinenews.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        public Boolean IsAdmin { get; set; }

        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Roles"]).ToLower().Equals("admin"))
            {
                IsAdmin = true;
            }
            if (!IsPostBack)
            {
                
                if (Session["UserEmail"] == null)
                    Response.Redirect("../login.aspx");
                else
                {
                    Response.ClearHeaders();
                    Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                    Response.AddHeader("Pragma", "no-cache");
                }
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
                lblUserleftprofile.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                lblUserRole.Text = ds.Tables[0].Rows[0]["Roles"].ToString(); 
                lblUserName.Text = $"Welcome : { ds.Tables[0].Rows[0]["FirstName"].ToString()} { ds.Tables[0].Rows[0]["LastName"].ToString()}";
            }
        }
    }
}