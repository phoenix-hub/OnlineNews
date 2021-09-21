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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        DataSet ds= new DataSet();
        SqlDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            cmd.Connection = con;
            cmd.CommandText = "select * from tbl_NewsSlider where IsActive='Active' order by newsid desc";
            con.Open();

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            
            con.Close();
            RepeatInformation.DataSource = ds.Tables[0];
            RepeatInformation.DataBind();
            RepeaterBullets.DataSource = ds.Tables[0];
            RepeaterBullets.DataBind();

        }
    }
}