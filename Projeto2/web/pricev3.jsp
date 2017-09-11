<%-- 
    Document   : tabela price
    Created on : 07/09/2017, 19:25:56
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
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
            <input type="text" name="valor" value='1000'/>
            Taxa:
            <input type="text" name="taxa" value='1'/>
            Meses:
            <input type="text" name="meses" velue='1'/><br>
            <input type="submit" value="calcular"/>
        </form>

          <%  
           DecimalFormat formata = new DecimalFormat("###,###,###,###,###.##");
              String valor=request.getParameter("valor");
            String taxa= request.getParameter("taxa");
            String meses= request.getParameter("meses");
           double saldo_dev=1;
           double prest =1;                                                                      
           double ms =1; 
           double tx=1;
           double va=1;
           double amort=1;
           double jur=1;
            if(valor!= null | taxa != null | meses != null){
             va = Double.parseDouble(valor);
             tx = ((Double.parseDouble(taxa))/100);
             ms = Double.parseDouble(meses);
             amort = (va/ms);  }            
             else
             out.print("<h1>Não deixe espaços em branco, Digite apenas números</h1>"); 
                  
            for(int i=0; i<= ms ;i++){
                    out.print("<table border='1'>");     
        out.print("<tr><th>mes</th>  <th>Saldo a pagar</th>       <th>Amortização</th>       <th>Juros</th>         <th>Prestação</th></tr>");                    
    out.print("<td>"+i+"</td>  <td>"+ formata.format(saldo_dev) +"</td>      <td>"+formata.format(amort)+"</td>     <td>"+formata.format(jur)+"</td>       <td>"+formata.format(prest)+"</td>"); 
                  out.print("</table>"); 
                   saldo_dev =(va-amort);
               prest= ((saldo_dev*tx)+amort);
               jur = (saldo_dev*tx);
              }%>
        </form> 
   </center>
    </body>
</html>
