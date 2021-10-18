using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinenews.Admin
{
    public partial class manage_video : System.Web.UI.Page
    {

        public Boolean IsAdmin { get; set; }
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Convert.ToString(Session["Roles"]).ToLower().Equals("admin"))
                {
                    IsAdmin = true;
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        { 
            var queryString = txtYoutubeLink.Text.Trim().Substring(txtYoutubeLink.Text.Trim().LastIndexOf('=') + 1);

            var linkUrl = $"https://www.youtube.com/embed/{queryString}?autoplay=1&mute=1";

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            using (cmd = new SqlCommand())
            {
                cmd.Connection = con;

                if (Convert.ToString(Session["Roles"]).ToLower().Equals("admin"))
                {
                    cmd.CommandText = $"UPDATE  dbo.tbl_YouTubeLink   SET youtubeLink = '{ linkUrl }' ,IsActive = 1";

                    con.Open();
                    int EffectedRows = cmd.ExecuteNonQuery();
                    con.Close();

                    if (EffectedRows > 0)
                    {
                        Response.Redirect("Index.aspx");
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