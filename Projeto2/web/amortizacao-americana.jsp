<%-- 
    Document   : amortizacao-americana
    Created on : 09/09/2017, 09:41:01
    Author     : Raul
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <title>Amortização Americana</title>
    </head>
    <body>
    <%@ include file="WEB-INF/jspf/header.jspf"%>  
    <br><br>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron" align="center">
      <div class="container" id="cont">
        <h1>Amortização Americana</h1>
        <p align="justify">O Sistema Americano de Amortização é um tipo de quitação de empréstimo que favorece aqueles que desejam pagar o valor principal através de uma única parcela, porém os juros devem ser pagos periodicamente ou, dependendo do contrato firmado entre as partes, os juros são capitalizados e pagos junto ao valor principal.</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button"> Saiba mais &raquo;</a></p>
      </div>
    </div>
    <div class="container">
        <form class="form-inline" align="center">
        <!-- Criação do formulário de amortização americana -->            
        <div class="form-group">
                    Saldo devedor:
                    <input type="text" name="txtSaldo" class="form-control" placeholder="Digite o valor do empréstimo"/>
        </div>
        <div class="form-group">           
                    Período de pagamento (meses):
                    <input type="text" name="txtPeriodo" class="form-control" placeholder="Digite o período para quitar"/>
        </div>
        <div class="form-group">           
                    Taxa de Juros:
                    <input type="text" name="txtJuros" class="form-control" placeholder="Digite a taxa de juros"/>
        </div>           
                    <input type="submit" name="btnCalcular" class="form-control" value="Exibir tabela"/>
                </form>
            <br/>
            
            <%
            
            //iniciando try/ catch para criar tabela de amortização
            try
            {
                //utilizando biblioteca de formatação de casas decimais
                DecimalFormat formata = new DecimalFormat("###,###,###,###,###.##");
                
                //criação das variáveis para capturar valores do formulário
                String parametroCalcular = request.getParameter("btnCalcular");
                
                double saldo = 0.00, juros = 0.00, CalculoJuros = 0.00,
                        prestacao = 0, Amortizacao = 0, totalJuros = 0.00, totalPrestacao = 0.00;
                int periodo = 0; 
                String semValor = "-";

                if (parametroCalcular != null) //se o submit for feito no form
                {
                    saldo = Double.parseDouble(request.getParameter("txtSaldo"));                
                    periodo = Integer.parseInt(request.getParameter("txtPeriodo"));
                    juros = Double.parseDouble(request.getParameter("txtJuros"));
                %>            
                    <table class="table">
                                <tr>
                                    <th>Mês</th>
                                    <th>Saldo Devedor</th>
                                    <th>Amortização</th>
                                    <th>Juros</th>
                                    <th>Prestação</th>
                                </tr>
                    <%  CalculoJuros = saldo * (juros / 100); //calculo para encontrar os juros mensais
                        
                        for (int i = 1; i <= (periodo + 1); i++)
                        {%> 
                            <%
                                totalJuros = totalJuros + CalculoJuros;  //contador para somar juros mensais                              
                                if (i == 1){
                                    totalJuros = 0;
                            %>
                                <tr>
                                    <td><center><%= i %></center></td>
                                    <td><center><%= formata.format(saldo) %></center></td>
                                    <td><center><%= semValor %></center></td>
                                    <td><center><%= semValor %></center></td>
                                    <td><center><%= semValor %></center></td>
                                </tr>                            
                            
                            <%}else if (i == periodo) { //se o i for igual ao último mês%>
                                <tr>
                                    <td><center><%= i %></center></td>
                                    <td><center><%= semValor %></center></td>
                                    <td><center><%= formata.format(saldo) %></center></td>
                                    <td><center><%= formata.format(CalculoJuros) %> </center></td>
                                    <td><center><%= formata.format((saldo + CalculoJuros)) %></center></td>
                                </tr> 
                            <% }else if (i == (periodo + 1)){ //quando ele passar dos meses e for exibir o total
                                totalPrestacao = totalJuros + saldo; //soma do total de juros mensais + o saldo devedor pago no último mês
                            %>
                                <tr>
                                    <td><center>Total</center></td>
                                    <td><center><%= semValor %></center></td>
                                    <td><center><%= formata.format(saldo) %></center></td>
                                    <td><center><%= formata.format(totalJuros) %> </center></td>
                                    <td><center><%= formata.format(totalPrestacao) %></center></td>
                                </tr>
                            <%} else {%>
                                <tr>
                                    <td><center><%= i %></center></td>
                                    <td><center><%= formata.format(saldo) %></center></td>
                                    <td><center><%= semValor %></center></td>
                                    <td><center><%= formata.format(CalculoJuros) %> </center></td>
                                    <td><center><%= formata.format(CalculoJuros) %></center></td>
                                </tr> 
                            <%}%>
                        <%}%>

                    <%}%>   
                
                    </table>
            
              
            <%}
            catch(Exception ex){ //devolvendo erro ao usuário caso tenha digitado letras%>
            <span style="color: red"><h2>Digite apenas números!!</h2></span>
            <%}%>
        </center>
    </body>
</html>
