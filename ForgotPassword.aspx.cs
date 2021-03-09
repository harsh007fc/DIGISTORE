using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;

public partial class ForgotPassword :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["digistore"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblusers where Email=@Email", con);
            cmd.Parameters.AddWithValue("@Email", txtEmailId.Text);
            
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if(dt.Rows.Count!=0)
            {
                string myGUID = Guid.NewGuid().ToString();
                int Uid = Convert.ToInt32(dt.Rows[0][0]);
                SqlCommand cmd1 = new SqlCommand("Insert into ForgotPass(Id,Uid,RequestDateTime) values('" + myGUID + "','" + Uid + "',GETDATE())", con);
                cmd1.ExecuteNonQuery();


                //Send email to account module starts
                String ToEmailAddress = dt.Rows[0][3].ToString();
                String Username = dt.Rows[0][1].ToString();
                String EmailBody = "Hi,"+Username+ ",<br/><br/> Click the given link to reset your password <br/><br/> http://localhost:53724/RecoveryPass.aspx?Id="+myGUID;

                MailMessage PassRecMail = new MailMessage("harshsharmalappy@gmail.com", ToEmailAddress);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";
                //SmtpClient SMTP= new SmtpClient("smtp.gmail.com",587);
                //SMTP.Credentials = new NetworkCredential()
                //{
                //   UserName = "harshsharmalappy@gmail.com",
                //   Password = "Password"
                ///};
                //SMTP.EnableSsl = true;
                //SMTP.Send(PassRecMail);
                using (SmtpClient client = new SmtpClient())
                {
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("harshsharmalappy@gmail.com", "badattitude");
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;

                    client.Send(PassRecMail);
                }

                ///Send email to account module ends
                lblForgotPassMsg.Text = "Reset Link Sent To Your Email";
                lblForgotPassMsg.ForeColor = System.Drawing.Color.Green;
                txtEmailId.Text = String.Empty;
            }
            else
            {
                lblForgotPassMsg.Text = "This Email Doesn't Exists";
                lblForgotPassMsg.ForeColor = System.Drawing.Color.Red;
                txtEmailId.Text = String.Empty;
                txtEmailId.Focus();
            }
        }
    }
}