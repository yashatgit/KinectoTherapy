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
public partial class Default5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*String username = Request.QueryString["username"];
        String datime = Request.QueryString["date1"];
        String datime2 = Request.QueryString["date2"];
        String str = Connections.GetConnectionString();
        SqlConnection con = new SqlConnection(str);
        SqlDataAdapter da = new SqlDataAdapter("SELECT datime, score FROM game WHERE username ='" + username + "' AND datime >= '" + datime + "' AND datime <'" + datime2 + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataTable dt = ds.Tables[0];
        Chart1.DataSource = ds;
        Chart1.DataBind();*/

        if (Request.QueryString["game_id"] != null)
        {
            if (Request.QueryString["game_id"].Equals("2"))
            {
                Chart1.Series["Series1"].YValueMembers = "score";
            }
            if (Request.QueryString["game_id"].Equals("1"))
            {
                Chart1.Series["Series1"].YValueMembers = "score";
            }

            
        }

    }
    public void showmessage()
    {
        if (Session["patientname"] != null)
        {
            SqlConnection con = new SqlConnection(Connections.GetConnectionString());
            con.Open();
            String username = Request.QueryString["username"];
            String date1 = Request.QueryString["date1"];
            String date2 = Request.QueryString["date2"];
            String game_id = Request.QueryString["game_id"];
            String query = "select avg(score) from game where username='" + username + "' and (datime>='" + date1 + "' and datime<='" + date2 + "')";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
            {
                float n = float.Parse(dr[0].ToString());
                if (n > 75)
                    Response.Write("<h3>Bravo! Amazing progress! Keep going! </h3>");
                else if (n > 50)
                    Response.Write("<h3>You are well above the average! Congrats! Exceptional work!</h3>");
                else if (n > 25)
                    Response.Write("<h3>Way to go! Looks like you are improving! keep it up!</h3>");
                else
                    Response.Write("<h3>Way to go! You are doing very well for a beginner!</h3>");
            }
        }

    }
}
