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
        <title>Amortização Americana</title>
    </head>
    <body>
        <h1><center>Amortização americana</center></h1>
        
        <!-- Criação do formulário de amortização americana -->
        <center>
            <div>
                <form name="frmAmericano">
                    Saldo devedor:<br/>
                    <input type="text" name="txtSaldo" placeholder="Digite o valor do empréstimo"/>
                    <br/>
                    Período de pagamento (meses):<br/>
                    <input type="text" name="txtPeriodo" placeholder="Digite o período para quitar"/>
                    <br/>
                    Taxa de Juros:<br/>
                    <input type="text" name="txtJuros" placeholder="Digite a taxa de juros"/>
                    <br/>
                    <input type="submit" name="btnCalcular" value="Exibir tabela"/>
                </form>
            </div>
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
                    <table border='1'>
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
            <span style="color: red"><h2>Digite apenas números!!!</h2></span>
            <%}%>
        </center>
    </body>
</html>
