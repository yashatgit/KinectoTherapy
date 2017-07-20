using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class ForgotPassword : System.Web.UI.Page
{
    String constring = Connections.GetConnectionString(); //"Data Source=10.100.90.48,1433;Network Library=DBMSSOCN;Initial Catalog=imagine;User ID=sa;Password=123";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(constring);
            try
            {
                DropDownList1.Items.Add(new ListItem("Patient", "0"));
                DropDownList1.Items.Add(new ListItem("Doctor", "1"));
                con.Open();
                SqlCommand com = new SqlCommand("select * from question", con);
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    DropDownList2.Items.Add(new ListItem(dr[1].ToString(), dr[0].ToString()));
                }
            }
            catch (Exception eds)
            {
                Response.Write("Oops some error occur, we'll fix it soon. Try again later");
                con.Close();
            }
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(constring);
        try
        {
            con.Open();
            String tablename = "";
            if (DropDownList1.SelectedIndex == 0)
                tablename = "patient_master";
            else
                tablename = "doctor_master";
            String username = TextBox1.Text;
            String qid = DropDownList2.SelectedValue;
            String ans = TextBox2.Text;
            String query = "select * from " + tablename + " where username='" + username + "' and qid=" + qid + " and ans='" + ans + "'";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
            {
                Label1.Text = "Your password is : " + dr["password"].ToString();
                //SendMail(dr[0].ToString(),"Password recovery", "Your password is : "+dr["password"].ToString());
            }
            else
            {
                Label1.Text = "Information you provided is not correct";
            }
        }
        catch (Exception e1)
        {
            Response.Write("Oops some error occur, we'll fix it soon. Try again later");
            Response.Write(e1.ToString());
            con.Close();
        }
    }

    public void SendMail(string toList,string subject, string body)
    {
        String from = "kinectotherapy@gmail.com";
        MailMessage message = new MailMessage();
        SmtpClient smtpClient = new SmtpClient();
        string msg = string.Empty;
        MailAddress fromAddress = new MailAddress(from);
        message.From = fromAddress;
        message.To.Add(toList);
        message.Subject = subject;
        message.IsBodyHtml = true;
        message.Body = body;
        smtpClient.Host = "smtp.gmail.com";
        smtpClient.Port = 587;
        smtpClient.EnableSsl = true;
        smtpClient.UseDefaultCredentials = true;
        smtpClient.Credentials = new System.Net.NetworkCredential(from, "kinect123");
        smtpClient.Send(message);
        msg = "Successful<BR>";
    }
}