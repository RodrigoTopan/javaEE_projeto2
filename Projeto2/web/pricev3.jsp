<%-- 
    Document   : tabela price
    Created on : 07/09/2017, 19:25:56
    Author     : Rodrigo
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Price</title>
    </head>
    <body>
        <h1><center>Tabela Price</center></h1>
        
        <!-- Criação do formulário de amortização price -->
        <center>
            <div>
                <form name="frmPrice">
                    Valor:<br/>
                    <input type="text" name="txtSaldo" placeholder="Digite o valor do empréstimo"/>
                    <br/>
                    Tempo(meses):<br/>
                    <input type="text" name="txtPeriodo" placeholder="Digite o período para quitar"/>
                    <br/>
                    Taxa de Juros:<br/>
                    <input type="text" name="txtJuros" placeholder="Digite a taxa de juros"/>
                    <br/>
                    <input type="submit" name="btnCalcular" value="Calcular"/>
                </form>
            </div>
            <br/>
            
            <%
            
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
                    <table border='1'>
                                <tr>
                                    <th bgcolor="YELLOW">Mês</th>
                                    <th bgcolor="YELLOW">Saldo Devedor</th>
                                    <th bgcolor="YELLOW">Amortização</th>
                                    <th bgcolor="YELLOW">Juros</th>
                                    <th bgcolor="YELLOW">Prestação</th>
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
                            
                            %>
                                <tr>
                                    <td><center><%= (i + 1) %></center></td>
                                    <td><center><%= formata.format(novoSaldo[i]) %></center></td>
                                    <td><center><%= formata.format(novaAmortizacao[i]) %></center></td>
                                    <td><center><%= formata.format(novoJuros[i])%> </center></td>
                                    <td><center><%= formata.format(PMT) %></center></td>
                                </tr> 
                            <%}%>
                            </table>
                        <%}%>  
                
                    
            
              
            <%}
            catch(Exception ex){ //devolvendo erro ao usuário caso tenha digitado letras%>
            <span style="color: red"><h2>Digite apenas números!!!</h2></span>
            <%}%>
        </center>
    </body>
</html>