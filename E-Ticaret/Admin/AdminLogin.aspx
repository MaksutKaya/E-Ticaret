<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="E_Ticaret.Admin.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        
        <title> Admin | Sign In</title>
  
        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />
      
        <!-- Internet Explorer .png-fix -->
        
        <!--[if IE 6]>
            <script type="text/javascript" src="resources/scripts/DD_belatedPNG_0.0.7a.js"></script>
            <script type="text/javascript">
                DD_belatedPNG.fix('.png_bg, img, li');
            </script>
        <![endif]-->
    <style>


#login-wrapper #login-top {
                width: 100%;
                padding: 0;
                text-align: center;
                }
                
#login-wrapper #login-content {
                text-align: left;
                width: 412px;
                margin: 0 auto;
                }                
    </style>
</head>
<body>
    <form id="form1" runat="server">
          <div id="login-wrapper" ">
            <div id="login-top"">
            
                <!-- Logo (221px width) -->
                
            </div> <!-- End #logn-top -->
            
            <div id="login-content">

                <asp:Login ID="Login1" runat="server"  DisplayRememberMe="False" BackColor="White" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="Small" ForeColor="Black" TextLayout="TextOnTop" Font-Bold="True" TitleText="Admin Login" Width="250px" DestinationPageUrl="~/admin/DefaultAdmin.aspx">
                    <HyperLinkStyle Font-Bold="False" />
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="Small" ForeColor="Black" Width="100px" />
                    <TextBoxStyle Font-Size="Small" BorderStyle="Dotted" Width="240px" />
                    <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                </asp:Login>

            </div> <!-- End #login-content -->
            
        </div> <!-- End #login-wrapper -->
    </form>
</body>
</html>
