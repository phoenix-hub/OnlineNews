using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace onlinenews.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        public Boolean IsAdmin { get; set; }
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToString(Session["Roles"]).ToLower().Equals("admin"))
                {
                    IsAdmin = true;
                }
                bindAllUsers();
            }
        }
        protected void bindAllUsers()
        {

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            cmd.Connection = con;
            if (Convert.ToString(Session["Roles"]).ToLower().Equals("admin"))
            {
                cmd.CommandText = @"SELECT  PersonID ,LastName ,FirstName ,MidName, (isnull(FirstName,'')+' '+isnull(MidName,'')+' '+isnull(LastName,'')) as Name  ,Address ,DateOfBirth ,MobileNo ,Email ,City ,Roles ,password ,ActiveStatus
  FROM NewsDb.dbo.Users order by roles,1 desc";
            }
            else
            {
                cmd.CommandText = $"SELECT  PersonID ,LastName ,FirstName ,MidName, (isnull(FirstName,'')+' '+isnull(MidName,'')+' '+isnull(LastName,'')) as Name  ,Address ,DateOfBirth ,MobileNo ,Email ,City ,Roles ,password ,ActiveStatus FROM NewsDb.dbo.Users where lower(Roles)!='admin' and Email='{Convert.ToString(Session["UserEmail"])}' order by 1 desc";
            }
            con.Open();

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();

            RepeaterUsers.DataSource = ds.Tables[0];
            RepeaterUsers.DataBind();
        }
        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {

        }
    }
}