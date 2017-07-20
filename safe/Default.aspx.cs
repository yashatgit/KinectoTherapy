using System;
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

public partial class _Default : System.Web.UI.Page 
{
    SqlConnection con;
    String tab;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
            Response.Redirect("AdminLogin.aspx");
        ListBox1.Visible = false;
        con = new SqlConnection(Connections.GetConnectionString());
    }

    protected void TextBox5_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            if (RadioButtonList2.SelectedIndex == 0)
            {
                tab = "patient_master";
            }
            else
            {
                tab = "doctor_master";
            }
            SqlCommand com = new SqlCommand("insert into " + tab + " values(@username,@name,@age,@gender,@password)", con);
            com.Parameters.AddWithValue("@username", TextBox1.Text);
            com.Parameters.AddWithValue("@name", TextBox2.Text);
            com.Parameters.AddWithValue("@age", TextBox3.Text);
            com.Parameters.AddWithValue("@gender", RadioButtonList1.SelectedValue.Substring(0, 1));
            com.Parameters.AddWithValue("@password", TextBox4.Text);
            com.ExecuteNonQuery();
            SqlCommand com1 = new SqlCommand("insert into patient_doctor values(@user_patient,@user_doctor)", con);
            for (int j = 0; j < ListBox1.Items.Count; j++)
            {

                if (ListBox1.Items[j].Selected)
                {
                    com1.Parameters.AddWithValue("@user_patient", TextBox1.Text);
                    com1.Parameters.AddWithValue("@user_doctor", ListBox1.Items[j].ToString());
                    com1.ExecuteNonQuery();
                    com1.Parameters.Clear();

                }
            }
            Response.Redirect("Default2.aspx");



            con.Close();
        }
        catch(Exception ee)
        {
            Response.Write(ee.ToString());
        }
    }
   
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand com = new SqlCommand("select username from doctor_master", con);
        SqlDataReader da = com.ExecuteReader();
        if (RadioButtonList2.SelectedIndex == 0)
        {
            try
            {
                ListBox1.Visible = true;
                Label1.Visible = true;


                while (da.Read())
                {
                    
                    ListBox1.Items.Add(da.GetString(0));
                }
                con.Close();
            }
            catch (Exception ed) {}
        }
        else
        {
            ListBox1.Visible = false;
            ListBox1.Items.Clear();
            Label1.Visible = false;
            
        }
        con.Close();
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
