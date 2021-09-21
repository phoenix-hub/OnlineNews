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
        SqlConnection con;
        SqlCommand cmd = new SqlCommand();
        DataSet ds = new DataSet();
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dangerDiv.Visible = false;
                sucessDiv.Visible = false;
                bindAllUsers();
            }

        }
        protected void bindAllUsers()
        {

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            cmd.Connection = con;
            cmd.CommandText = "select NewsId, NewsTitle 'NewsTitle' , left(Description,17)+'...' 'NewsDescription' , '../'+NewsBanner 'NewsBanner' , NewsDistrict+','+NewsCity+','+NewsState as 'NewsLocation', IsActive 'IsActive'  ,left(CreatedBy,10)+'...' 'CreatedBy' ,CreatedDateTime 'CreatedOn' from [dbo].[tbl_NewsSlider] where IsActive='Active' order by NewsDateTime, CreatedDateTime desc";
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
                    bindAllUsers();

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