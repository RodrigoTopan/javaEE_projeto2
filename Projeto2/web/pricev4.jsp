<%-- 
    Document   : tabela price
    Created on : 07/09/2017, 19:25:56
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<%double saldo_dev=0.0;
           double prest =0.0;                                                                      
           double ms =0; 
           double tx=0;
           double va=0.0;
           double amort=0.0;
           double jur=0;
           double P =0;
%>

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
            <input type="text" name="valor" value='<%=va%>'/>
            Taxa:
            <input type="text" name="taxa" value='<%=tx%>'/>
            Meses:
            <input type="text" name="meses" velue='<%=ms%>'/><br>
            <input type="submit" value="calcular"/>
        </form>

          <%  
           DecimalFormat fff = new DecimalFormat("###,###,###,###,###.##");
             String valor=request.getParameter("valor");
            String taxa= request.getParameter("taxa");
           String meses= request.getParameter("meses");
          
            if(valor!= null | taxa != null | meses != null){
             va = Double.parseDouble(valor);
             tx = ((Double.parseDouble(taxa))/100);
             ms = Double.parseDouble(meses);
              }            
             else
             out.print("<h1>Não deixe espaços em branco, Digite apenas números</h1>"); 
                  
            
             P =((va * tx)/(1-(1/Math.pow((1+tx),ms))));
                               
                <%for(int i = 1; i <= ms; i++){
                    
                    
                    
                    if(i == 1){
                        saldo_dev = va;
                        prest = 0;
                        jur = 0;
                        amort = 0;
                    }
                    else{
                        prest = P;
                        jur = saldo_dev * tx;
                        saldo_dev = (saldo_dev+jur)- prest;
                        amort = prest - jur;
                    }                   
                               
                <tr>
                    <td><%=i%></td>
                    <td><%=fff.format(saldo_dev)%></td>
                     <td><%=fff.format(amort)%></td>
                     <td><%=fff.format(jur)%></td>
                    <td><%=fff.format(prest)%></td>
                    
                </tr>
                <%}%>
            </table><%}%>
        </form> 
   </center>
    </body>
</html>
