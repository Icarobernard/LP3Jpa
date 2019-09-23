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
            <form class="form-horizontal" action="PedidoController?acao=confirmaOperacao&operacao=${operacao}" method ="POST" >


                <div class="container" align="center">
                    <!-- Text input-->
                    <table>
                        <tr>

                            <td> Codigo: </td>
                            <td> <input  type="text" name="txtId" value="${pedido.id}"  </td> 

                        </tr>

                        <tr>

                            <td>
                                Nome cliente: 

                            </td>

                            <td>
                                <input type="text" name="txtNome" value="${pedido.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                </td>    
                        </tr>

                            <tr>
                                <td>
                                    <label for="mesa">Mesa</label>
                                </td>

                                <td>
                                    <select class="form-control" name="txtMesa" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                    <option value="Mesa 1" <c:if test="${pedido.mesa.equals('Mesa 1')}"> selected</c:if>>Mesa 1</option>
                                    <option value="Mesa 2" <c:if test="${pedido.mesa.equals('Mesa 2')}"> selected</c:if>>Mesa 2</option>
                                    <option value="Mesa 3" <c:if test="${pedido.mesa.equals('Mesa 3')}"> selected</c:if>>Mesa 3</option>
                                    <option value="Mesa 4" <c:if test="${pedido.mesa.equals('Mesa 4')}"> selected</c:if>>Mesa 4</option>
                                    <option value="Mesa 5" <c:if test="${pedido.mesa.equals('Mesa 5')}"> selected</c:if>>Mesa 5</option>

                                    </select>
                                </td>
                            </tr>
                           
                            

                        <td colspan="4"> 
                                <select class="form-control" required name="txtDescricao" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                                <option required value="0" <c:if test="${pedido.produto == null}"> selected</c:if>> </option>  
                                <c:forEach items="${produtos}" var="produto">
                                    <option required value="${produto.nome}" <c:if test="${pedido.produto.id == produto.id}"> selected</c:if>>${produto.nome}</option>  
                                </c:forEach>
                            </select>

                        </td>

                        <tr><td><a href="PedidoController?acao=Only"><input type="button" class="btn btn-primary pull-right" value="voltar"></a></td><td colspan="3" class="tdsalvar" ><input class="btn btn-primary pull-right" type="submit" name="" value="salvar"></td></tr>

                    </table>
                </div>
            </form>
        </article>
    </body>

</html>



