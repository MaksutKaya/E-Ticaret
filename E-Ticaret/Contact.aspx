<%@ Page Title="" Language="C#" MasterPageFile="~/Genel.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="E_Ticaret.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center_content">
        <div class="center_title_bar">İLETİSİM</div>

        <div class="prod_box_big">
            <div class="top_prod_box_big"></div>
            <div class="center_prod_box_big">

                <div class="contact_form">

                    <div class="form_row">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                            ControlToValidate="txtAdSoyad" ValidationGroup="save" />
                        <label class="contact"><strong>Ad Soyad:</strong></label>&nbsp
                        <asp:TextBox ID="txtAdSoyad" CssClass="contact_input" runat="server"></asp:TextBox>
                    </div>

                    <div class="form_row">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="txtEmail" ValidationGroup="save" />
                        <label class="contact"><strong>Email:</strong></label>&nbsp
                        <asp:TextBox ID="txtEmail" CssClass="contact_input" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator23"
                            SetFocusOnError="true" Text="Örnek: username@gmail.com" ControlToValidate="txtEmail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="save" Display="Dynamic" Font-Size="X-Small" />
                    </div>


                    <div class="form_row">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtTelefon" ErrorMessage="*" ValidationGroup="save" />
                        <label class="contact"><strong>Telefon:</strong></label>&nbsp
                        <asp:TextBox ID="txtTelefon" CssClass="contact_input" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            SetFocusOnError="true" ControlToValidate="txtTelefon"                             
                            ValidationGroup="save" ValidationExpression="(0)((5+[0-9]{2}))([0-9]{3})([0-9]{2})([0-9]{2})" Display="Dynamic" ErrorMessage="05123456789" Font-Size="X-Small"/>
                    </div>

                    <div class="form_row">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="txtKonu" ValidationGroup="save" />
                        <label class="contact"><strong>Konu:</strong></label>&nbsp
                        <asp:TextBox ID="txtKonu" CssClass="contact_input" runat="server"></asp:TextBox>
                    </div>


                    <div class="form_row">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                            ControlToValidate="txtMesaj" ValidationGroup="save" />
                        <label class="contact"><strong>Mesaj:</strong></label>&nbsp
                        <asp:TextBox ID="txtMesaj" CssClass="contact_textarea" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>


                    <div class="form_row">
                        <asp:LinkButton ID="lbtnGonder" CssClass="contact" runat="server" CommandName="Gonder" OnCommand="Genel_Command">Gönder</asp:LinkButton>
                    </div>
                    <p>
                        <asp:Label ID="DisplayMessage" runat="server" Visible="false" />
                    </p>
                </div>


            </div>
            <div class="bottom_prod_box_big"></div>
        </div>



    </div>   

</asp:Content>
