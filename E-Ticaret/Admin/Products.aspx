<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="E_Ticaret.Admin.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanelProd" runat="server">
        <ContentTemplate>
            <div style="width: 100%; float: left; margin: 0px">
                <asp:LinkButton ID="lbtnProdInsertViews" runat="server" OnClick="lbtnProdInsertViews_Click">Urun Ekle</asp:LinkButton>
                &nbsp|
                <asp:LinkButton ID="lbtnProdUpdate" runat="server" OnClick="lbtnProdUpdate_Click">Urun Güncelle</asp:LinkButton>
                &nbsp|
                <asp:LinkButton ID="lbtnProdDelete" runat="server" OnClick="lbtnProdUpdate_Click">Urun Sil</asp:LinkButton>

                <br />

                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="ViewList" runat="server">
                        <table>
                            <tr>
                                <td>Kategori Seciniz : </td>
                                <td>
                                    <asp:DropDownList ID="ddlListCategoryName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlListCategoryName_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <asp:Repeater ID="rptList" runat="server" OnItemCommand="rptList_ItemCommand">
                            <ItemTemplate>
                                <div style="border-bottom: 2px solid #CCC;">
                                    &nbsp;|&nbsp;<asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:View>
                    <asp:View ID="View1" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 150px;">Urun Adi : </td>

                                <td style="text-align: left; vertical-align: top; width: 250px;">
                                    <asp:TextBox ID="txtProductName" runat="server" Width="250px" ValidationGroup="ProdInsert"></asp:TextBox>
                                </td>

                                <td style="text-align: left; vertical-align: top; width: 200px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProductName" ErrorMessage="Urun Adı Boş Geçilemez !" ForeColor="Red" ValidationGroup="ProdInsert">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>


                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 150px;">Urun Aciklamasi : </td>

                                <td style="text-align: left; vertical-align: top; width: 250px;">
                                    <asp:TextBox ID="txtDescription" runat="server" Width="250px" ValidationGroup="ProdInsert"></asp:TextBox>
                                </td>

                                <td style="text-align: left; vertical-align: top; width: 200px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" ErrorMessage="Urun Aciklamasi Boş Geçilemez !" ForeColor="Red" ValidationGroup="ProdInsert">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 150px;">Urun Fiyati : </td>

                                <td style="text-align: left; vertical-align: top; width: 250px;">
                                    <asp:TextBox ID="txtUnitPrice" runat="server" Width="250px" ValidationGroup="ProdInsert"></asp:TextBox>
                                </td>

                                <td style="text-align: left; vertical-align: top; width: 200px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtProductName" ErrorMessage="Urun Adı Boş Geçilemez !" ForeColor="Red" ValidationGroup="ProdInsert">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 150px;">Stok Miktari : </td>

                                <td style="text-align: left; vertical-align: top; width: 250px;">
                                    <asp:TextBox ID="txtUnitsInStock" runat="server" Width="250px" ValidationGroup="ProdInsert"></asp:TextBox>
                                </td>

                                <td style="text-align: left; vertical-align: top; width: 200px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtProductName" ErrorMessage="Urun Adı Boş Geçilemez !" ForeColor="Red" ValidationGroup="ProdInsert">*</asp:RequiredFieldValidator>
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
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="height: 75px; width: 75px">
                                    <asp:Image ID="ImgLargePhoto" runat="server" Width="75px" Height="75px" />
                                </td>
                                <td style="text-align: left; vertical-align: central; width: 250px;">
                                    <asp:FileUpload ID="fuLargePhoto" runat="server" />
                                    <asp:Label ID="lblLargePhoto" runat="server" Text=""></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 150px;">Kategori Sec: </td>

                                <td style="text-align: left; vertical-align: top; width: 250px;">
                                    <asp:DropDownList ID="ddlCateID" runat="server"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 150px;"></td>

                                <td style="text-align: left; vertical-align: top; width: 250px;">
                                    <asp:Button ID="btnEkle" runat="server" Text="Ekle" Width="90px" OnClick="btnEkle_Click" ValidationGroup="ProdInsert" />

                                    <asp:Button ID="btnGuncelle" runat="server" Text="Güncelle" Width="100px" OnClick="btnGuncelle_Click" ValidationGroup="ProdInsert" />
                                </td>

                                <td style="text-align: left; vertical-align: top; width: 200px;"></td>
                            </tr>

                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 200px;"></td>

                                <td style="text-align: left; vertical-align: top; width: 250px;">

                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="ProdInsert" />

                                </td>

                                <td style="text-align: left; vertical-align: top; width: 200px;"></td>
                            </tr>
                        </table>
                        <asp:Label ID="lblUyari" runat="server" Text="" style="color:red" ></asp:Label>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table>
                            <tr>
                                <td>Kategori Seciniz : </td>
                                <td>
                                    <asp:DropDownList ID="ddlUpdate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUpdate_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
                            <ItemTemplate>
                                <div style="border-bottom: 2px solid #CCC;">
                                    <asp:CheckBox ID="chkCheck" runat="server" />&nbsp;|&nbsp;<asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                    <asp:HiddenField ID="hfProductId" runat="server" Value='<%# Eval("ProductID") %>' />
                                    <span style="color: orange">
                                        <asp:LinkButton ID="lbtnGuncelle" runat="server" Font-Underline="false" ForeColor="Orange" Font-Size="Smaller">Guncelle</asp:LinkButton>
                                    </span>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <br />

                        <asp:Button ID="btnSecilenleriSil" runat="server" Text="Seçilenleri Sil" Width="150px" OnClick="btnSecilenleriSil_Click" />

                        <br />
                        <br />
                    </asp:View>
                </asp:MultiView>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnEkle" />
            <asp:PostBackTrigger ControlID="btnGuncelle" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
