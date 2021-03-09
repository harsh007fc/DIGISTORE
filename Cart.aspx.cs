using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;

public partial class Cart : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["digistore"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            BindProductCart();
        }
    }

    private void BindProductCart()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            DataTable dt = new DataTable();
            string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
            Int64 CartTotal = 0;
            Int64 Total = 0;
            string[] CookieDataArray = CookieData.Split(',');
            if(CookieDataArray.Length > 0)
            {
                h4Noitems.InnerText = "MY CART (" + CookieDataArray.Length + " Items)";
                for (int i = 0; i < CookieDataArray.Length; i++)
                {
                    string PID = CookieDataArray[i].ToString().Split('-')[0];
                    string catID = CookieDataArray[i].ToString().Split('-')[1];


                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        using (SqlCommand cmd = new SqlCommand("select A.*,dbo.getCatName(" + catID + ") as CatNamee,"
                                       + catID + " as CatIDD,CatData.Name,CatData.Extention from tblProducts A cross apply( select top 1 B.Name,Extention from tblProductImages B where B.PID=A.PID ) CatData where A.PID="
                                       + PID + "", con))
                        {
                            cmd.CommandType = CommandType.Text;
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                
                                sda.Fill(dt);
                            }
                        }
                    }
                    CartTotal += Convert.ToInt64(dt.Rows[i]["PPrice"]);
                    Total += Convert.ToInt64(dt.Rows[i]["PSelPrice"]);
                }
                rptrCartProducts.DataSource = dt;
                rptrCartProducts.DataBind();
                divpricedetails.Visible = true;
                spanCartTotal.InnerText = CartTotal.ToString();
                spanTotal.InnerText = "Rs. " + Total.ToString();
                spanDiscount.InnerText = "- " + (CartTotal - Total).ToString();

            }
            else
            {
                h4Noitems.InnerText = "Your Shopping Cart is Empty";
                divpricedetails.Visible = false;
            }
        }
        else
        {

            h4Noitems.InnerText = "Your Shopping Cart is Empty";
            divpricedetails.Visible = false;
        }
    }

    protected void btnRemoveItem_Click(object sender, EventArgs e)
    {

    }

    protected void btnBuyNow_Click(object sender, EventArgs e)
    {

    }
}