using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
   protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["doctorname"] != null || Session["patientname"] != null)
            Response.Redirect("Default3.aspx");
        if (!this.IsPostBack)
            ViewState["LoginErrors"] = 0;
        Response.Write(Request.QueryString["er"]);
    }
 
   protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if (YourValidationFunction(Login1.UserName, Login1.Password))
        {
           // e.Authenticated = true;
            Login1.Visible = false;
            if (DropDownList1.SelectedIndex == 1)
            {
                Session["doctorname"] = Login1.UserName;
                Response.Redirect("Default3.aspx");
            }
            else
            {
                Session["patientname"] = Login1.UserName;
                Response.Redirect("profile.aspx");
            }
            
        }
        else
        {
            e.Authenticated = false;
        }
    }
   
  
 protected void Login1_LoginError(object sender, EventArgs e)
    {
        if (ViewState["LoginErrors"] == null)
            ViewState["LoginErrors"] = 0;
 
        int ErrorCount = (int)ViewState["LoginErrors"] + 1;
        ViewState["LoginErrors"] = ErrorCount;
 
        if ((ErrorCount > 3) && (Login1.PasswordRecoveryUrl != string.Empty))
            Response.Redirect(Login1.PasswordRecoveryUrl);
    }
 
 private bool YourValidationFunction(string UserName, string Password)
    {
        String tab;
        if (DropDownList1.SelectedIndex == 0)
        {
            tab = "patient_master";
        }
        else
        {
            tab = "doctor_master";
        }
        bool boolReturnValue = false;
        string strConnection = Connections.GetConnectionString();
        SqlConnection sqlConnection = new SqlConnection(strConnection);
        String SQLQuery = "select username, password from "+ tab;
        SqlCommand command = new SqlCommand(SQLQuery, sqlConnection);
        SqlDataReader Dr;
        sqlConnection.Open();
        Dr = command.ExecuteReader();
        
            while (Dr.Read())
            {
                if ((UserName == Dr["username"].ToString()) & (Password == Dr["password"].ToString()))
                {
                    boolReturnValue = true;
                    break;
                }
                
            }
            Dr.Close();
            return boolReturnValue;
        
    }
}

