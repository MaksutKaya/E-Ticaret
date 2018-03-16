<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="E_Ticaret.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .table_Style {
            width: 100%;
            float: left;
            border-style: solid;
            border-width: 1px;
            text-align:left
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table  class="table-Style">
        <tr>
            <td>
                <asp:TextBox ID="txtAra" runat="server"></asp:TextBox>

                <asp:Button ID="btnAra" runat="server" Text="Ara" Width="100px" OnClick="btnAra_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataList1" runat="server"  OnItemCommand="DataList1_ItemCommand" RepeatColumns="3" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="prod_box">
                            <div class="top_prod_box">
                            </div>
                            <div class="center_prod_box">
                                <div class="product_title">
                                    <asp:LinkButton ID="lbtnProductName" runat="server" CommandArgument='<%# Eval("ProductID")%>' CommandName="detailsFromProductName"><%# Eval("ProductName") %></asp:LinkButton>
                                </div>
                                <div class="product_img">
                                    <asp:ImageButton CssClass="productImg" ID="productImg" runat="server" CommandArgument='<%# Eval("ProductID")%>' CommandName="detailsFromProductName" ImageUrl='<%# ResolveClientUrl(Eval("SmallPhotoPath").ToString()) %>' />
                                </div>
                                <div class="prod_price">
                                    <span class="reduce">
                                <%#  string.Format("{0:C2}", Convert.ToDouble(Eval("UnitPrice").ToString())*1.18)  %>   
                                    </span><span class="price">
                                <%# string.Format("{0:C2}",Convert.ToDouble(Eval("UnitPrice")))  %> 
                                    </span>
                                </div>
                            </div>
                            <div class="bottom_prod_box">
                            </div>
                            <div class="prod_details_tab">
                                <asp:LinkButton ID="lbtnDetay" runat="server" class="prod_details" CommandArgument='<%# Eval("ProductID")%>' CommandName="details">Detay</asp:LinkButton>
                                <asp:LinkButton ID="lbtnSepet" runat="server" class="prod_details" CommandArgument='<%# Eval("ProductID")%>' CommandName="addToCart">Sepet</asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
    
</asp:Content>
