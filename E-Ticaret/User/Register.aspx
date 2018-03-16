<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="E_Ticaret.User.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%-- Web site adminisration tools -> aracı ile web site konfigurasyon işlemlerinizi -> IIS(yani locak üserinden) çalışan aspnet sql kullanıcı ekranı ile -> kullanici sifre vb. oluşturup rahatça işlemlerinizi gerçekleştirebilirsiniz ... internetten araştır --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; height: auto;">
        <asp:createuserwizard runat="server" id="ctl00" backcolor="#E3EAEB" bordercolor="#E6E2D8" borderstyle="Solid" borderwidth="1px" font-names="Verdana" font-size="0.8em" ContinueDestinationPageUrl="~/Default.aspx"> 
            <ContinueButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#1C5E55" />
            <CreateUserButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#1C5E55" />
            <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <WizardSteps> <asp:CreateUserWizardStep runat="server"/> <asp:CompleteWizardStep runat="server"/> </WizardSteps> 
            <HeaderStyle BackColor="#666666" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
            <NavigationButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#1C5E55" />
            <SideBarButtonStyle ForeColor="White" />
            <SideBarStyle BackColor="#1C5E55" Font-Size="0.9em" VerticalAlign="Top" />
            <StepStyle BorderWidth="0px" />
        </asp:createuserwizard>
    </div>
</asp:Content>
