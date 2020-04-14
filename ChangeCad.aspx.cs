using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using LuckPrize.Common.Data;

namespace LuckPrize
{
    public partial class ChangeCad : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["validated"] == null || (bool)Session["validated"] == false || Session["user"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (Page.IsPostBack)
            {
                this.Validate();
            }

            Populate();
        }

        protected void Populate()
        {
            Common.Data.UserTO userTO = (Common.Data.UserTO)Session["user"];

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
        }

        protected void ProcessRegister()
        {
            if (Page.IsPostBack && Request.Url.Host == Request.UrlReferrer.Host && Request.HttpMethod == "POST")
            {
                //
                // altera usuário
                //

                Common.Data.UserTO userTO = (Common.Data.UserTO)Session["user"];

                // verifica se a senha antiga bate...
                Common.Data.UserTO userTO2 = Common.Data.User.GetUserByLoginPass(userTO.nick, Request["oldpass"], true);
                if (userTO2 == null)
                {
                    // senha inválida...
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
                userTO.birthday = DateTime.Parse(Page.Request["birthday"]);
                userTO.gender = genders[int.Parse(Page.Request["gender"]) - 1];
                userTO.newsletters = (Page.Request["newsletters"] != null && Page.Request["newsletters"].ToLower() == "on");

                // tenta atualizar
                //try
                {
                    Common.Data.User.Update(userTO);
                    Session["user"] = userTO;
                }
                //catch
                //{
                //    // erro
                //    Response.Redirect("RegisterError.aspx");
                //}

                Response.Redirect("MyAccount.aspx");
            }
        }

        protected void Server_ValidatePass(object source, ServerValidateEventArgs args)
        {
            // --- regras

            if (oldpass.Text.StartsWith(" ")) args.IsValid = false;
            if (oldpass.Text.Trim().Length == 0) args.IsValid = false;
            Common.Data.UserTO userTO = (Common.Data.UserTO)Session["user"];
            Common.Data.UserTO userTO2 = Common.Data.User.GetUserByLoginPass(userTO.nick, Request["oldpass"], true);
            if (userTO2 == null)
            {
                args.IsValid = false;
            }

            // --- feedback

            if (!args.IsValid)
                lbl_OldPass.Text = "(Inválida)";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
                ProcessRegister();
        }

    }
}
