<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OurGames.aspx.cs" Inherits="LuckPrize.OurGames" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!-- #include file="header.aspx" -->

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:550px; background-image:url('img/pattern_01.jpg');">

        <br><h2>Nossos Jogos</h2><br /><br /><br /> <br /> 

        <b>Venha desfrutar da nossa experiência em jogos online!
        <br /><br />
        
        Venha jogar Bingo em um divertido e amigável ambiente seguro, batendo papo 
        e conhecendo pessoas de todo o mundo, além de muitas chances de ganhar 
        prêmios fantásticos ou escolha entre uma variedade de jogos de diversão 
        instantânea como Caça-Níqueis.
        </b>
        <br /><br /><br /><br />

        <center>
        <table border="0" width="600" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <a href="OurGames_Bingo.aspx" id="open_bingo" runat="server">
                        <img src="img/bingo.jpg" width="263" height="269" />
                    </a>
                </td>
                <td>
                    <a href="#" id="open_jackpot" runat="server">
                        <img src="img/jackpot_off.jpg" width="263" height="269" />
                    </a>
                </td>
            </tr>
        </table>
        </center>
        
    </div>

</div>

<!-- #include file="footer.aspx" -->

