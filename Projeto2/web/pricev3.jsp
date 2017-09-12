<%-- 
    Document   : tabela price
    Created on : 07/09/2017, 19:25:56
    Author     : Rodrigo
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="static java.lang.Math.pow"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Price</title>
        <head>   
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    </head>
    <body>
        <%@ include file="WEB-INF/jspf/header.jspf"%>
        <br><br>
        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron" align="center">
          <div class="container">
            <h1>Amortização Price</h1>
          <p align="justify">Os financiamentos utilizando a tabela Price são oferecidos com o propósito de prestações fixas ao longo do período de quitação do bem, sem aumento por algum tipo de correção (dependendo do contrato de financiamento). O método Price consiste em calcular prestações fixas.</p>
           <p><a class="btn btn-primary btn-lg" href="http://brasilescola.uol.com.br/matematica/financiamentos-utilizando-tabela-price.htm" role="button"> Saiba mais &raquo;</a></p>
          </div>
        </div>
    
    <div class="container">
        <form class="form-inline" align="center">
             <div class="form-group">
                    Valor:
                    <input type="text" name="txtSaldo" class="form-control" placeholder="Digite o valor do empréstimo"/>
             </div>
              <div class="form-group">
                    Tempo(meses):
                    <input type="text" name="txtPeriodo" class="form-control" placeholder="Digite o período para quitar"/>
              </div>
                <div class="form-group">
                    Taxa de Juros:
                    <input type="text" name="txtJuros"  class="form-control" placeholder="Digite a taxa de juros"/>
               </div>
            <input type="submit" name="btnCalcular" class="btn btn-default" value="Gerar tabela"/>
                </form>
            </div>
            <br/>
            
            <%
            //criando variaveis "totais"(somatorias).
                double totjur=0,totprest=0,totamort=0;
            //iniciando try/ catch para criar tab. de amortização
            try
            {
                DecimalFormat formata = new DecimalFormat("###,###,###,###,###.##");
                
                
                String parametroCalcular = request.getParameter("btnCalcular");
                double saldo = 0.00, juros = 0.00, CalculoJuros = 0.00, PMT = 0.00,
                prestacao = 0.00, Amortizacao = 0.00, jurosParcela = 0.00;                
                int periodo = 0; 
                String semValor = "-";   

                if (parametroCalcular != null) //se o submit for feito no form
                {
                    saldo = Double.parseDouble(request.getParameter("txtSaldo"));                
                    periodo = Integer.parseInt(request.getParameter("txtPeriodo"));
                    juros = Double.parseDouble(request.getParameter("txtJuros"));
                    
                    double[] novoSaldo = new double[periodo];
                    double[] novoJuros = new double[periodo];
                    double[] novaAmortizacao = new double[periodo];
                    
                    //realizando formula price para valor das prestações
                    CalculoJuros = Math.pow((1 + (juros / 100)), periodo);
                    PMT = saldo * ((CalculoJuros * (juros / 100)) / (CalculoJuros - 1));
                    
                    //retirando valor dos juros do primeiro mês
                    jurosParcela = saldo * (juros / 100);
                    
                    //inserindo valores do primeiro mês de quitação
                    novoJuros[0] = jurosParcela;
                    novaAmortizacao[0] = PMT - novoJuros[0];
                    novoSaldo[0] = saldo - novaAmortizacao[0];
                    
                %>            
    <div class="container">
                    <table class="table">
                                <tr>
                                    <th><center>Mês</center></th>
                                    <th><center>Saldo Devedor</center></th>
                                    <th><center>Amortização</center></th>
                                    <th><center>Juros</center></th>
                                    <th><center>Prestação</center></th>                                
                                </tr> 
                                <tr>
                                    <td><center>0</center></td>
                                    <td><center><%= saldo %></center></td>
                                    <td><center><%= semValor %></center></td>
                                    <td><center><%= semValor %></center></td>
                                    <td><center><%= semValor %></center></td>
                                </tr>
                                <tr>
                                    <td><center>1</center></td>
                                    <td><center><%= formata.format(novoSaldo[0]) %></center></td>
                                    <td><center><%= formata.format(novaAmortizacao[0]) %></center></td>
                                    <td><center><%= formata.format(novoJuros[0]) %></center></td>
                                    <td><center><%= formata.format(PMT) %></center></td>
                                </tr>
                    <%   //lógica for começando a partir do segundo mês do empréstimo
                        
                        for (int i = 1; i < periodo; i++)
                        {       
                                novoJuros[i] = novoSaldo[i - 1] * (juros / 100); //calculando novo juros com saldo devedor novo
                                novaAmortizacao[i] = PMT - novoJuros[i]; //nova amortização com base nos novos juros
                                novoSaldo[i] = novoSaldo[i - 1] - novaAmortizacao[i]; //por fim, novo saldo para realizar calculo para próximo mês
                               
                                //somando resultados
                                totprest=PMT*periodo;
                                totjur = totprest-saldo ;
                                //if(i>1){
                                totamort= saldo;  
                                //}
                            %>
                                <tr>
                                    <td><center><%= (i + 1) %></center></td>
                                    <td><center><%= formata.format(novoSaldo[i]) %></center></td>
                                    <td><center><%= formata.format(novaAmortizacao[i]) %></center></td>
                                    <td><center><%= formata.format(novoJuros[i])%> </center></td>
                                    <td><center><%= formata.format(PMT) %></center></td>
                                </tr> 
                            <%}%>
                            <td><center>Total</center></td>
                            <td><center>-</center></td>
                            <td><center><%= formata.format(totamort)%></center></td>
                            <td><center><%= formata.format(totjur)%></center></td>
                            <td><center><%= formata.format(totprest)%></center></td>
                    </table>
                        <%}%>  
                
                    
            
              
            <%}
            catch(Exception ex){ //devolvendo erro ao usuário caso tenha digitado letras%>
            <span style="color: red"><h2>Digite apenas números!!!</h2></span>
            <%}%>
    </div>
        </center>
    </body>
</html>