using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Web.UI;


namespace onlinenews.Admin
{
    public partial class AddSlider : System.Web.UI.Page
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
                if (Session["UserEmail"] is null)
                {
                    Session["UserEmail"] = "ajaynath.be@gmail.com";
                }
            }
        }
        protected string GetUploadedImage(string fn)
        {
            string filename = string.Empty;

            Guid uid = Guid.NewGuid();

            string SaveLocation = Server.MapPath("../themes/news slider/data1/images/") + uid + fn;
            string TempSaveLocation = Server.MapPath("../themes/news slider/data1/images/") + fn;

            if (flNewsBanner.PostedFile != null)
            {

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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string filename = string.Empty;

            string fn = System.IO.Path.GetFileName(flNewsBanner.PostedFile.FileName);

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
                string query = @"INSERT INTO [dbo].[tbl_NewsSlider](NewsTitle
           , ImgTitle
           , Description
           , ShortDescription
           , NewsDateTime
           , NewsBanner
           , NewsCategory
           , NewsCountry
           , NewsState
           , NewsCity
           , NewsDistrict
           , CreatedDateTime
           , CreatedBy 
           , IsActive)
     VALUES
           (@NewsTitle
           , @ImgTitle
           , @Description
           , @ShortDescription
           , @NewsDateTime
           , @NewsBanner
           , @NewsCategory
           , @NewsCountry
           , @NewsState
           , @NewsCity
           , @NewsDistrict
           ,getdate()
           , @CreatedBy 
           , @IsActive)";

                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@NewsTitle", txtNewsTitle.Text.Trim());
                        cmd.Parameters.AddWithValue("@ImgTitle", txtImgTitle.Text.Trim());
                        cmd.Parameters.AddWithValue("@ShortDescription", txtShortDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@NewsDateTime", txtNewsDateTime.Text.Trim());
                        cmd.Parameters.AddWithValue("@NewsBanner", filename);
                        cmd.Parameters.AddWithValue("@NewsCategory", drpNewsCategory.SelectedValue.Trim());
                        cmd.Parameters.AddWithValue("@NewsCountry", txtNewsCountry.Text.Trim());
                        cmd.Parameters.AddWithValue("@NewsState", txtNewsState.Text.Trim());
                        cmd.Parameters.AddWithValue("@NewsCity", txtNewsCity.Text.Trim());
                        cmd.Parameters.AddWithValue("@NewsDistrict", txtNewsDistrict.Text.Trim());
                        cmd.Parameters.AddWithValue("@CreatedBy", Convert.ToString(Session["UserEmail"]));

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
                    


                    lblErrorGreen.Text = $"Success: Slider news has been added in slidebar.";
                    dangerDiv.Visible = false;
                    sucessDiv.Visible = true;
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