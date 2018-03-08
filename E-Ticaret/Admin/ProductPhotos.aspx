<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ProductPhotos.aspx.cs" Inherits="E_Ticaret.Admin.ProductPhotos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanelProdPhoto" runat="server">
        <ContentTemplate>
            <div style="width: 100%; float: left; margin: 0px">
                <asp:LinkButton ID="lbtnProdPhotoInsertViews" runat="server" OnClick="lbtnProdPhotoInsertViews_Click">Urun Resmi Guncelleme</asp:LinkButton>
                &nbsp;<br />

                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">

                        <table class="auto-style1">
                            <tr>
                                <td>Kategori Seciniz : </td>
                                <td>
                                    <asp:DropDownList ID="ddlPhotoCategoryName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPhotoCategoryName_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Urun Seciniz :</td>
                                <td>
                                    <asp:DropDownList ID="ddlPhotoProductName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPhotoProductName_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 75px; width: 75px">
                                    <asp:Image ID="ImgSmallPhoto" runat="server" Width="75px" Height="75px" />
                                </td>
                                <td style="text-align: left; vertical-align: central; width: 250px;">
                                    <asp:FileUpload ID="fuSmallPhoto" runat="server" Width="250px" />
                                    <asp:Label ID="lblSmallPhoto" runat="server" Text=""></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="height: 75px; width: 75px">
                                    <asp:Image ID="ImgLargePhoto" runat="server"  Width="75px" Height="75px"/>
                                </td>
                                <td style="text-align: left; vertical-align: central; width: 250px;">
                                    <asp:FileUpload ID="fuLargePhoto" runat="server" Width="250px" />
                                    <asp:Label ID="lblLargePhoto" runat="server" Text=""></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="text-align: left; vertical-align: top; width: 250px;">
                                    <asp:Button Style="width: 100%" ID="BtnEkle" runat="server" Text="Ekle" OnClick="BtnEkle_Click" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <asp:Label ID="lblUyari" runat="server" Text="" style="color:red" ></asp:Label>
                    </asp:View>
                </asp:MultiView>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BtnEkle" />
            <asp:PostBackTrigger ControlID="ddlPhotoProductName"/>
        </Triggers>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfSelectProductID" runat="server" />
</asp:Content>
