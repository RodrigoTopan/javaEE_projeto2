<%-- 
    Document   : tabela price
    Created on : 07/09/2017, 19:25:56
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Tabela Price!</h1>
        <form>
            Valor:
            <input type="text" name="valor"/>
            Taxa:
            <input type="text" name="taxa"/>
            Meses:
            <input type="text" name="meses"/>
            <input type="submit" value="calcular"/>
        </form>

          <%  String valor=request.getParameter("valor");
            String taxa= request.getParameter("taxa");
            String meses= request.getParameter("meses");%>
            
        
             <%double vl = (Double.parseDouble(valor));%>
             <%double tx = ((Double.parseDouble(taxa))/100);%>
             <%double ms = (Double.parseDouble(meses));%>
             <%double amort = (vl/ms); %>            
             
           
          <% double saldo_dev=0;
        double prest=0;
        double jur =0;%>
        
            <%for(int i=0; i<= ms ;i++){%>
                     <table border="1">     
        <tr><th>mes</th>  <th>Saldo a pagar</th>       <th>Amortização</th>       <th>Juros</th>         <th>Prestação</th></tr>                    
        <td><%=i%></td>   <td><%=saldo_dev%></td>      <td><%=amort%></td>      <td><%=jur%></td>       <td><%=prest%></td> 
                  </table> 
                   <%saldo_dev=(vl-amort);%>
               <%prest= ((saldo_dev*tx)+amort);%>
               <%jur = (saldo_dev*tx);%>
               
                
                <%}%>
        </form> 
   </center>
    </body>
</html>
