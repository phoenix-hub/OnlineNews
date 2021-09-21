using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace onlinenews.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bindAllUsers();
            }
        }
        protected void bindAllUsers()
        {

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            cmd.Connection = con;
            cmd.CommandText = @"SELECT  PersonID ,LastName ,FirstName ,MidName, (isnull(FirstName,'')+' '+isnull(MidName,'')+' '+isnull(LastName,'')) as Name  ,Address ,DateOfBirth ,MobileNo ,Email ,City ,Roles ,password ,ActiveStatus
  FROM NewsDb.dbo.Users order by 1 desc";
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