<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="E_Ticaret.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%">
        <div class="center_content">
            <div class="center_title_bar"><%= ((Web.Library.Product)Session["detailsProd"]).ProductName%></div>

            <div class="prod_box_big">
                <div class="top_prod_box_big"></div>
                <div class="center_prod_box_big">

                    <div class="product_img_big">
                        <img class="productDetailsImg" src='<%= ResolveClientUrl(((Web.Library.Product)Session["detailsProd"]).LargePhotoPath) %>' alt="" title="" border="0" />
                    </div>
                    <div class="details_big_box">
                        <div class="product_title_big"><%= ((Web.Library.Product)Session["detailsProd"]).Description%></div>
                        <div class="specifications">
                            <%--Kategorisi: <span class="blue"><%= selectedProduct.Category.CategoryName%></span> <br />--%>

                            Kategorisi: <asp:LinkButton ID="LinkButton1" style="text-decoration:none" CommandName="kategori"  ForeColor="#5F9FAB" runat="server" OnCommand="GenelProdDetails_Command"><%=((Web.Library.Product)Session["detailsProd"]).Category.CategoryName %></asp:LinkButton> <br />

                            Stok Miktari: <span class="blue"><%= ((Web.Library.Product)Session["detailsProd"]).UnitsInStock%></span><br />

                            Stok Durumu: <span style="color: <%= yaziColor%>"><%=stokDurumu %></span><br />

                            Garanti: <span class="blue">24 Ay</span><br />

                            Kargo: <span class="blue"><%=kargoUcreti %></span><br />

                            Montaj: <span class="blue">Eve teslim, ücretsiz kurulum</span><br />
                        </div>
                        <div class="prod_price_big">
                            <span class="reduce">
                                <%=  string.Format("{0:C2}", Convert.ToDouble(((Web.Library.Product)Session["detailsProd"]).UnitPrice)*1.18)  %>   
                            </span>
                            <span class="price">
                                <%= string.Format("{0:C2}", Convert.ToDouble(((Web.Library.Product)Session["detailsProd"]).UnitPrice))  %> 
                            </span>
                        </div>
                        <asp:LinkButton ID="lbtnAddToCart" class="addtocart" runat="server" CommandArgument='<%# Eval("ProductID") %>' CommandName="AddToCart" OnCommand="GenelProdDetails_Command">Sepete Ekle</asp:LinkButton>

                        <asp:LinkButton ID="lbtnCompare" class="compare" runat="server" CommandArgument='<%# Eval("ProductID") %>' CommandName="Compare" OnCommand="GenelProdDetails_Command">Urun Karsilastir</asp:LinkButton>
                    </div>
                </div>
                <div class="bottom_prod_box_big"></div>
            </div>

            <div class="center_title_bar">Similar products</div>

            <div style="width: auto; float: left;">
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="GenelDataList_ItemCommand" DataSourceID="BenzerUrunler">
                    <ItemTemplate>
                        <div class="prod_box">
                            <div class="top_prod_box">
                            </div>
                            <div class="center_prod_box">
                                <div class="product_title">
                                    <asp:LinkButton ID="lbtnProductName" runat="server" CommandArgument='<%# Eval("ProductID")%>' CommandName="detailsFromProductName" Height="40px"><%# Eval("ProductName") %></asp:LinkButton>
                                </div>
                                <div class="product_img">
                                    <asp:ImageButton class="productImg" ID="ImageButton1" runat="server" CommandName="detailsFromProductName" CommandArgument='<%# Eval("ProductID")%>' ImageUrl='<%# ResolveClientUrl(Eval("SmallPhotoPath").ToString()) %>' />
                                </div>
                                <div class="prod_price">
                                    <span class="reduce">
                                        <%#  string.Format("{0:C2}", Convert.ToDouble(Eval("UnitPrice").ToString())*1.18)  %>   
                                    </span>
                                    <span class="price">
                                        <%# string.Format("{0:C2}",Convert.ToDouble(Eval("UnitPrice")))  %> 
                                    </span>
                                </div>
                            </div>

                            <div class="bottom_prod_box">
                            </div>

                            <div class="prod_details_tab">
                                <asp:LinkButton class="prod_details" ID="lbtnDetay" runat="server" CommandArgument='<%# Eval("ProductID")%>' CommandName="details">Detay</asp:LinkButton>
                                <asp:LinkButton class="prod_details" ID="lbtnSepet" runat="server" CommandArgument='<%# Eval("ProductID")%>' CommandName="addToCart">Sepet</asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="BenzerUrunler" runat="server" ConnectionString="<%$ ConnectionStrings:ETicaretDBConnectionString %>" ></asp:SqlDataSource>
            </div>

            <div class="center_title_bar">Other products</div>

            <div style="width: auto; float: left;">
                <asp:DataList ID="DataList2" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"  DataSourceID="RastgeleUrunler" OnItemCommand="GenelDataList_ItemCommand">
                    <ItemTemplate>
                        <div class="prod_box">
                            <div class="top_prod_box">
                            </div>
                            <div class="center_prod_box">
                                <div class="product_title">
                                    <asp:LinkButton ID="lbtnProductName" runat="server" CommandArgument='<%# Eval("ProductID")%>' CommandName="detailsFromProductName" Height="40px"><%# Eval("ProductName") %></asp:LinkButton>
                                </div>
                                <div class="product_img">
                                    <asp:ImageButton class="productImg" ID="ImageButton1" runat="server" CommandName="detailsFromProductName" CommandArgument='<%# Eval("ProductID")%>' ImageUrl='<%# ResolveClientUrl(Eval("SmallPhotoPath").ToString()) %>' />
                                </div>
                                <div class="prod_price">
                                    <span class="reduce">
                                        <%#  string.Format("{0:C2}", Convert.ToDouble(Eval("UnitPrice").ToString())*1.18)  %>   
                                    </span>
                                    <span class="price">
                                        <%# string.Format("{0:C2}",Convert.ToDouble(Eval("UnitPrice")))  %> 
                                    </span>
                                </div>
                            </div>

                            <div class="bottom_prod_box">
                            </div>

                            <div class="prod_details_tab">
                                <asp:LinkButton class="prod_details" ID="lbtnDetay" runat="server" CommandArgument='<%# Eval("ProductID")%>' CommandName="details">Detay</asp:LinkButton>
                                <asp:LinkButton class="prod_details" ID="lbtnSepet" runat="server" CommandArgument='<%# Eval("ProductID")%>' CommandName="addToCart">Sepet</asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="RastgeleUrunler" runat="server" ConnectionString="<%$ ConnectionStrings:ETicaretDBConnectionString %>"></asp:SqlDataSource>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hdfProductID" runat="server" />
</asp:Content>
