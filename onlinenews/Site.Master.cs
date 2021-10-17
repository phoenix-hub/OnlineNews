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
    public partial class SiteMaster : MasterPage
    {
        public string youtubeLink { get; set; }
        SqlConnection con;
        SqlCommand cmd;
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindVideo();
            }
        }
        protected void BindVideo()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            using (cmd = new SqlCommand())
            {
                cmd.Connection = con;

                cmd.CommandText = $"select youtubeLink from dbo.tbl_YouTubeLink where IsActive = 1";

                con.Open();
                youtubeLink = Convert.ToString(cmd.ExecuteScalar());
                urIframe.Attributes.Add("src", youtubeLink);
                con.Close();
            }
        }
    }
}