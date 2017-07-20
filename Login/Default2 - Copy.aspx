<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sign-In Page</title>

    <link rel="stylesheet" type="text/css" href="css/csss/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/csss/bootstrap-responsive.css" />
    <link rel="stylesheet" href="css/global.css">

        <!-- Styles -->
        <style type="text/css">
            /* Override some defaults */
            html, body {
                background-color: #eee;
				background-image:url(img/bg1.png);
            }
            
            .container-fluid > footer p {
                text-align: center; /* center align it with the container-fluid */
            }
            

            /* The white background content wrapper */
            .content {
                background-color: #fff;
                padding: 20px;
                margin: 0 -20px; /* negative indent the amount of the padding to maintain the grid system */
                -webkit-border-radius: 0 0 6px 6px;
                -moz-border-radius: 0 0 6px 6px;
                border-radius: 0 0 6px 6px;
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
            }

            /* Page header tweaks */
            .page-header {
                background-color: #f5f5f5;
                padding: 20px 20px 10px;
                margin: -20px -20px 20px;
            }

            
        </style>


<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/mosaic.1.0.1.js"></script>
<script type="text/javascript" src="js/bootstrap-modal.js"></script>
<script type="text/javascript" src="js/bootstrap-collapse.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
</head>
<body>
        <div class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container-fluid">
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
              	        </a>
                        <a class="brand" href="home.html">KinectoTherapy</a>
                        <div class="nav-collapse" style="height:0px;">
    	                    <ul class="nav">
                                  <li><a href="home.html">Home</a></li>
                                  <li><a href="games.html">Games</a></li>
                                  <li><a href="about.html">About</a></li>
                                  <li><a href="contactus.html">Contact Us</a></li>
                            </ul>
                    
                            <p class="navbar-text pull-right"><a href="Default2.aspx">Sign-In</a></p>
                        </div><!--/.nav-collapse -->
                    
                    </div>
                </div>
            </div>
    <form id="form1" runat="server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  
        <div class="container-fluid">       
        <div class="container">
            <div class="hero-unit" style="height:auto; background-color:#FFF;"> 
            	<div class="row-fluid">
                	<div class="span12" >
                        <div align="center">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" Width="279px">
                            <asp:ListItem Selected="True">Sign in as patient</asp:ListItem>
                            <asp:ListItem>Sign in as doctor</asp:ListItem>
                        </asp:DropDownList>
        
                        <asp:Login CssClass="well" ID="Login1" runat="server"  
                    BorderStyle="None" Font-Names="Verdana" 
                    ForeColor="#333333" onauthenticate="Login1_Authenticate" 
                    RememberMeText="Remember me"
                    CreateUserText="Sign Up"
                    CreateUserUrl="Default.aspx"
                    InstructionText="Please enter your user name and password for login."
                    >
                    <TextBoxStyle/>
           
                    <LayoutTemplate>
                        <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;" >
                            <tr>
                                <td>
                                    <table cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2" 
                                                style="color:black;font-weight:bold; height:40px;">
                                                Log In<br></td>
                                        </tr>
                                        
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                    ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                                    ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn" 
                                                    Text="Log In" ValidationGroup="Login1" />
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
           
                    <LoginButtonStyle CssClass="btn" />
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                        ForeColor="White" />
          
                </asp:Login>



                <asp:Login CssClass="well" ID="Login2" runat="server"  
                    BorderStyle="None" Font-Names="Verdana" 
                    ForeColor="#333333" onauthenticate="Login1_Authenticate" 
                    RememberMeText="Remember me"
                    CreateUserText="Sign Up"
                    CreateUserUrl="Default.aspx"
                    InstructionText="Please enter your user name and password for login."
                    >
                    <TextBoxStyle/>
           
                    <LayoutTemplate>
                        <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;" >
                            <tr>
                                <td>
                                    <table cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2" 
                                                style="color:black;font-weight:bold; height:40px;">
                                                Log In<br></td>
                                        </tr>
                                        
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                    ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                                    ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn" 
                                                    Text="Log In" ValidationGroup="Login1" />
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
           
                    <LoginButtonStyle CssClass="btn" />
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                        ForeColor="White" />
          
                </asp:Login>
                        </div>

                        </div><!-- span12 div ends -->
                </div><!-- row-fluid div ends -->
                
           </div><!-- hero-unit div ends -->       
        </div><!-- Content div ends -->
        <footer class="footer">
            <div class="container-fluid">
                <p>
                &copy; KinectoTherapy 2012 &nbsp; &nbsp; <a href="home.html">Home</a> | <a href="games.html">Games</a> | <a href="about.html">About</a> | <a href="contactus.html">ContactUs</a>
                </p>
            </div>
       </footer>
     </div><!-- main Container-fluid div ends -->
    </form>
</body>
</html>
