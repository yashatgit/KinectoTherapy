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
        con.Open();
        SqlCommand com = new SqlCommand("select ques from question", con);
        SqlDataReader dr = com.ExecuteReader();
        DropDownList1.Items.Clear();
        while (dr.Read())
        {
            DropDownList1.Items.Add(dr.GetString(0));
        }
        con.Close();
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
            string filename = DateTime.Now.ToString("yyyy-mm-dd hh-ss");
            con.Open();
            if (RadioButtonList2.SelectedIndex == 0)
            {
                tab = "patient_master";
            }
            else
            {
                tab = "doctor_master";
            }
            SqlCommand com = new SqlCommand("insert into " + tab + " values(@username,@name,@age,@gender,@password,@photo,@qid,@contact,@ans,@address)", con);
            com.Parameters.AddWithValue("@username", TextBox1.Text);
            com.Parameters.AddWithValue("@name", TextBox2.Text);
            com.Parameters.AddWithValue("@age", TextBox3.Text);
            com.Parameters.AddWithValue("@gender", RadioButtonList1.SelectedValue.Substring(0, 1));
            com.Parameters.AddWithValue("@password", TextBox4.Text);

            com.Parameters.AddWithValue("@qid", DropDownList1.SelectedIndex + 1);
            com.Parameters.AddWithValue("@contact", TextBox7.Text);
            com.Parameters.AddWithValue("@ans", TextBox6.Text);
            com.Parameters.AddWithValue("@address", TextBox8.Text);
            if (FileUpload1.HasFile)
            {
                if (System.IO.Path.GetExtension(FileUpload1.FileName) == ".jpg" || System.IO.Path.GetExtension(FileUpload1.FileName) == ".jpeg")
                {
                    com.Parameters.AddWithValue("@photo", filename + System.IO.Path.GetExtension(FileUpload1.FileName));
                    FileUpload1.SaveAs(Server.MapPath("~/photo/" + filename + System.IO.Path.GetExtension(FileUpload1.FileName)));
                }
                else
                {
                    Response.Write("Invalid File");
                }
            }
            else
            {
                com.Parameters.AddWithValue("@photo", "photo/no.jpg");
            }

            com.ExecuteNonQuery();
            SqlCommand com1 = new SqlCommand("insert into patient_doctor values(@user_patient,@user_doctor)", con);
            for (int j = 0; j < ListBox1.Items.Count; j++)
            {

                if (ListBox1.Items[j].Selected)
                {
                    com1.Parameters.AddWithValue("@user_patient", TextBox1.Text);
                    com1.Parameters.AddWithValue("@user_doctor", ListBox1.Items[j].Value);
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
        SqlCommand com = new SqlCommand("select * from doctor_master", con);
        SqlDataReader da = com.ExecuteReader();
        if (RadioButtonList2.SelectedIndex == 0)
        {
            try
            {
                ListBox1.Visible = true;
                Label1.Visible = true;

                //Response.Write("<BR><BR><BR><BR><BR>");
                while (da.Read())
                {
                    ListItem a = new ListItem(da.GetString(1), da.GetString(0));
                    //Response.Write(a.Value);
                    ListBox1.Items.Add(a);
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
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
