using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Data.Common;

public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.Cookies["UNAME"]!=null && Request.Cookies["UPWD"]!=null)
            {
                txtUsername.Text = Request.Cookies["UNAME"].Value;
                txtPass.Text = Request.Cookies["UPWD"].Value;
                CheckBox1.Checked = true;
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["digistore"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblusers where Username=@username and Password=@pwd", con);
            cmd.Parameters.AddWithValue("@username",txtUsername.Text);
            cmd.Parameters.AddWithValue("@pwd", txtPass.Text);
            SqlDataAdapter sda =new  SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count!=0)
            {
                if(CheckBox1.Checked)
                {
                    Response.Cookies["UNAME"].Value = txtUsername.Text;
                    Response.Cookies["UPWD"].Value = txtPass.Text;

                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(20);
                    Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(20);
                }
                else
                {
                    Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(-1);
                }
                //Session["Username"] = txtUsername.Text;
                //Response.Redirect("~/UserHome.aspx");
                string Utype;
                Utype = dt.Rows[0][5].ToString().Trim();
                if(Utype=="User")
                {
                    Session["Username"] = txtUsername.Text;
                    Response.Redirect("~/UserHome.aspx");
                }
                if (Utype == "Admin")
                {
                    Session["Username"] = txtUsername.Text;
                    Response.Redirect("~/AdminHome.aspx");
                }
            }
            else
            {
                lblerror.Text = "Invalid Username or Password";
            }
            //Response.Write("<script> alert('Registeration Successfully Done') </script>");
            clr();
            con.Close();
            //Label1.Text = "Login Successful";
            //Label1.ForeColor = System.Drawing.Color.Green;
        }
    }

    private void clr()
    {
        txtPass.Text = String.Empty;
        txtUsername.Text = String.Empty;
        txtUsername.Focus();
    }
}