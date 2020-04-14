using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LuckPrize
{
    public partial class BuyRequestConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["validated"] == null || (bool)Session["validated"] == false || Session["user"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            Populate();
        }

        private void Populate()
        {
            Common.Data.UserTO userTO = (Common.Data.UserTO)Session["user"];
            List<Common.Data.CreditBuyRequestTO> requests = Common.Data.CreditBuyRequest.GetBuyRequestListByUserId(userTO.id, true);

            if (requests != null && requests.Count > 0)
            {
                numero.Text = requests[0].id.ToString();
                creditos.Text = Common.Util.Misc.FormatReal((float)(int)requests[0].credits);
                data.Text = requests[0].request_date.ToString("dd/MM/yyyy");
                banco.Text = requests[0].extras.bank_name;
                agencia.Text = requests[0].extras.bank_agency;
                conta.Text = requests[0].extras.bank_account;
                titular.Text = requests[0].extras.bank_titular;
                valor.Text = Common.Util.Misc.FormatReal(requests[0].credits);
            }
            else
            {
                Response.Redirect("BuyRequest.aspx");
            }
        }

    }
}
