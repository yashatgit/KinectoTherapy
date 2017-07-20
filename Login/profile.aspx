<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign-In</title>
    <link rel="stylesheet" type="text/css" href="css/csss/bootstrap-copy.css" />
    <link rel="stylesheet" type="text/css" href="css/csss/bootstrap-responsive.css" />
    <link rel="stylesheet" href="css/global.css" />

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
                    
                            <p class="navbar-text pull-right"><a href="Default4.aspx"><strong>Logout</strong></a></p>
                        </div><!--/.nav-collapse -->
                    
                    </div>
                </div>
            </div>
    <form id="form1" runat="server">
    <div class="container-fluid">       
        <div class="container">
            <div class="hero-unit" style="height:auto; background-color:#FFF;">
                <div class="row-fluid" style="height:auto">
                	<div class="span12" >
                        <h2 style="color:Green">Profile Page</h2><br />
                        <div class="row-fluid" style="height:auto">
                            <div class="span4 well" style="width:150px; height:150px; padding:10px;">                            
                                <asp:Image ID="Image1" runat="server" AlternateText="Error in loading image" 
                                   />
                            </div>
                            <div class="span8" style="text-decoration:none">
                                <asp:BulletedList ID="BulletedList1" runat="server">
                                </asp:BulletedList>
                            </div>
                            

                        </div>

                        <h3>Your ten best performances:</h3>
                        <div style=" width:650px; margin-right:auto; margin-left:auto;">
                        
                        
                        
                            <asp:Chart ID="Chart1" runat="server" BackImageTransparentColor="128, 64, 0" 
                                BackSecondaryColor="DimGray" BorderlineColor="DarkGray" Compression="5" DataSourceID="SqlDataSource1" 
                                Height="400px" Width="300px">
                                <Titles>
                                    <asp:Title Font="Arial, 12pt, style=Bold" ForeColor="Green" Name="Title1" Text="Exercise 1(Shoulder Angle)" Alignment= "BottomCenter" Docking="Bottom">
                                        </asp:Title>
                                </Titles>
                            <Series>
                                <asp:Series Name="Series1" XValueMember="datime" YValueMembers="score" LabelUrl="Game1"  >
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea BackColor="DarkGray" BackGradientStyle="Center" 
                                    BackImageTransparentColor="Silver" BackSecondaryColor="DarkGray" 
                                    Name="ChartArea1" ShadowColor="Silver">
                                    <Area3DStyle Enable3D="True" Inclination="30"/>
                                    <AxisY Maximum="100" Title="% Score" TitleFont="Arial,12pt, style=Bold"></AxisY>
                                    <AxisX Interval="1" Title="Date" TitleFont="Arial,12pt, style=Bold"></AxisX>
                                </asp:ChartArea>
                            </ChartAreas>
        </asp:Chart>
           
           
                            <asp:Chart ID="Chart2" runat="server" BackImageTransparentColor="128, 64, 0" 
        BackSecondaryColor="DimGray" BorderlineColor="DarkGray" Compression="5" DataSourceID="SqlDataSource2" 
        Height="400px" Width="300px">
        <Titles>
                                    <asp:Title Font="Arial, 12pt, style=Bold" ForeColor="Green" Name="Title1" Text="Exercise 2(Top View)" Alignment= "BottomCenter" Docking="Bottom">
                                        </asp:Title>
                                </Titles>
            <Series>
                <asp:Series Name="Series1" XValueMember="datime" YValueMembers="score">
                </asp:Series>
            </Series>
            <ChartAreas>
            <asp:ChartArea BackColor="DarkGray" BackGradientStyle="Center" 
                BackImageTransparentColor="Silver" BackSecondaryColor="DarkGray" 
                Name="ChartArea2" ShadowColor="Silver">
                <Area3DStyle Enable3D="True" Inclination="30" />
                <Area3DStyle Enable3D="True" Inclination="30"/>
                                    <AxisY Maximum="100" Title="% Score" TitleFont="Arial,12pt, style=Bold"></AxisY>
                                    <AxisX Interval="1" Title="Date" TitleFont="Arial,12pt, style=Bold"></AxisX>
            </asp:ChartArea>
        </ChartAreas>
        </asp:Chart>
           
           
           
           
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:imagineConnectionString %>" 
        
        
        
                                SelectCommand="SELECT top 10 * FROM [game] WHERE (([game_id] = @game_id) AND ([username] = @username)) ORDER BY [score] DESC" 
                                onselecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="game_id" Type="Decimal" />
            <asp:SessionParameter Name="username" SessionField="patientname" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
           
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:imagineConnectionString %>" 
        
        
        SelectCommand="SELECT top 10 * FROM [game] WHERE (([game_id] = @game_id) AND ([username] = @username)) ORDER BY [score] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="game_id" Type="Decimal" />
            <asp:SessionParameter Name="username" SessionField="patientname" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
                            
                        <br/>
                        </div>
                        <div style=" width:150px; margin-right:auto; margin-left:auto;">
                        <asp:Button ID="Button1" align="centre" CssClass="btn btn-large" runat="server" onclick="Button1_Click" Text="View Detailed Logs" />
                        <br />
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
