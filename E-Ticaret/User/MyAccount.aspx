<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="E_Ticaret.User.MyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            float: left;
            text-align:left;
            text-decoration:none;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%">

        <table align="left" class="auto-style1">
            <tr>
                <td style="font-size:medium">
                    <asp:LinkButton ID="lbtnBilgilerim" runat="server">Bilgilerim</asp:LinkButton>
                    &nbsp|&nbsp
                    <asp:LinkButton ID="lbtnSifreDegistir" runat="server">Sifre Degistir</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <asp:ChangePassword ID="ChangePassword1" runat="server" BackColor="#E3EAEB" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em">
                                <CancelButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
                                <ChangePasswordButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
                                <ContinueButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
                                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                                <PasswordHintStyle Font-Italic="True" ForeColor="#1C5E55" />
                                <TextBoxStyle Font-Size="0.8em" />
                                <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                            </asp:ChangePassword>
                        </asp:View>
                    </asp:MultiView>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
