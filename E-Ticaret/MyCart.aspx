<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="E_Ticaret.MyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 585px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%">
        <div style="border-bottom: 2px solid white; font-family: Consolas; font-size: large; font-weight: bold; width: 585px; background-color: lightblue;">

            <table class="headerStyleCompare" style="width: 585px">
                <tr>
                    <td style="color: white; text-align: center; vertical-align: middle; width: 75px;">Sec</td>
                    <td style="color: white; text-align: center; vertical-align: middle; width: 150px;">Urun Adi</td>
                    <td style="color: white; text-align: center; vertical-align: middle; width: 150px;">Adet</td>
                    <td style="color: white; text-align: center; vertical-align: middle; width: 150px;">Toplam</td>
                    <td style="color: white; text-align: center; vertical-align: middle; width: 60px;"></td>
                </tr>
            </table>
        </div>
        <asp:Repeater ID="rptMyCart" runat="server" OnItemCommand="rptMyCart_ItemCommand">
            <ItemTemplate>
                <div style="border-bottom: 2px solid white; font-family: Consolas; font-size: medium; width: 585px; background-color: #dad0d0;">

                    <table class="auto-style1">
                        <tr>
                            <td style="text-align: center; vertical-align: middle; width: 75px;">
                                <asp:CheckBox ID="chkCheck" runat="server" />
                                <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                            </td>

                            <td style="text-align: center; vertical-align: middle; width: 150px;"><%# Eval("ProductName") %></td>
                            <td style="text-align: center; vertical-align: middle; width: 150px;"><%# Eval("Quantity") %></td>
                            <td style="text-align: center; vertical-align: middle; width: 150px;"><%# string.Format("{0:C2}",Convert.ToInt32(Eval("Quantity"))*Convert.ToDouble(Eval("UnitPrice")))  %></td>
                            <td style="text-align: center; vertical-align: middle; width: 60px;">

                                <%--<asp:ImageButton ID="imgProduct1" runat="server" CommandArgument='<%# Eval("ProductID") %>' CommandName="sepet" Width="30px" Height="30" ImageUrl="~/images/icons/sepet.ico" background-color="transparent" />--%>

                                <asp:ImageButton ID="imgProduct1" runat="server" CommandArgument='<%# Eval("ProductID") %>' CommandName="detailsFromProductName" Width="30px" Height="30" ImageUrl='<%# Eval("SmallPhotoPath") %>' background-color="transparent" />
                            </td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>
            <AlternatingItemTemplate>

                <div style="border-bottom: 2px solid white; font-family: Consolas; font-size: medium; width: 585px; background-color: #eee6e6;">

                    <table class="auto-style1">
                        <tr>
                            <td style="text-align: center; vertical-align: middle; width: 75px;">
                                <asp:CheckBox ID="chkCheck" runat="server" />
                                <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                            </td>

                            <td style="text-align: center; vertical-align: middle; width: 150px;"><%# Eval("ProductName") %></td>
                            <td style="text-align: center; vertical-align: middle; width: 150px;"><%# Eval("Quantity") %></td>
                            <td style="text-align: center; vertical-align: middle; width: 150px;"><%# string.Format("{0:C2}",Convert.ToInt32(Eval("Quantity"))*Convert.ToDouble(Eval("UnitPrice")))  %></td>
                            <td style="text-align: center; vertical-align: middle; width: 60px;">

                                <asp:ImageButton ID="imgProduct2" runat="server" CommandArgument='<%# Eval("ProductID") %>' CommandName="detailsFromProductName" Width="30px" Height="30" ImageUrl='<%# Eval("SmallPhotoPath") %>' background-color="transparent" />
                            </td>
                        </tr>
                    </table>
                </div>
            </AlternatingItemTemplate>
            <%--            <FooterTemplate>
                <div style="height: 32px; background-image: url(../images/icons/gwFooterBackground.jpg); color: white; text-align: center; font-weight: bold; font-size: x-large">
                    <%= string.Format("{0:C2}",Convert.ToInt32( TotalPrice))  %>
                </div>
            </FooterTemplate>--%>
        </asp:Repeater>
        <div style="height: 32px; background-image: url(../images/icons/gwFooterBackground.jpg); color: white; text-align: center; font-weight: bold; font-size: x-large">
            <%= string.Format("{0:C2}",Convert.ToInt32( TotalPrice))  %>
        </div>
        <br />
        <div style="text-align: center; width: 585px">
            <asp:Button ID="btnSecilenleriKaldir" runat="server" Text="Secilenleri Kaldir" Style="background-image: url(images/icons/gwButtonBackground.gif); background-repeat: no-repeat; color: white; font-weight: bold; font-size: large" OnClick="btnSecilenleriKaldir_Click" Height="34px" Width="304px" />
        </div>
    </div>
</asp:Content>
