<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="E_Ticaret.Admin.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            width: 600px;
            float: left;
            text-align: left;
        }
    </style>

</asp:Content>
<%-------------------------------------------------%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="width: 100%; float: none; margin: 0px;">
                <asp:LinkButton ID="lbtnCateInsertViews" runat="server" ForeColor="Orange" Font-Underline="false" OnClick="lbtnCateInsertViews_Click">Kategori Ekle</asp:LinkButton>
                &nbsp;|
                <asp:LinkButton ID="lbtnCateUpdateViews" runat="server" ForeColor="Orange" Font-Underline="false" OnClick="lbtnCateUpdateViews_Click">Kategori Güncelle</asp:LinkButton>
                &nbsp;|
                <asp:LinkButton ID="lbtnCateDeleteViews" runat="server" ForeColor="Orange" Font-Underline="false" OnClick="lbtnCateUpdateViews_Click">Kategori Sil</asp:LinkButton>

                <br />

                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="ViewList" runat="server">
                        <asp:Repeater ID="rptList" runat="server">
                                                        <ItemTemplate>
                                <div style="border-bottom: 2px solid #CCC;">
                                    &nbsp;|&nbsp;<asp:Label ID="lblCategoryName" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:View>
                    <asp:View ID="View1" runat="server">
                        <table class="auto-style1">
                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 150px;">Kategori Adi : </td>

                                <td style="text-align: left; vertical-align: top; width: 250px;">
                                    <asp:TextBox ID="txtCategoryName" runat="server" Width="250px" ValidationGroup="CateInsert"></asp:TextBox>
                                </td>

                                <td style="text-align: left; vertical-align: top; width: 200px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategoryName" ErrorMessage="Kategori Adı Boş Geçilemez !" ForeColor="Red" ValidationGroup="CateInsert">*</asp:RequiredFieldValidator>

                                </td>
                            </tr>

                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 150px;"></td>

                                <td style="text-align: left; vertical-align: top; width: 250px;">
                                    <asp:Button ID="btnEkle" runat="server" Text="Ekle" Width="90px" OnClick="btnEkle_Click" ValidationGroup="CateInsert" />

                                    <asp:Button ID="btnGuncelle" runat="server" Text="Güncelle" Width="100px" OnClick="btnGuncelle_Click" ValidationGroup="CateInsert" />
                                </td>

                                <td style="text-align: left; vertical-align: top; width: 200px;"></td>
                            </tr>

                            <tr>
                                <td style="text-align: left; vertical-align: top; width: 200px;"></td>

                                <td style="text-align: left; vertical-align: top; width: 250px;">

                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="CateInsert" />

                                </td>

                                <td style="text-align: left; vertical-align: top; width: 200px;"></td>
                            </tr>

                        </table>
                    </asp:View>

                    <asp:View ID="View2" runat="server">
                        <asp:Repeater ID="rptCategories" runat="server" OnItemCommand="rptCategories_ItemCommand">
                            <ItemTemplate>
                                <div style="border-bottom: 2px solid #CCC;">
                                    <asp:CheckBox ID="chkCheck" runat="server" />&nbsp;|&nbsp;<asp:Label ID="lblCategoryName" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label>
                                    <asp:HiddenField ID="hfCategoryId" runat="server" Value='<%# Eval("CategoryId") %>' />
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
    </asp:UpdatePanel>
</asp:Content>
