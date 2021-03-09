using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddBrand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindBrandRepeater();
        }
    }

    private void BindBrandRepeater()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["digistore"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblBrands",con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrBrands.DataSource = dt;
                    rptrBrands.DataBind();
                }
            }
        }
    }

    protected void btnAddBrand_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["digistore"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tblBrands(Name) values ('" + txtBrand.Text + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Brand Successfully Added') </script>");
            txtBrand.Text = String.Empty;
            con.Close();
            txtBrand.Focus();
            //Label1.Text = "Registeration Successfully Done";
            //Label1.ForeColor = System.Drawing.Color.Green;
        }
    }
}