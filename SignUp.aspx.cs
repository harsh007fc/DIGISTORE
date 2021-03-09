using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void txtsignup_Click(object sender, EventArgs e)
    {
        if(isformvalid())
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["digistore"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tblusers(Username,Password,Email,Name,Usertype) values ('" + txtUname.Text + "','" + txtPass.Text + "','" + txtEmail.Text + "','" + txtName.Text + "','User')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script> alert('Registeration Successfully Done') </script>");
                clr();
                con.Close();
                Label1.Text = "Registeration Successfully Done";
                Label1.ForeColor =System.Drawing.Color.Green;
            }
            //Response.Redirect("~/SignIn.aspx");
        }
        else
        {
            Response.Write("<script> alert('Registeration Unsuccessful') </script>");
            Label1.Text = "All Fields Are Mandatory";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
    }

    private bool isformvalid()
    {
        if(txtUname.Text=="")
        {
            Response.Write("<script> alert('USERNAME NOT VALID') </script>");
            txtUname.Focus();
            return false;
        }
        else if(txtPass.Text=="")
        {
            Response.Write("<script> alert('PASSWORD NOT VALID') </script>");
            txtPass.Focus();
            return false;
        }
        else if (txtPass.Text != TxtCPass.Text)
        {
            Response.Write("<script> alert('PASSWORD  DOES NOT MATCH') </script>");
            TxtCPass.Focus();
            return false;
        }
        else if (txtEmail.Text == "")
        {
            Response.Write("<script> alert('ENTER VALID EMAIL') </script>");
            txtEmail.Focus();
            return false;
        }
        else if (txtName.Text == "")
        {
            Response.Write("<script> alert('NAME CANT BE EMPTY') </script>");
            txtName.Focus();
            return false;
        }
        return true;
    }
    public void clr()
    {
        txtUname.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtName.Text = string.Empty;
        txtPass.Text = string.Empty;
        TxtCPass.Text = string.Empty;
    }
}