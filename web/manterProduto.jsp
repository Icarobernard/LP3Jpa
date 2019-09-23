<%-- 
    Document   : manterCliente
    Created on : 23/10/2018, 10:33:52
    Author     : Samsung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

    <head>
        <title> Grid produto</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style type="text/css">
body  {
    background-image: url("https://i.pinimg.com/originals/b7/2a/e8/b72ae8c507cfe591af1fb01910834a5e.gif"); }
td{
    color: white;
}
</style>

    
  <script type="text/javascript" src="formatar.js"></script>
  

<script type="text/javascript" src="validarcaracter.js"></script>  

    </head>

    <body>
        <article class="card-body">
        <form class="form-horizontal" action="ProdutoController?acao=confirmaOperacao&operacao=${operacao}" method ="POST" >
            


            <div class="container" align="center">
                <!-- Text input-->
                <table>
                    <tr >
                        <td> Código </td>
                        <td> <input type="text" name="txtId"  value="${produto.id}"> </td> 

                    </tr>

                        <tr>
                            <td> Nome produto: </td>
                            <td> <input type="text" name="txtNome"  value="${produto.nome}"  > </td>

                        </tr>
                        
                        <tr>

                            <td>Preço produto: </td>

                            <td>
                                <input type="text" name="txtPreco"  value="${produto.preco}" onkeyup="validar(this,'numero')" >
                            </td>    
         
                        </tr>

                        
                        
                    <tr><td><a href="ProdutoController?acao=Only"><input type="button" value="voltar"></a></td><td colspan="3" class="tdsalvar" ><input type="submit" name="" value="salvar"></td></tr>

                </table>
            </div>
        </form>
    </article>
        </body>
    

</html>



