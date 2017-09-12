<%-- 
    Document   : home
    Created on : 09/09/2017, 09:50:56
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
        <title> Home </title>
        <style>
.demo-card-wide.mdl-card {
  width: 100%;
  color:#fff;
  background-color: black;
}
.demo-card-wide > .mdl-card__title {
  color: #fff;
  font-weight: bolder;
  height: 176px;
}
.demo-card-wide > .mdl-card__menu {
  color:#fff;
 }
</style>
    </head>
     <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">JAVA EE PROJETO 2</a></center>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
        
        </div><!--/.navbar-collapse -->
      </div>
    </nav>
         <br><br>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron" align="center">
      <div class="container">
        <h1>Sistemas de amortização</h1>
        <p>Hoje nós iremos apresentar a solução para os seus problemas financeiros.<br>
        Gere uma tabela para as suas finanças e aumente o poder para gerir o seu dinheiro. Fácil e Rápido. </p>
      </div>
    </div>
  
    <hr>
    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>Americana</h2>
          <p>O Sistema Americano de Amortização é um tipo de quitação de empréstimo que favorece aqueles que desejam pagar o valor principal através de uma única parcela, porém os juros devem ser pagos periodicamente ou, dependendo do contrato firmado entre as partes, os juros são capitalizados e pagos junto ao valor principal.</p>
          <p><a class="btn btn-default" href="amortizacao-americana.jsp" role="button">Saiba Mais &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>Price</h2>
          <p>Os financiamentos utilizando a tabela Price são oferecidos com o propósito de prestações fixas ao longo do período de quitação do bem, sem aumento por algum tipo de correção (dependendo do contrato de financiamento). O método Price consiste em calcular prestações fixas.</p>
          <p><a class="btn btn-default" href="pricev3.jsp" role="button">Saiba Mais &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>Constante</h2>
          <p> As instituições financeiras oferecem um capital que deverá ser devolvido com juros durante o período pré-determinado. O funcionamento do sistema de amortizações constantes, que consiste no pagamento da dívida baseada em parcelas de amortizações iguais com prestações e juros decrescentes. </p>
          <p><a class="btn btn-default" href="amortizacao-constante.jsp" role="button">Saiba Mais &raquo;</a></p>
        </div>
      </div>
      <hr>
      <center><h1> Equipe </h1></center>
      <!--Equipe-->
      <div class="col-md-4">
    <div class="demo-card-wide mdl-card mdl-shadow--2dp">
      <div class="mdl-card__title" style="  background: url('darth-vader.jpg') center / cover;">
        <h2 class="mdl-card__title-text"></h2>
      </div>
      <div class="mdl-card__supporting-text">
          <h2>Rodrigo Alvis</h2>
          <h4> 4ºCiclo ADS - Vespertino</h4>
          <h4> Amortização Price </h4>
      </div>
        <br><br>
    </div>
      </div>
      <!--Equipe-->
      <div class="col-md-4">
    <div class="demo-card-wide mdl-card mdl-shadow--2dp">
        <div class="mdl-card__title" style="  background: url('iron-man.jpg'); background-size:cover; background-position-y:-100px;">
        <h2 class="mdl-card__title-text"></h2>
      </div>
      <div class="mdl-card__supporting-text">
          <h2>Rodrigo Moreira</h2>
          <h4>4ºCiclo ADS - Vespertino</h4>
          <h4> Front End - Amortização Constante</h4>
      </div>
        <br><br>
    </div>
      </div>
      <!--Equipe-->
    <div class="col-md-4">
    <div class="demo-card-wide mdl-card mdl-shadow--2dp">
      <div class="mdl-card__title" style="  background: url('spider-coffee_1.jpg'); background-size: cover; background-position-y:300px;">
        <h2 class="mdl-card__title-text"></h2>
      </div>
      <div class="mdl-card__supporting-text">
          <h2> Raul Tomaz</h2>
          <h4>4ºCiclo ADS -  Vespertino</h4>
          <h4> Amortização Americana</h4>
      </div>
        <br><br>
    </div>
    </div>
      <footer>
        <p>&copy; 2016 ADS, Inc.</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

