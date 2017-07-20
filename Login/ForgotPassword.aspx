<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LoginPage</title>

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
    <div class="container-fluid">       
        <div class="container">
            <div class="hero-unit" style="height:auto; background-color:#FFF;"> 
            	<div class="row-fluid">
                	<div class="span12" >
    
                        <table>
    
    <tr>
    <td>You are: </td>
    <td>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
    </td>
    </tr>

    <tr>
    <td>Username: </td>
    <td>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
    </tr>

    <tr>
    <td>Select Security Question: </td>
    <td>
        <asp:DropDownList ID="DropDownList2" runat="server">
        </asp:DropDownList>
    </td>
    </tr>

    <tr>
    <td>Enter Answer: </td>
    <td>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
    </tr>

    <tr>
    
    <tr>
    <td colspan=2>
        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Retrive Password" 
            onclick="Button1_Click1" />
        </td>
    </tr>

    <td colspan=2>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
    </tr>

    </table>
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
