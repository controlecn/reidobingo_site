using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using LuckPrize.Common.Data;
using System.Text.RegularExpressions;

namespace LuckPrize
{
    public partial class ChangeCadAdmin : System.Web.UI.Page
    {
        UserTO currentUserTO;   // usuário corrente (admin)
        UserTO userTO;  // sendo editado

        protected void Page_Load(object sender, EventArgs e)
        {
            currentUserTO = (UserTO)Session["user"]; // precisa ser o admin

            if (Session["validated"] == null || (bool)Session["validated"] == false || currentUserTO == null || currentUserTO.access_level != Access_Level.Admin)
            {
                Response.Redirect("Default.aspx");
            }

            if (Request["user_id"] != null)
            {
                user_id.Value = Request["user_id"];
            }

            if (user_id.Value != "")
            {
                // edita o usuário solicitado
                userTO = Common.Data.User.GetUserById(int.Parse(user_id.Value));

                if (userTO == null)
                {
                    // precisa informar um id válido...
                    Response.Redirect("LuckAdmin.aspx");
                }
            }
            else
            {
                // precisa informar um id...
                Response.Redirect("LuckAdmin.aspx");
            }

            if (Page.IsPostBack)
            {
                this.Validate();
            }
            else
            {
                Populate();
            }
        }

        protected void Populate()
        {
/*
            DirectoryInfo info = new DirectoryInfo(Server.MapPath("~/img/avatars/70x70"));
            FileInfo[] files = info.GetFiles("*.png");

            images.InnerHtml = "";
            foreach (FileInfo f in files)
            {
                string src = f.Name;
                images.InnerHtml += "<a href='javascript:SelectImage(\"" + src + "\")'><img src='" + "img/avatars/70x70/" + src + "' border='0' vspace='2' hspace='2' runat='server'></a>";
            }
            avatar.Text = userTO.avatar_url;
*/

            name.Text = userTO.name;
            nick.Text = userTO.nick;
            email.Text = userTO.email;
            birthday.Text = userTO.birthday.ToString("dd/MM/yyyy");
            gender.SelectedIndex = (userTO.gender == "M" ? 1 : 2);
            newsletters.Checked = userTO.newsletters;
            credits.Text = userTO.credits.ToString();
            bonus.Text = userTO.bonus.ToString();
            prize.Text = userTO.prize.ToString();
        }

        protected void ProcessRegister()
        {
            if (Page.IsPostBack && Request.Url.Host == Request.UrlReferrer.Host && Request.HttpMethod == "POST")
            {
                try
                {
                    //
                    // altera usuário
                    //

                    // se não é o admin editando, não altera nada...
                    if (currentUserTO.access_level != Access_Level.Admin)
                    {
                        Response.Redirect("Default.aspx");
                    }

                    string[] genders = { "M", "F" };

                    // muda a senha...
                    if (Page.Request["pass1"] != null && Page.Request["pass1"].Length > 0)
                    {
                        userTO.password = Page.Request["pass1"];
                        Common.Data.User.UpdatePassword(userTO);
                    }

                    if (Page.Request["avatar"] != null)
                    {
                        userTO.avatar_url = (string)Page.Request["avatar"];
                    }
                    else
                    {
                        userTO.avatar_url = "";
                    }

                    userTO.name = name.Text;
                    userTO.nick = nick.Text;
                    userTO.email = email.Text;
                    userTO.birthday = DateTime.Parse(Page.Request["birthday"]);
                    userTO.gender = genders[int.Parse(Page.Request["gender"]) - 1];
                    userTO.newsletters = (Page.Request["newsletters"] != null && Page.Request["newsletters"].ToLower() == "on");
                    userTO.credits = float.Parse(credits.Text);
                    userTO.bonus = float.Parse(bonus.Text);
                    userTO.prize = float.Parse(prize.Text);

                    // tenta atualizar
                    //try
                    {
                        Common.Data.User.Update(userTO);
                        if (userTO.id == currentUserTO.id)
                        {
                            // admin alterou cadastro dele mesmo
                            Session["user"] = userTO;
                        }
                    }
                    //catch
                    //{
                    //    // erro
                    //    Response.Redirect("RegisterError.aspx");
                    //}

                    Response.Redirect("LuckAdmin.aspx");
                }
                catch (Exception ex)
                {
                    save_message.Text = "Erro nos dados!!!";
                }
            }
        }

        protected void Server_ValidateName(object source, ServerValidateEventArgs args)
        {
            Regex reg = new Regex("^[a-zA-Z0-9-_\\s]+$");
            bool valid = reg.IsMatch(name.Text);

            // --- regras

            if (name.Text.StartsWith(" ")) args.IsValid = false;
            if (name.Text.Trim().Length == 0) args.IsValid = false;
            if (!valid) args.IsValid = false;

            // --- feedback

            if (!args.IsValid)
                lbl_Name.Text = "(Inválido)";
        }

        protected void Server_ValidateNick(object source, ServerValidateEventArgs args)
        {
            lbl_Nick.Text = "";
            if (nick.Text == userTO.nick) return;

            bool exists = Common.Data.User.ExistsByLogin(nick.Text);

            Regex reg = new Regex("^[a-zA-Z0-9-_\\s]+$");
            bool valid = reg.IsMatch(nick.Text);

            // --- regras

            if (nick.Text.StartsWith(" ")) args.IsValid = false;
            if (nick.Text.Trim().Length == 0) args.IsValid = false;
            if (exists) args.IsValid = false;
            if (!valid) args.IsValid = false;

            // --- feedback

            if (exists)
                lbl_Nick.Text += "(Já Cadastrado)";

            if (!args.IsValid)
                lbl_Nick.Text += "(Inválido)";
        }

        protected void Server_ValidateEmail(object source, ServerValidateEventArgs args)
        {
            if (email.Text == userTO.email) return;

            bool exists = Common.Data.User.ExistsByEMail(email.Text);
            args.IsValid = !exists;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
                ProcessRegister();
        }

        protected void btnDisable_Click(object sender, EventArgs e)
        {
            userTO.active = false;
            ProcessRegister();
        }

        protected void btnEnable_Click(object sender, EventArgs e)
        {
            userTO.active = true;
            userTO.validated = true;
            ProcessRegister();
        }

    }
}
