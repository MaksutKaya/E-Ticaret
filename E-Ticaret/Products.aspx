<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="E_Ticaret.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="1000"></asp:ScriptManager>
    <div style="width: 100%">
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" OnItemCreated="DataList1_ItemCreated">
            <ItemTemplate>
                <div class="prod_box">
                    <div class="top_prod_box">
                    </div>
                    <div class="center_prod_box">
                        <div class="product_title">
                            <asp:LinkButton ID="lbtnProductName" runat="server" CommandArgument='<%# Eval("ProductID")%>' CommandName="details" Height="40px"><%# Eval("ProductName") %></asp:LinkButton>
                        </div>
                        <div class="product_img">                           
                            <asp:ImageButton CssClass="productImg" ID="ImageButton1" runat="server" CommandName="details" CommandArgument='<%# Eval("ProductID")%>' ImageUrl='<%# ResolveClientUrl(Eval("SmallPhotoPath").ToString()) %>'  />   
                        </div>
                        <div class="prod_price">
                            <span class="reduce">
                                <%#  string.Format("{0:C2}", Convert.ToDouble(Eval("UnitPrice").ToString())*1.18)  %>   
                            </span>
                            <span class="price">
                                <%# string.Format("{0:C2}", Convert.ToDouble(Eval("UnitPrice")))  %> 
                            </span>
                        </div>
                    </div>
                    <div class="bottom_prod_box">
                    </div>

<%--                    <div class="prod_details_tab" >
                        <div style="height:2px"></div>
                        <asp:Label ID="lblAdet" style="text-align:center; height:22px; " runat="server"  Width="40%" Text="Adet :"></asp:Label>

                        <asp:DropDownList ID="drpQuantity"  runat="server" style=" text-align:center;vertical-align:middle;"  Width="40%"></asp:DropDownList>
                    </div>--%>
                    <div class="prod_details_tab">
                        <asp:LinkButton class="prod_details" ID="lbtnDetay" runat="server" CommandArgument='<%# Eval("ProductID")%>' CommandName="details">Detay</asp:LinkButton>
                        <asp:LinkButton class="prod_details" ID="lbtnSepet" runat="server" CommandArgument='<%# Eval("ProductID")%>' CommandName="addToCart">Sepet</asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
