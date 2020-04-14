using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LuckPrize.Common.Data;

namespace LuckPrize
{
    public partial class BuyRequestExists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["validated"] == null || (bool)Session["validated"] == false || Session["user"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (Page.IsPostBack) ProcessCancel();
            Populate();
        }

        private void ProcessCancel()
        {
            if (Page.IsPostBack && Request.Url.Host == Request.UrlReferrer.Host && Request.HttpMethod == "POST")
            {
                Common.Data.UserTO userTO = (Common.Data.UserTO)Session["user"];
                List<Common.Data.CreditBuyRequestTO> requests = Common.Data.CreditBuyRequest.GetBuyRequestListByUserId(userTO.id, true);
                if (requests != null && requests.Count > 0)
                {
                    Common.Data.CreditBuyRequest.Cancel(requests[0].id);
                    Response.Redirect("BuyRequest.aspx");
                }
            }
        }

        private void Populate()
        {
            Common.Data.UserTO userTO = (Common.Data.UserTO)Session["user"];
            List<Common.Data.CreditBuyRequestTO> requests = Common.Data.CreditBuyRequest.GetBuyRequestListByUserId(userTO.id, true);

            if (requests != null && requests.Count > 0)
            {
                num.Text = requests[0].id.ToString();
                data.InnerHtml = requests[0].request_date.ToString("dd/MM/yyyy");
                hora.InnerHtml = requests[0].request_date.ToString("HH:mm:ss");
                banco.InnerHtml = requests[0].extras.bank_name;
                valor.InnerHtml = Common.Util.Misc.FormatReal(requests[0].credits);
                agencia.Text = requests[0].extras.bank_agency;
                conta.Text = requests[0].extras.bank_account;
                titular.Text += requests[0].extras.bank_titular;
            }
            else
            {
                Response.Redirect("BuyRequest.aspx");
            }
        }
    }
}
