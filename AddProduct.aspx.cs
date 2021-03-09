using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class AddProduct : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["digistore"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindBrand();
            BindCategory();
            ddlSubCategory.Enabled = false;
        }
    }

    private void BindCategory()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblCategory", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlCategory.DataSource = dt;
                ddlCategory.DataTextField = "CatName";
                ddlCategory.DataValueField = "CatID";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }

    private void BindBrand()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblBrands", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlBrand.DataSource = dt;
                ddlBrand.DataTextField = "Name";
                ddlBrand.DataValueField = "BrandID";
                ddlBrand.DataBind();
                ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("sp_InsertProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PName",txtProductName.Text);
            cmd.Parameters.AddWithValue("@PPrice",txtPrice.Text);
            cmd.Parameters.AddWithValue("@PselPrice",txtSellPrice.Text);
            cmd.Parameters.AddWithValue("@PBrandId",ddlBrand.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PCategoryID",ddlCategory.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PSubcategoryID",ddlSubCategory.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PDescription",txtDescription.Text);
            cmd.Parameters.AddWithValue("@PproductDetails",txtPDetail.Text);
            if (chFd.Checked == true)
            {
                cmd.Parameters.AddWithValue("@FreeDelivery",1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString());
            }
            if (ch30Ret.Checked == true)
            {
                cmd.Parameters.AddWithValue("@30DayRet",1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@30DayRet", 0.ToString());
            }
            if (cbCOD.Checked == true)
            {
                cmd.Parameters.AddWithValue("@COD",1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@COD", 0.ToString());
            }
            con.Open();
            Int64 PID = Convert.ToInt64(cmd.ExecuteScalar ());


            ///insert  quantity
            for (int i = 0; i < ddlCategory.Items.Count; i++)
            {
                if (ddlCategory.Items[i].Selected == true)
                {
                    Int64 CatId = Convert.ToInt64(ddlCategory.Items[i].Value);
                    int Quantity = Convert.ToInt32(txtQuantity.Text);

                    SqlCommand cmd2 = new SqlCommand("insert into tblProductQuantity values('" + CatId + "','" + PID + "','" + Quantity + "')", con);
                    cmd2.ExecuteNonQuery();
                }
            }
            //insert and upload images
            if (fuImg01.HasFile)
            {
                string SavePath = Server.MapPath("~/Mobile/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "01" + Extention);

                SqlCommand cmd3 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "01" + "','" + Extention + "')", con);
                cmd3.ExecuteNonQuery();
            }
            //2nd fileupload
            if (fuImg02.HasFile)
            {
                string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                fuImg02.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "02" + Extention);

                SqlCommand cmd4 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "02" + "','" + Extention + "')", con);
                cmd4.ExecuteNonQuery();
            }
            //3rd file upload 
            if (fuImg03.HasFile)
            {
                string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                fuImg03.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "03" + Extention);

                SqlCommand cmd5 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "03" + "','" + Extention + "')", con);
                cmd5.ExecuteNonQuery();
            }
            //4th file upload control
            if (fuImg04.HasFile)
            {
                string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extention = Path.GetExtension(fuImg04.PostedFile.FileName);
                fuImg04.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "04" + Extention);

                SqlCommand cmd6 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "04" + "','" + Extention + "')", con);
                cmd6.ExecuteNonQuery();
                clr();
            }
        }
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSubCategory.Enabled = true;
        int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblSubCategory where MainCatId='" + ddlCategory.SelectedItem.Value + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlSubCategory.DataSource = dt;
                ddlSubCategory.DataTextField = "SubCatName";
                ddlSubCategory.DataValueField = "SubCatID";
                ddlSubCategory.DataBind();
                ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }

    public void clr()
    {
        txtProductName.Text = String.Empty;
        txtSellPrice.Text = String.Empty;
        txtPrice.Text = String.Empty;
        txtQuantity.Text = String.Empty;
        txtDescription.Text = String.Empty;
        txtPDetail.Text = String.Empty;
        //ddlBrand.SelectedValue = sele;
        //ddlCategory.Text = String.Empty;
        //ddlSubCategory.Text = String.Empty;
        chFd.Checked = false;
        cbCOD.Checked = false;
        ch30Ret.Checked = false;
        
    }
}