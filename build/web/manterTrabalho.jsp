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
        <title>Cadastro produto</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style type="text/css">
            body  {
                background-image: url("http://s-media-cache-ak0.pinimg.com/originals/20/70/f8/2070f812d6a581d5782c2df2f13165e8.gif"); }
            td{
                color: white;
            }
        </style>
    </head>

    <body>
        <article class="card-body">
            <form class="form-horizontal" action="ManterTrabalhoController?acao=confirmaOperacao&operacao=${operacao}" method ="POST" >


                <div class="container" align="center">
                    <!-- Text input-->
                    <table>
                        <tr>

                            <td> Codigo: </td>
                            <td> <input  type="text" name="txtId" value="${produto.id}"  </td> 

                        </tr>

                        <tr>

                            <td>
                                Nome produto: 

                            </td>

                            <td>
                                <input type="text" name="txtNome" value="${produto.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            </td>    
                        </tr>
                        
                                                <tr>

                            <td>
                                Preço:

                            </td>

                            <td>
                                <input type="text" name="txtPreco" value="${produto.preco}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            </td>    
                        </tr>






                        <tr><td><a href="PesquisaTrabalhoController"><input type="button" class="btn btn-primary pull-right" value="voltar"></a></td><td colspan="3" class="tdsalvar" ><input class="btn btn-primary pull-right" type="submit" name="" value="salvar"></td></tr>

                    </table>
                </div>
            </form>
        </article>
    </body>

</html>



