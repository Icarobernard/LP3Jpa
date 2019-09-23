<%@page contentType = "text/html" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Produtos</title>
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
                    <form action="ProdutoController?acao=prepararOperacao&operacao=Incluir" method="POST">

                        <a href="index.jsp"><button class="btn btn-outline-info" type="button"><i class="fas fa-arrow-left"></i> Voltar</button></a>
                       
                       
                        <Button class="btn btn-outline-info" type="submit" name="btnIncluir" > Incluir produto <i class="fas fa-plus"></i></Button>

                    </form>
                </div>

                <div class="col-md-9">
                    <table class="table table-list-search">

                        <thead>
                            <tr>
                                <td>Codigo</td>
                                <td>Nome</td>
                                 <td>Preço</td>
                               
                               <td >Operações</td> 
                            </tr>
                        </thead>
                        <c:forEach items="${produtos}" var="produto">
                            <tbody>
                                <tr>
                                    <td>
                                        <c:out value="${produto.id}" />
                                    </td>
                                    <td>
                                        <c:out value="${produto.nome}" />
                                    </td>
                                    <td>
                                        <c:out value="${produto.preco}" />
                                    </td>

                                    <td>
                                   
                                        <a  href="ProdutoController?acao=prepararOperacao&operacao=Editar&id=<c:out
                                               value="${produto.id}" />" >Editar <i class="fas fa-user-edit"></i></a>

                                   <a style="color: red" href="ProdutoController?acao=prepararOperacao&operacao=Excluir&id=<c:out
                                               value="${produto.id}" />" >Excluir <i class="fas fa-check"></i> </a></td>
                             
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>           
            </div>
        </div>
    </body>

</html>