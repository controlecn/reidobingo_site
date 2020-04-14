using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LuckPrize
{
    public partial class Config : System.Web.UI.Page
    {
        Common.Data.MiscConfigurationsTO cfg;

        protected void Page_Load(object sender, EventArgs e)
        {
            Common.Data.UserTO userTO = (Common.Data.UserTO)Session["user"];

            if (Session["validated"] == null || (bool)Session["validated"] == false || userTO == null || userTO.access_level != Common.Data.Access_Level.Admin)
            {
                Response.Redirect("Default.aspx");
            }

            cfg = Common.Data.MiscConfigurations.GetConfigurations();

            if (Page.IsPostBack)
            {
                this.Validate();
            }
            else
            {
                Populate();
            }
        }

        private void Populate()
        {
            bingo_max_players.Text = cfg.bingo_room_size.ToString();

            bingo_normal_freq_days.Text = cfg.bingo_normal_freq_days.ToString();
            bingo_normal_freq_minutes.Text = cfg.bingo_normal_freq_minutes.ToString();

            bingo_mega_freq_days.Text = cfg.bingo_mega_freq_days.ToString();
            bingo_mega_freq_minutes.Text = cfg.bingo_mega_freq_minutes.ToString();

            bingo_price_normal.Text = cfg.bingo_price_normal.ToString();
            bingo_price_mega.Text = cfg.bingo_price_mega.ToString();

            bingo_accum.Text = cfg.bingo_accum.ToString();
            bingo_percent_accum.Text = cfg.bingo_percent_accum.ToString();
            bingo_percent_prize.Text = cfg.bingo_percent_prize.ToString();
            bingo_initial_accum.Text = cfg.bingo_initial_accum.ToString();

            friend_credits.Text = cfg.friend_credits.ToString();
        }

        private void SaveConfig()
        {
            try
            {
                cfg.bingo_room_size = short.Parse(bingo_max_players.Text);

                cfg.bingo_normal_freq_days = short.Parse(bingo_normal_freq_days.Text);
                cfg.bingo_normal_freq_minutes = short.Parse(bingo_normal_freq_minutes.Text);

                cfg.bingo_mega_freq_days = short.Parse(bingo_mega_freq_days.Text);
                cfg.bingo_mega_freq_minutes = short.Parse(bingo_mega_freq_minutes.Text);

                cfg.bingo_price_normal = float.Parse(bingo_price_normal.Text);
                cfg.bingo_price_mega = float.Parse(bingo_price_mega.Text);

                cfg.bingo_accum = float.Parse(bingo_accum.Text);
                cfg.bingo_percent_accum = float.Parse(bingo_percent_accum.Text);
                cfg.bingo_percent_prize = float.Parse(bingo_percent_prize.Text);
                cfg.bingo_initial_accum = float.Parse(bingo_initial_accum.Text);

                cfg.friend_credits = float.Parse(friend_credits.Text);

                Common.Data.MiscConfigurations.Update(cfg);
                save_message.Text = "Salvo.";
                Response.Redirect("LuckAdmin.aspx");
            }
            catch (Exception ex)
            {
                save_message.Text = "Erro nos dados!!!";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
                SaveConfig();
        }

    }
}
