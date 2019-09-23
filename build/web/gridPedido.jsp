<%@page contentType = "text/html" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Pedidos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="main.js"></script>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 




        <Style type="text/css"> 
            body {
                margin-top: 2%
            }

 body  {
               background-image: linear-gradient(to top, #eefdff, #9abece, #5380a2, #1e4375, #080541);  
                background-repeat: no-repeat;
                background-size: 1900px 900px;
            }
td{
    color: white;
}




        </style>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <form action="PedidoController?acao=prepararOperacao&operacao=Incluir" method="POST">

                        <a href="index.jsp"><button class="btn btn-outline-info" type="button"><i class="fas fa-arrow-left"></i> Voltar</button></a>
                       
                       
                        <Button class="btn btn-outline-info" type="submit" name="btnIncluir" > Incluir pedido <i class="fas fa-plus"></i></Button>

                    </form>
                </div>

                <div class="col-md-9">
                    <table class="table table-list-search">

                        <thead>
                            <tr>
                                <td>Codigo</td>
                                <td>Mesa</td>
                                 <td>Nome cliente</td>
                                 <td>Prato</td>
                                
                               <td >Operações</td> 
                            </tr>
                        </thead>
                        <c:forEach items="${pedidos}" var="pedido">
                            <tbody>
                                <tr>
                                    <td>
                                        <c:out value="${pedido.id}" />
                                    </td>
                                    
                                    <td>
                                        <c:out value="${pedido.mesa}" />
                                    </td>
                                    
                                    <td>
                                        <c:out value="${pedido.nome}" />
                                    </td>
                                   
                                    
                                    <td>
                                        <c:out value="${pedido.descricao}" />
                                    </td>


                                    <td>
                                   
                                        <a  href="ManterPedidoController?acao=prepararOperacao&operacao=Editar&id=<c:out
                                               value="${pedido.id}" />" >Editar <i class="fas fa-user-edit"></i></a>
                                       
                                        
                                    
                                        <c:if test="${sessionScope.tipo != 'cliente'}">
                                   <a style="color: lawngreen" href="ManterPedidoController?acao=prepararOperacao&operacao=Excluir&id=<c:out
                                               value="${pedido.id}" />" >Atender <i class="fas fa-check"></i> </a></td>
                                        </c:if>     
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                     <a href="RelatorioControllerPedido"><input   class="btn btn-outline-info" type="submit" name="btnIncluir" value="Gerar relatório"></a>
                </div>           
            </div>
        </div>
    </body>

</html>