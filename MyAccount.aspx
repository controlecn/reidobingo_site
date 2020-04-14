<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="LuckPrize.MyAccount" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:520px; background-image:url('img/pattern_01.jpg');">

        <br><h2>Minha Conta</h2><br /><br /><br /><br />  

        <div style="float:left; width:255px; height:100px;">
            <a href="Bingo.aspx" target="_blank" class="myacclnk">
            <img src="img/myaccount/bingo.png" align="left" width="75" height="75" border="0" /><h4>BINGO 75</h4>Acesse a nossa sala de Bingo 
            <br />e boa sorte!</a>
        </div>

      
        <div style="float:left; width:255px; height:100px;">
            <a href="BuyRequest.aspx" class="myacclnk">
            <img src="img/myaccount/compra.png" align="left" width="75" height="75" border="0" /><h4>COMPRAR CRÉDITOS</h4>Compre créditos com toda comodidade e liberação imediata!
            </a>
        </div>

        
        <div style="float:left; width:255px; height:100px;">
            <a href="PrizeRequest.aspx" class="myacclnk">
            <img src="img/myaccount/saque.png" align="left" width="75" height="75" border="0" /><h4>SACAR PRÊMIOS</h4>Solicite direto para sua conta bancária ou converta em créditos e continue jogando!
            </a>
        </div>
        
       <br />

        <div style="float:left; width:255px; height:100px;">
            <a href="Extract.aspx" class="myacclnk">
            <img src="img/myaccount/extrato.png" align="left" width="75" height="75" border="0" /><h4>MEU EXTRATO</h4>Verifique seu desempenho: Apostas, prêmios, bônus, saques, etc...
            </a>
        </div>

        
        <div style="float:left; width:255px; height:100px;">
            <a href="Results.aspx" class="myacclnk">
            <img src="img/myaccount/resultado.png" align="left" width="75" height="75" border="0" /><h4>RESULTADOS</h4>Confira os últimos sorteios<br> e os ganhadores dos nossos prêmios!
            </a>
        </div>


        <div style="float:left; width:255px; height:100px;">
            <a href="Indications.aspx" class="indication">
            <img src="img/myaccount/indicacao.png" align="left" width="75" height="75" border="0" /><h4>MEU$ AFILIADO$</h4>Indique o LuckPrize para seus amigos e ganhe dinheiro!
            </a>
        </div>

       <br />

                       
        <div style="float:left; width:255px; height:100px;">
            <a href="ChangeCad.aspx" class="myacclnk">
            <img src="img/myaccount/cadastro.png" align="left" width="75" height="75" border="0" /><h4>ALTERAR CADASTRO</h4>Mantenha seus dados sempre atualizados!
            </a>
        </div>

        <div style="float:left; width:255px; height:100px;">
            <a href="MyMessages.aspx" class="myacclnk">
            <img src="img/myaccount/mensagem.png" align="left" width="75" height="75" border="0" /><h4>MINHAS MENSAGENS</h4>Fique de olho nas mensagens enviadas para você!
            </a>
        </div>

        <br />

        <div style="float:left; width:255px; height:100px;">
            <a href="http://www.comm100.com/livechat/" onclick="comm100_Chat();return false;" target="_blank" class="myacclnk">
            <img src="img/myaccount/atendimento.png" align="left" width="75" height="75" border="0" /><h4>ATENDIMENTO CHAT</h4>Nossos atendentes estão das 10:00 às 22:00 à sua disposição!
            </a>
        </div>
        
    </div>

</div>

<!-- #include file="footer.aspx" -->
