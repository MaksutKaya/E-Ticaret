<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="ComparedProducts.aspx.cs" Inherits="E_Ticaret.ComparedProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="border-bottom: 2px solid white; font-family: Consolas; font-size: large; font-weight: bold; width: 585px; background-color: lightblue;">

        <table class="headerStyleCompare" style="width: 585px">
            <tr>
                <td style="color: white; text-align: center; vertical-align: middle;width:55px">Sec</td>
                <td style="color: white; text-align: center; vertical-align: middle; width: 310px;">Urun Adi</td>
                <td style="color: white; text-align: center; vertical-align: middle; width: 95px;">Açıklama</td>
                <td style="color: white; text-align: center; vertical-align: middle; width: 125px;">Resim</td>
            </tr>
        </table>
    </div>
    <div style="width: 100%">
        <asp:GridView ID="dGwUrunKarsilastirma" runat="server" ShowHeader="false" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">

            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle Height="1px" />
            <%--<HeaderStyle CssClass="headerStyleCompare" Font-Size="Medium" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />--%>
            <RowStyle Font-Size="Small" Width="190px" BackColor="#dad0d0" />

            <AlternatingRowStyle BackColor="#eee6e6" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />

            <Columns>

                <%-- 1 --%>
                <%--HeaderText="Select" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"--%>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkCheck" runat="server" Text="Remove" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <%-- 2 --%>
                <%-- HeaderText="ProductName" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" --%>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HiddenField ID="hfProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                        <div style="padding: 20px">
                            <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </div>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <%-- 3 --%>
                <%-- HeaderText="Description" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" --%>

                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="padding: 20px">
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <%-- 4 --%>
                <%-- HeaderText="Photos" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" --%>

                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="padding: 20px">
                            <asp:ImageButton ID="ImagePhotos" runat="server" Width="75px" Height="75px" CommandArgument='<%# Eval("ProductID") %>' CommandName="detailsFromProductName" ImageUrl='<%# ResolveClientUrl( Eval("SmallPhotoPath").ToString()) %>' OnCommand="Genel_Command" />
                            <%--<asp:Image ID="ImgPhotos" runat="server" Width="75px" Height="75px" ImageUrl='<%# ResolveClientUrl( Eval("SmallPhotoPath").ToString()) %>' />--%>
                        </div>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>
    </div>
    <div style="height: 35px; width: 585px; background-image: url(images/icons/gwFooterBackground.jpg); background-repeat: no-repeat;">
    </div>
    <div>
        <asp:LinkButton CssClass="compare" BackColor="Transparent" ID="lbtnSecilenleriKaldir" runat="server" Style="text-align: center" OnClick="lbtnSecilenleriKaldir_Click">Secilenleri Sil</asp:LinkButton>
    </div>
</asp:Content>
