using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LuckPrize.Common.Data;
using System.Drawing;

namespace LuckPrize
{
    public partial class BonusRanges : System.Web.UI.Page
    {
        bool odd = true;
        UserTO userTO;
        BonusRangesOnBuyTO rangeTO = new BonusRangesOnBuyTO();

        protected void Page_Load(object sender, EventArgs e)
        {
            userTO = (UserTO)Session["user"];

            if (Session["validated"] == null || (bool)Session["validated"] == false || userTO == null || userTO.access_level != Access_Level.Admin)
            {
                Response.Redirect("Default.aspx");
            }

            GenerateGrid();

            if (Page.IsPostBack)
            {
                this.Validate();
            }
            else
            {
                Populate();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void GenerateGrid()
        {
            grid.RowDataBound += new GridViewRowEventHandler(grid_RowDataBound);
            grid.Width = new Unit(750, UnitType.Pixel);

            grid.DataSource = Common.Data.BonusRangesOnBuy.GetBonusRangesTable();
            grid.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Visible = false;
            //e.Row.Cells[2].Width = 130; // data

            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.BackColor = Color.FromArgb(0xd0, 0xd0, 0xd0);
                foreach (TableCell cell in e.Row.Cells)
                {
                    cell.ForeColor = Color.Black;
                    cell.HorizontalAlign = HorizontalAlign.Left;
                    cell.BorderColor = Color.Black;
                }
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (odd)
                {
                    e.Row.BackColor = Color.WhiteSmoke;
                }
                else
                {
                    e.Row.BackColor = Color.White;
                }

                for (int i = e.Row.Cells.Count - 1; i > 0; i--)
                {
                    e.Row.Cells[i].Text = "<a href='BonusRanges.aspx?range_id=" + e.Row.Cells[0].Text + "' class='msglnk2b'>" + e.Row.Cells[i].Text + "</a>";
                    e.Row.Cells[i].ForeColor = Color.Black;
                    e.Row.Cells[i].HorizontalAlign = HorizontalAlign.Left;
                }

                //

                TableCell cellCancel = new TableCell();
                cellCancel.CssClass = "nomargin";

                Button btnCancel = new Button();
                btnCancel.CssClass = "nomargin";
                btnCancel.Text = " X ";
                btnCancel.Font.Size = 6;
                btnCancel.Height = 14;
                btnCancel.Attributes.Add("id", e.Row.Cells[0].Text);
                btnCancel.Click += new EventHandler(btnCancel_Click);

                cellCancel.Controls.Add(btnCancel);
                cellCancel.Width = 30;
                e.Row.Cells.Add(cellCancel);
            }

            odd = !odd;
        }

        void btnCancel_Click(object sender, EventArgs e)
        {
            Common.Data.BonusRangesOnBuy.Delete(int.Parse(((Button)sender).Attributes["id"]));
            Response.Redirect("BonusRanges.aspx");
        }


        void Populate()
        {
            if (Request["range_id"] == null)
            {
                btnSubmit.Text = "Inserir";
                return;
            }

            btnSubmit.Text = "Atualizar";
            int id = int.Parse(Request["range_id"]);
            rangeTO = Common.Data.BonusRangesOnBuy.GetBonusRange(id);
            update_id.Value = id.ToString();

            credits.Text = rangeTO.credits.ToString();
            bonus_percent.Text = rangeTO.bonus_percentage.ToString();
        }


        void ProcessRegister()
        {
            try
            {
                rangeTO.id = 0;
                rangeTO.credits = float.Parse(credits.Text);
                rangeTO.bonus_percentage = float.Parse(bonus_percent.Text);

                if (update_id.Value == "")
                {
                    // inserir
                    Common.Data.BonusRangesOnBuy.Insert(rangeTO);
                }
                else
                {
                    // atualizar
                    rangeTO.id = int.Parse(update_id.Value);
                    Common.Data.BonusRangesOnBuy.Update(rangeTO);
                }

                Response.Redirect("BonusRanges.aspx");
            }
            catch (Exception ex)
            {
                save_message.Text = "Erro nos dados!!!";
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
                ProcessRegister();
        }
    }
}
