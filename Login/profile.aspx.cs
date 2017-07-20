using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
     
public partial class profile : System.Web.UI.Page
    
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        //{
        
           if ((Session["patientname"] != null))
          {
                string strConnection = Connections.GetConnectionString();
                String patient = Session["patientname"].ToString();
                con = new SqlConnection(Connections.GetConnectionString());
                con.Open();
                SqlCommand com = new SqlCommand("select name,age,contact,address,photo from patient_master where username='"+patient+"'", con);
                SqlDataReader dr = com.ExecuteReader();
                dr.Read();
                Response.Write(dr.GetString(0));
                Image1.ImageUrl = "photo/" + dr[4].ToString();
                Response.Write("photo/" + dr[4].ToString());
                BulletedList1.Items.Add("Name:   "+dr[0].ToString());
                BulletedList1.Items.Add("Age:    "+dr[1].ToString());
                BulletedList1.Items.Add("Contact number: "+dr[2].ToString());
                BulletedList1.Items.Add("Address:  "+dr[3].ToString());
                dr.Close();
                /*SqlCommand com1 = new SqlCommand("select datime,score from game where game_id=1 and username='"+patient+"'",con);
                SqlDataReader dr1 = com1.ExecuteReader();
                dr1.Read();
                
               
               SqlCommand com2 = new SqlCommand("select datime,score from game where game_id=2 and username='" + patient + "'", con);
                SqlDataReader dr2 = com2.ExecuteReader();
                dr2.Read();
                Chart2.Series["Series1"].XValueMember = dr2[0].ToString();
                Chart2.Series["Series1"].XValueMember = dr2[1].ToString();
                dr2.Close();*/
                con.Close();
          }
           //ChartArea2.AxisY.Maximum = 89;
        
        //catch (Exception e)
        //{}
        

        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default3.aspx");
    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}
