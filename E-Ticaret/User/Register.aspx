<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="E_Ticaret.User.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%-- Web site adminisration tools -> aracı ile web site konfigurasyon işlemlerinizi -> IIS(yani locak üserinden) çalışan aspnet sql kullanıcı ekranı ile -> kullanici sifre vb. oluşturup rahatça işlemlerinizi gerçekleştirebilirsiniz ... internetten araştır --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; height: auto;">
        <asp:CreateUserWizard runat="server" ID="ctl00" BackColor="#DADADA" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="Small" ContinueDestinationPageUrl="~/Default.aspx" Width="585px">
            <CompleteSuccessTextStyle Font-Size="Small" />
            <ContinueButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#598891" Font-Size="Small" Height="30px" Width="125px" />
            <CreateUserButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#5C8B93" Font-Size="Small" Height="30px" Width="125px" />
            <TextBoxStyle Font-Size="Small" Width="200px" />
            <TitleTextStyle BackColor="#629199" Font-Bold="True" ForeColor="White" Font-Size="Small" Height="28px" />
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" />
                <asp:CompleteWizardStep runat="server" />
            </WizardSteps>
            <HeaderStyle BackColor="#666666" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Small" ForeColor="White" HorizontalAlign="Center" />
            <NavigationButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#1C5E55" />
            <StepNextButtonStyle Font-Size="Small" />
            <SideBarButtonStyle ForeColor="White" />
            <SideBarStyle BackColor="#1C5E55" Font-Size="Small" VerticalAlign="Top" />
            <StepStyle BorderWidth="0px" Font-Bold="False" Font-Size="Small" />
        </asp:CreateUserWizard>
    </div>
</asp:Content>
