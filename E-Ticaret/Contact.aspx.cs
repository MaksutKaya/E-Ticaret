using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }

        protected void Genel_Command(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Gonder":
                    {
                        try
                        {                            
                            SendMail();
                            DisplayMessage.Text = "Mesajınız iletilmiştir";
                            DisplayMessage.Visible = true;
                            txtKonu.Text = "";
                            txtEmail.Text = "";
                            txtAdSoyad.Text = "";
                            txtMesaj.Text = "";
                            txtTelefon.Text = "";
                            Response.Redirect("~/Default.aspx");
                        }
                        catch (Exception) { }
                    }
                    break;
            }
        }



        private void SendMail()
        {
            // admin mail adresi
            var fromAddress = "";
            
            var toAddress = txtEmail.Text.ToString();
            // admin mail şifresi
            const string fromPassword = "";
            
            string subject = txtKonu.Text.ToString();
            string addbody = " \n \n Mailiniz tarafımıza ulaşmıştır. En kısa sürede dönüş yapılacaktır. \n\n E-Ticaret Yönetimi";
            string body = "Kimden: " + txtAdSoyad.Text + "\n";
            body += "Email: " + txtEmail.Text + "\n";
            body += "Telefon: " + txtTelefon.Text + "\n";
            body += "Konu: " + txtKonu.Text + "\n";
            body += "Mesaj: \n" + txtMesaj.Text + "\n";
            // smtp settings
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            // Passing values to smtp object
            smtp.Send(fromAddress, toAddress, subject, body + addbody); // aynı mailin kullanıcıya da gönderilmesi
            smtp.Send(fromAddress, fromAddress, subject, body); // admin kendisine mail göndererek oluşturulmuştur
        }
    }
}