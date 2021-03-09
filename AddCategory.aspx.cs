using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCategoryRepeater();
    }

    private void BindCategoryRepeater()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["digistore"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblCategory", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrCategory.DataSource = dt;
                    rptrCategory.DataBind();
                }
            }
        }
    }

    protected void btnAddCategory_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["digistore"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tblCategory(CatName) values ('" + txtCategory.Text + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script> alert('Category Successfully Added') </script>");
            txtCategory.Text = String.Empty;
            con.Close();
            txtCategory.Focus();
            //Label1.Text = "Registeration Successfully Done";
            //Label1.ForeColor = System.Drawing.Color.Green;
        }
    }
}