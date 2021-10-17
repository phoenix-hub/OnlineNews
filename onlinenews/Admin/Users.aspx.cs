using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinenews.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        public Boolean IsAdmin { get; set; }
        SqlConnection con;
        SqlCommand cmd;
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
            using (cmd = new SqlCommand())
            {
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
            }
            RepeaterUsers.DataSource = ds.Tables[0];
            RepeaterUsers.DataBind();
        }
        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            var btn = (Button)sender;
            var item = (RepeaterItem)btn.NamingContainer;
            var hdnPersonId = (HiddenField)item.FindControl("hdnPersonID");

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            using (cmd = new SqlCommand())
            {
                cmd.Connection = con;

                if (Convert.ToString(Session["Roles"]).ToLower().Equals("admin"))
                {
                    cmd.CommandText = $"delete FROM NewsDb.dbo.Users where PersonID='{hdnPersonId.Value}'";

                    con.Open();
                    int EffectedRows = cmd.ExecuteNonQuery();
                    con.Close();

                    if (EffectedRows > 0)
                    {
                        bindAllUsers();
                    }
                }
                else
                {
                    Response.Write("<script>alert('You dont have permission to delete records.')</script>");
                }
            }
        }
    }
}