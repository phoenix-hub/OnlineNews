using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Threading;
using System.Web;
using System.Web.UI;


namespace onlinenews.Admin
{
    public partial class UpdateSlider : System.Web.UI.Page
    {
        public Boolean IsAdmin { get; set; }
        public string sliderNewsId { get; set; }

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
                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("ManageSlider");
                }
                sliderNewsId = Request.QueryString["id"].ToString();
                dangerDiv.Visible = false;
                sucessDiv.Visible = false;

                bindSelectedSlider();
            }
        }
        protected string GetUploadedImage(string fn)
        {
            string filename = string.Empty;


            if (flNewsBanner.HasFile)
            {
                Guid uid = Guid.NewGuid();

                string SaveLocation = Server.MapPath("../themes/news slider/data1/images/") + uid + fn;
                string TempSaveLocation = Server.MapPath("../themes/news slider/data1/images/") + fn;

                Image obj;
                Bitmap newImage;

                flNewsBanner.SaveAs(TempSaveLocation);
                using (obj = System.Drawing.Image.FromFile(TempSaveLocation))
                {
                    ImageFormat imageFormat = obj.RawFormat;
                    using (newImage = new Bitmap(obj, 960, 360))
                    {
                        newImage.Save(SaveLocation);
                        newImage.Dispose();
                    }
                }
                filename = "themes/news%20slider/data1/images/" + uid + fn;
            }
            return filename;
        }

        protected void bindSelectedSlider()
        {
            var sliderId = Request.QueryString["id"].ToString();
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            cmd.Connection = con;

            cmd.CommandText = $"select * from [dbo].[tbl_NewsSlider] where NewsId={sliderId}";

            con.Open();

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtNewsTitle.Text = Convert.ToString(ds.Tables[0].Rows[0]["NewsTitle"]);
                txtImgTitle.Text = Convert.ToString(ds.Tables[0].Rows[0]["ImgTitle"]);
                txtDescription.Text = Convert.ToString(ds.Tables[0].Rows[0]["Description"]);
                txtNewsDateTime.Text = Convert.ToString(ds.Tables[0].Rows[0]["NewsDateTime"]);
                txtNewsCountry.Text = Convert.ToString(ds.Tables[0].Rows[0]["NewsCountry"]);
                txtNewsState.Text = Convert.ToString(ds.Tables[0].Rows[0]["NewsState"]);
                txtNewsCity.Text = Convert.ToString(ds.Tables[0].Rows[0]["NewsCity"]);
                txtNewsDistrict.Text = Convert.ToString(ds.Tables[0].Rows[0]["NewsDistrict"]);
                lnkBanner.NavigateUrl = "../" + Convert.ToString(ds.Tables[0].Rows[0]["NewsBanner"]);
                lblBanerImage.Text = Convert.ToString(ds.Tables[0].Rows[0]["NewsBanner"]);
                try
                {
                    drpIsActive.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["IsActive"]);
                }
                catch { }
                try
                {
                    drpNewsCategory.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["NewsCategory"]);
                }
                catch { }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var sliderId = Request.QueryString["id"].ToString();
            string filename = string.Empty;

            string fn = string.Empty;
            if (flNewsBanner.HasFile) { fn = System.IO.Path.GetFileName(flNewsBanner.PostedFile.FileName); }

            try
            {

                if (string.IsNullOrEmpty(txtNewsTitle.Text))
                {
                    throw new Exception("Please enter News title");
                }
                if (string.IsNullOrEmpty(txtImgTitle.Text))
                {
                    throw new Exception("Please enter Image Title");
                }

                if (string.IsNullOrEmpty(txtNewsDateTime.Text))
                {
                    throw new Exception("Please enter News date and time");
                }

                filename = GetUploadedImage(fn);

                int effectedRows = 0;
                string query = @"UPDATE [dbo].[tbl_NewsSlider]
                                       SET [NewsTitle] = @NewsTitle,				 
                                          [ImgTitle] = @ImgTitle,					 
                                          [Description] = @Description,			 
                                          [NewsDateTime] = @NewsDateTime,			 
                                          [NewsBanner] = @NewsBanner,				 
                                          [NewsCategory] = @NewsCategory,			 
                                          [NewsCountry] = @NewsCountry,			 
                                          [NewsState] = @NewsState,				 
                                          [NewsCity] = @NewsCity,					 
                                          [NewsDistrict] = @NewsDistrict,		 
                                          [UpdatedDateTime] = getdate(),	 
                                          [UpdatedBy] = @UpdatedBy,				 
                                          [IsActive] = @IsActive				 
                                     WHERE 											 
                                     NewsId = @NewsId";

                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@NewsId", sliderId.Trim());
                        cmd.Parameters.AddWithValue("@NewsTitle", txtNewsTitle.Text.Trim());
                        cmd.Parameters.AddWithValue("@ImgTitle", txtImgTitle.Text.Trim());
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@NewsDateTime", txtNewsDateTime.Text.Trim());
                        if (!string.IsNullOrEmpty(filename))
                        {
                            cmd.Parameters.AddWithValue("@NewsBanner", filename);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@NewsBanner", lblBanerImage.Text.Trim());
                        }
                        cmd.Parameters.AddWithValue("@NewsCategory", drpNewsCategory.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@NewsCountry", txtNewsCountry.Text.Trim());
                        cmd.Parameters.AddWithValue("@NewsState", txtNewsState.Text.Trim());
                        cmd.Parameters.AddWithValue("@NewsCity", txtNewsCity.Text.Trim());
                        cmd.Parameters.AddWithValue("@NewsDistrict", txtNewsDistrict.Text.Trim());
                        cmd.Parameters.AddWithValue("@UpdatedBy", Convert.ToString(Session["UserEmail"]));

                        if (Convert.ToString(Session["Roles"]).ToLower().Equals("admin"))
                        {
                            cmd.Parameters.AddWithValue("@IsActive", drpIsActive.SelectedValue.Trim());
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@IsActive", "InActive");
                        }
                        cmd.Connection = con;
                        con.Open();
                        effectedRows = cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }


                if (effectedRows > 0)
                {
                    txtDescription.Text = "";
                    txtImgTitle.Text = "";
                    txtNewsCity.Text = "";
                    txtNewsCountry.Text = "";
                    txtNewsDateTime.Text = "";
                    txtNewsDistrict.Text = "";
                    txtNewsState.Text = "";
                    txtNewsTitle.Text = "";



                    lblErrorGreen.Text = $"Success: Slider news has been updated in slidebar.";
                    dangerDiv.Visible = false;
                    sucessDiv.Visible = true;

                    int milliseconds = 2000;
                    Thread.Sleep(milliseconds);
                    Response.Redirect("ManageSlider");
                }
            }
            catch (Exception ex)
            {
                lblErrorRed.Text = $"Error: {ex.Message}";
                dangerDiv.Visible = true;
                sucessDiv.Visible = false;
            }
            finally
            {
                GC.WaitForPendingFinalizers();
                GC.WaitForFullGCComplete();
                GC.Collect();
                if (File.Exists(Server.MapPath("../themes/news slider/data1/images/") + fn))
                {
                    File.Delete(Server.MapPath("../themes/news slider/data1/images/") + fn);
                }
            }
        }


    }
}