using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LuckPrize.Common.Data;

namespace LuckPrize
{
    public partial class Buy : System.Web.UI.Page
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
            else
            {
                CheckPendingRequests();
                AddValues();
                AddBanks();
            }
        }

        /// <summary>
        /// Verifica as requisições em aberto, se existir alguma, redireciona para página de erro
        /// </summary>
        private void CheckPendingRequests()
        {
            Common.Data.UserTO userTO = (Common.Data.UserTO)Session["user"];
            List<Common.Data.CreditBuyRequestTO> requests = Common.Data.CreditBuyRequest.GetBuyRequestListByUserId(userTO.id, true);
            if (requests.Count > 0)
            {
                // já existe requisição em aberto...
                Response.Redirect("BuyRequestExists.aspx");
            }
        }

        private void ProcessBuy()
        {
            if (Page.IsPostBack && Request.Url.Host == Request.UrlReferrer.Host && Request.HttpMethod == "POST")
            {
                Common.Data.UserTO userTO = (Common.Data.UserTO)Session["user"];
                float credits = float.Parse(Page.Request["buyvalue"]);
                int bank = int.Parse(Page.Request["bank"]);

                CheckPendingRequests();

                CreditBuyRequestTO to = new CreditBuyRequestTO();
                to.id = 0;
                to.request_date = DateTime.Now;
                to.credits = credits + Common.Data.CreditBuyRequest.CentsFromBank(bank);
                while (Common.Data.CreditBuyRequest.ValueExistsFromBank(bank, to.credits))
                {
                    to.credits += 0.01f;
                }
                to.user_id = userTO.id;
                to.bank_id = bank;
                to.confirmation_date = null;
                to.cancellation_date = null;
                to.adm_user_id = null;

                Common.Data.CreditBuyRequest.Insert(to);

                Response.Redirect("BuyRequestConfirmation.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
                ProcessBuy();
        }

        private void AddValues()
        {
            // ### valores fixos...
            buyvalue.Items.Add(new ListItem("Selecione", "0"));
            for (int i=10; i<=1000; i+=10)
            {
                buyvalue.Items.Add(new ListItem("R$ " + i.ToString() + ",00", i.ToString()));
            }
        }

        private void AddBanks()
        {
            List<BankAccountTO> list = BankAccount.GetAdminBankList();

            bank.Items.Add(new ListItem("Selecione", "0"));
            foreach (BankAccountTO to in list)
            {
                bank.Items.Add(new ListItem(to.name, to.id.ToString()));
            }
        }
    }
}
