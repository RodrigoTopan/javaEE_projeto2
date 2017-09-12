<%-- 
    Document   : amortizacao-constante
    Created on : 11/09/2017, 02:17:13
    Author     : Rodrigo
--%>

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
        <title>Amortização Constante</title>
    </head>
    <body>
       <%@ include file="WEB-INF/jspf/header.jspf"%>
        <br><br>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron" align="center">
      <div class="container">
        <h1>Amortização Constante</h1>
       <p align="justify"> As instituições financeiras oferecem um capital que deverá ser devolvido com juros durante o período pré-determinado. O funcionamento do sistema de amortizações constantes, que consiste no pagamento da dívida baseada em parcelas de amortizações iguais com prestações e juros decrescentes. </p>
        <p><a class="btn btn-primary btn-lg" href="http://brasilescola.uol.com.br/matematica/sac-sistema-amortizacoes-constantes.htm" role="button"> Saiba mais &raquo;</a></p>
      </div>
    </div>
    
    <div class="container" id="cont">
        <form class="form-inline" align="center">
             <div class="form-group">
            Dívida:
            <input type="text" class="form-control" name="vlDivida" placeholder="Digite o valor da dívida(R$)"/>
             </div>
            <div class="form-group">
            Juros:
            <input type="text" class="form-control" name="juros" placeholder="Digite o valor da taxa de juros"/>
            </div>
            <div class="form-group">
            Parcelas(Meses):
            <input type="text" class="form-control" name="tempo" placeholder="Digite a quantidade de parcelas"/>
            </div>
            <input type="submit" name="btnCalcular" class="btn btn-default" value="Exibir tabela"/>
        </form>
        <br><br>
        <% try{
            String calcular = request.getParameter("btnCalcular");
            if(calcular!=null){
            double vlDivida = Double.parseDouble(request.getParameter("vlDivida"));
            double juros = Double.parseDouble(request.getParameter("juros"));
            juros=juros/100;
            int tempo = Integer.parseInt(request.getParameter("tempo"));
            double amortizacao=0;
            double prestacao=0;
            double vlJuros = vlDivida * juros;
            double ant=0;
            double antJ=0;
            double contSaldo=0;
            double contAmortizacao=0;
            double contJuros=0;
            double contPrestacao=0;
            
            %>
            <table class="table">
                    <tr>
                        <th>Meses</th>
                        <th>Saldo Devedor</th>
                        <th>Amortização</th>
                        <th>Juros(<%=juros%>)</th>
                        <th>Prestação</th>                     
                    </tr>
                    <% amortizacao= vlDivida/tempo; %>

                    <% for(int i=0;i<=tempo;i++){%>
                    <tr>
                        <td>
                            <%=i%>
                        </td>
                        <td>
                            <%if(i==0){%>
                            <%=vlDivida%>
                            <%ant=vlDivida;%>
                            <%vlDivida = vlDivida - amortizacao;%>
                            <%}else{%>
                            <%= vlDivida%>
                            <%ant=vlDivida;%>  
                            <%vlDivida = vlDivida - amortizacao;%>                  
                            <%}%>
                        </td>
                        <td>
                            <%=amortizacao%>
                        </td>
                        <td>
                           <%if(i!=0){%>
                             <%=vlJuros%>
                            <%antJ = vlJuros;%> 
                            <%vlJuros=ant*juros;%>
                             
                           <%}%>   
                        </td>
                        <td>
                           <%if(i>0){%>
                            <%prestacao=amortizacao+antJ;%>
                            <%=prestacao%>
                            <%}%>
                        </td>
                        <%contSaldo=contSaldo+vlDivida;
                        contAmortizacao=contAmortizacao+amortizacao;
                        contJuros=contJuros+vlJuros;
                        contPrestacao=contPrestacao+prestacao;%>
                    <%}%>
                    </tr>
                    <tr>
                        <td>Total:</td><td><%=contSaldo%></td><td><%=contAmortizacao%></td><td><%=contJuros%></td><td><%=contPrestacao%></td>
                    </tr>
              </table>
            <%}%> 
        <%}catch(Exception ex){%>
        <center><h2><span style="color: red">Digite apenas números!!</span></h2></center>
               <%}%>
    </div>
    </body>
</html>
