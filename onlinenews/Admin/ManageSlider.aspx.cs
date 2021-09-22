using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlinenews.Admin
{
    public partial class ManageSlider : System.Web.UI.Page
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
            if (!Page.IsPostBack)
            {
                dangerDiv.Visible = false;
                sucessDiv.Visible = false;
                bindAllSliders();
            }

        }
        protected void bindAllSliders()
        {

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            cmd.Connection = con;
            if (Convert.ToString(Session["Roles"]).ToLower().Equals("admin"))
            {
                cmd.CommandText = "select NewsId,  left(NewsTitle,10)+'...' 'NewsTitle' , left(Description,10)+'...' 'NewsDescription' , '../'+NewsBanner 'NewsBanner' , NewsCity+','+NewsState as 'NewsLocation', IsActive 'IsActive'  ,left(CreatedBy,10)+'...' 'CreatedBy' ,CreatedDateTime 'CreatedOn' from [dbo].[tbl_NewsSlider]  order by IsActive, NewsDateTime, CreatedDateTime desc";
            }
            else
            {

                cmd.CommandText = $"select NewsId,  left(NewsTitle,10)+'...' 'NewsTitle' , left(Description,10)+'...' 'NewsDescription' , '../'+NewsBanner 'NewsBanner' , NewsCity+','+NewsState as 'NewsLocation', IsActive 'IsActive'  ,left(CreatedBy,10)+'...' 'CreatedBy' ,CreatedDateTime 'CreatedOn' from [dbo].[tbl_NewsSlider] where  CreatedBy='{Convert.ToString(Session["UserEmail"])}'  order by IsActive, NewsDateTime, CreatedDateTime desc";
            }

            con.Open();

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();

            RepeaterNewsSlider.DataSource = ds.Tables[0];
            RepeaterNewsSlider.DataBind();
        }

        protected void btnDeleteSlider_Click(object sender, EventArgs e)
        {
            int effectedRows = 0;
            LinkButton lnk = sender as LinkButton;
            RepeaterItem ri = (RepeaterItem)lnk.NamingContainer;
            Label lblRowId1 = ri.FindControl("lblNewsId") as Label;

            try
            {
                string query = $"delete from [dbo].[tbl_NewsSlider] where NewsId ='{lblRowId1.Text}'";

                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        con.Open();
                        effectedRows = cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                if (effectedRows > 0)
                {
                    lblErrorGreen.Text = $"Success: Row deleted.";
                    sucessDiv.Visible = true;
                    dangerDiv.Visible = false;
                    bindAllSliders();

                }
            }
            catch (Exception ex)
            {
                lblErrorRed.Text = $"Error: {ex.Message}";
                dangerDiv.Visible = true;
                sucessDiv.Visible = false;
            }
        }
    }
}