using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {
        String constring = Connections.GetConnectionString();
        con = new SqlConnection(constring);
        if (Session["doctorname"] == null && Session["patientname"] == null)
        {
            //Response.Write("You must login to view this page");
            //Response.Write("<br><a href=\"Default2.aspx\">Click here to login</a>");
            Response.Redirect("Default2.aspx");
        }
        else
        {
            Response.Write("<a href=\"Default4.aspx\">LogOut</a>");
        }
        if (!IsPostBack)
        {
            for (int i = 2010; i < DateTime.Now.Year+3; i++)
            {
                DropDownList1.Items.Add(i.ToString());
                DropDownList4.Items.Add(i.ToString());
            }
            for (int i = 1; i < 13; i++)
            {
                if (i < 10)
                {
                    DropDownList2.Items.Add("0" + i.ToString());
                    DropDownList5.Items.Add("0" + i.ToString());
                }
                else
                {
                    DropDownList2.Items.Add(i.ToString());
                    DropDownList5.Items.Add(i.ToString());
                }
                
            }
            for (int i = 1; i < 32; i++)
            {
                if (i < 10)
                {
                    DropDownList3.Items.Add("0" + i.ToString());
                    DropDownList6.Items.Add("0" + i.ToString());
                }
                else
                {
                    DropDownList3.Items.Add(i.ToString());
                    DropDownList6.Items.Add(i.ToString());
                }

            }
        }
    }
    public void showname()
    {
        String table = "";
        string username = "";
        if (Session["doctorname"] != null)
        {
            table = "doctor_master";
            username = Session["doctorname"].ToString();
        }
        else
        {
            table = "patient_master";
            username = Session["patientname"].ToString();
        }
        SqlDataAdapter da = new SqlDataAdapter("select * from "+table+ " where username ='"+username+"'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataTable dt = ds.Tables[0];
            if(dt.Rows.Count>0)
                Response.Write("<h3>Welcome, " + dt.Rows[0]["name"] + "! </h3>");
    }
    public void ShowPL()
    {
        try
        {
            if (Session["doctorname"] == null)
            {
                return;
            }
            String doctorname = Session["doctorname"].ToString();
                        
            SqlDataAdapter da = new SqlDataAdapter("select * from patient_master where username in (select user_patient from patient_doctor where user_doctor='" + doctorname + "')", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            Response.Write("<td style=\"align:center height:50px;\" border=\"0\" valign=\"top\" class=\"well\"><h4>Patient's name</h4>");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Response.Write("<li><a href=\"?username=" + dt.Rows[i][0] + "\">" + dt.Rows[i][1].ToString() + "</a>");
                Response.Write("<br>");
            }
            Response.Write("</td>");
        }
        catch (Exception e)
        {
            Response.Write(e.Message);
        }
    }
    public void ShowLog()
    {
        String query = "";
        try
        {
            string username = "";
            if (Request.QueryString.Get("username") != null)
                username = Request.QueryString.Get("username");
            else if (Session["patientname"] != null)
                username = Session["patientname"].ToString();
            else if (Session["patientname"] == null)
                return;
            String date1 = DropDownList1.Text + "-" + DropDownList2.Text + "-" + DropDownList3.Text;
            String date2 = DropDownList4.Text + "-" + DropDownList5.Text + "-" + DropDownList6.Text;
            //Response.Write(date1 + "   " + date2);
            query = "select * from game where username='" + username + "' and (datime>='" + date1 + "' and datime<='" + date2 + "') order by game_id, datime";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            //SqlDataAdapter da = new SqlDataAdapter("select * from game where username='" + username + "' and datime>='" + date1 + "' and datime<='" + date2 + "' order by game_id, datime", con);
            //SqlDataAdapter da = new SqlDataAdapter("select * from game where username='"+username+"' order by game_id, datime", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            Response.Write("<table cellpadding=5 margin-left=100px  >");
            int i = 0;
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["game_id"].ToString().Equals("1"))
                {
                    Response.Write("<h3>Angle Game Data</h3>");
                    Response.Write("<table text-align=center class=table table-striped><tr><td>Date Time<td>Incorrect Attempts<td>Time taken<td>Score");
                    for (i = 0; i < dt.Rows.Count; i++)
                    {
                        if(dt.Rows[i]["game_id"].ToString().Equals("2"))
                            break;
                        Response.Write("<tr><td>" + dt.Rows[i]["datime"] + "<td>" + dt.Rows[i]["incorrect"] + "<td>" + dt.Rows[i]["timetaken"] + "<td>" + dt.Rows[i]["Score"]);
                    }
                    Response.Write("</table>");
                    string url_anglegame = "Default5.aspx?username=" + username + "&date1=" + date1 + "&date2=" + date2 + "&game_id=1";
                    //Response.Write("<a href=\"Default5.aspx?username=" + username + "&date1=" + date1 + "&date2=" + date2 + "&game_id=1\">Show Graph of Angle Game</a>");
                    Response.Write("<input type=button class=btn-primary value=\"View Graph\"  onclick=window.location=\"" + url_anglegame + "\">");
                }
                


                if (i < dt.Rows.Count)
                {
                    Response.Write("<br><br><h3>Top View Data</h3>");
                    Response.Write("<table text-align=center class=table table-condensed table-bordered><tr><td>Date Time<td>Incorrect Attempts<td>Time taken<td>Score");
                    for (; i < dt.Rows.Count; i++)
                    {
                        Response.Write("<tr><td>" + dt.Rows[i]["datime"] + "<td>" + dt.Rows[i]["incorrect"] + "<td>" + dt.Rows[i]["timetaken"] + "<td>" + dt.Rows[i]["score"]);
                    }
                    Response.Write("</table>");
                    string url_topview = "Default5.aspx?username=" + username + "&date1=" + date1 + "&date2=" + date2 + "&game_id=2";
                    Response.Write("<input type=button class=btn-primary value=\"View Graph\"  onclick=window.location=\"" + url_topview + "\">");
                }
                //Response.Write(" <a href=\"Default5.aspx?username=" + username + "&date1=" + date1 + "&date2=" + date2 + "&game_id=2\">Show Graph of TopView Game</a>");
                
            }
            Response.Write("</table>");
            
        }
        catch (Exception e)
        {
            Response.Write(e.Message);
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string username = "";
        if (Request.QueryString.Get("username") != null)
            username = Request.QueryString.Get("username");
        else if (Session["patientname"] != null)
            username = Session["patientname"].ToString();
        else if (Session["patientname"] == null)
            return;
        String date1 = DropDownList1.Text + "-" + DropDownList2.Text + "-" + DropDownList3.Text;
        String date2 = DropDownList4.Text + "-" + DropDownList5.Text + "-" + DropDownList6.Text;
        Response.Write("<a href=\"Default5.aspx?username=" + username + "&date1=" + date1 + "&date2=" + date2 + "&game_id=1\">Show Graph of Angle Game</a>");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}