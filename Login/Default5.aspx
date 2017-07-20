<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Graphs</title>    
    <link rel="stylesheet" type="text/css" href="css/csss/bootstrap.css" />
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
                    
                            <p class="navbar-text pull-right"><a href="Default4.aspx">Logout</a></p>
                        </div><!--/.nav-collapse -->
                    
                    </div>
                </div>
            </div>
    <form id="form1" runat="server">
    <div class="container-fluid">       
        <div class="container">
            <div class="hero-unit" style="height:auto; background-color:#FFF;">               
            	<div class="row-fluid">
                	<div class="span12">
                        
                        <div style="width:980px; margin-left:50px; margin-right:auto; display:inline;" align="center">
                        
                        <asp:Chart ID="Chart1" runat="server" BackImageTransparentColor="128, 64, 0" 
        BackSecondaryColor="DimGray" BorderlineColor="DarkGray" Compression="5" DataSourceID="SqlDataSource1" 
        Height="501px" Width="900px">
        <Titles>
                                    <asp:Title Font="Arial, 12pt, style=Bold" Name="Title1" Text="Graphical representation of the data" Alignment= "BottomCenter" Docking= "Top">
                                        </asp:Title>
                                </Titles>
            <Series>
                <asp:Series Name="Series1" XValueMember="datime" YValueMembers="score">
                </asp:Series>
            </Series>
            <ChartAreas>
            <asp:ChartArea BackColor="DarkGray" BackGradientStyle="Center" 
                BackImageTransparentColor="Silver" BackSecondaryColor="DarkGray" 
                Name="ChartArea1" ShadowColor="Silver">
                <Area3DStyle Enable3D="True" Inclination="30" />
                <AxisY Maximum="100" Title="% Score" TitleFont="Arial,18pt, style=Bold"></AxisY>
                <AxisX Interval="1" Title="Date" TitleFont="Arial,18pt, style=Bold"></AxisX>
            </asp:ChartArea>
        </ChartAreas>
        </asp:Chart>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:imagineConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:imagineConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [game] WHERE (([username] = @username) AND ([datime] &gt;= @datime) AND ([datime] &lt; @datime2) AND (game_id &gt;= @game_id))">
        <SelectParameters>
            <asp:QueryStringParameter Name="username" QueryStringField="username" 
                Type="String" />
            <asp:QueryStringParameter Name="datime" QueryStringField="date1" 
                Type="String" />
            <asp:QueryStringParameter Name="datime2" QueryStringField="date2" 
                Type="String" />
                <asp:QueryStringParameter Name="game_id" QueryStringField="game_id" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <br />
                            <br />
                            <div class="well" style="width:980px">
                                <% showmessage(); %>
                            </span>
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
