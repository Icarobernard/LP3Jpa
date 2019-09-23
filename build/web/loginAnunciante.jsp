<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset ="UTF-8"/>
        <title>Login admin</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style type="text/css">
 body  {
               background-image: linear-gradient(to top, #eefdff, #9abece, #5380a2, #1e4375, #080541);  
                background-repeat: no-repeat;
                background-size: 1900px 900px;
            }

td{
    color: white;
}
</style>
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous"></script>

   
 
    
    
    
    
    
    </head>

    <body>
       
        <article class="card-body">
        <form class="well span8" action="LoginAnunciante" method ="POST" >
            

              

                <div class="container" align="center">
                    
                    
                    <table>
                        <tr class="col-md-6 mb3">
                            <td class="span3">Login</td>
                            <td> <input type="text" name="txtLogin" class="form-control"></td>

                    </tr>

                        <tr class="span3" >
                            <td class="span3"> Senha: </td>
                            <td> <input type="password" name="txtSenha" class="form-control"   > </td>
                        </tr>



                </table>
                <br>
                <a  href="index.jsp"><input  type="button" class="btn btn-outline-light" value="voltar"></a>
                <input type="submit" name="" class="btn btn-outline-success" value="Logar"></td></tr>
            </div>
        </form>
    </article>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>

</html>