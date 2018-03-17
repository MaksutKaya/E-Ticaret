<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="E_Ticaret.User.PasswordRecovery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" Font-Size="Small" Width="585px" SuccessPageUrl="~/Default.aspx">
        <HyperLinkStyle ForeColor="Black" />
        <InstructionTextStyle ForeColor="#00CC00" />
        <LabelStyle ForeColor="Black" />
        <MailDefinition From="yonetici.eticaret@gmail.com">
        </MailDefinition>        
    <TextBoxStyle Font-Size="Small" Width="200px" />
</asp:PasswordRecovery>
</asp:Content>
