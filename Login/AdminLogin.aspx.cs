using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String constring = Connections.GetConnectionString(); 
        SqlConnection con = new SqlConnection(constring);
        con.Open();
        SqlCommand com = new SqlCommand("select * from admin where username = '" + TextBox1.Text + "' and password = '" + TextBox2.Text + "'", con);
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            Session["admin"] = TextBox1.Text;
            Response.Redirect("Default.aspx");
        }
        else
        {
            Label1.Text = "Username or password is wrong";
        }
    }

    



}