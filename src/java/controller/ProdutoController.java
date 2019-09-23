package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;


@WebServlet (name="ProdutoController", urlPatterns = "/ ProdutoController")

public class  ProdutoController extends HttpServlet {

 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NoSuchMethodException, ClassNotFoundException {
        String acao = request.getParameter("acao");
        if (acao.equals("confirmaOperacao")) {
            confirmarOperacao(request, response);
        } else {
            if (acao.equals("prepararOperacao")) {
                try {
                    prepararOperacao(request, response);

                } catch (ClassNotFoundException ex) {
                    Logger.getLogger( ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                if (acao.equals("Only")) {
                    request.setAttribute("produtos", Produto.findAll());
                    RequestDispatcher view = request.getRequestDispatcher("gridProduto.jsp");
                    view.forward(request, response);

                }
            }
        }
    }


    
    
        protected void prepararOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String operacao = request.getParameter("operacao");
        request.setAttribute("operacao", operacao);
        if (!operacao.equals("Incluir")) {
            Produto produto = Produto.find(Long.parseLong(request.getParameter("id")));
            request.setAttribute("requesicao", produto);

        }
        request.getRequestDispatcher("manterProduto.jsp").forward(request, response);
    }
    
    
    
    

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, NoSuchMethodException {
        String operacao = request.getParameter("operacao");

        Long id = Long.parseLong(request.getParameter("txtId"));   
        String nome = request.getParameter("txtNome");
        Double preco = Double.parseDouble(request.getParameter("txtPreco"));
        
        

        try {
             Produto produto = new Produto(id, nome, preco);
            if (operacao.trim().equals("Incluir")) {
              
                produto.save();
            } else if (operacao.equals("Editar")) {
               produto.setId(id);
                produto.save();
            } else if (operacao.equals("Excluir")) {
                produto.setId(id);
                produto.remove();
            }
            RequestDispatcher view = request.getRequestDispatcher("PesquisaProdutoController");
            view.forward(request, response);
        } catch (IOException e) {
            throw new ServletException(e);
        } catch (ServletException e) {
            throw e;
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger( ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchMethodException ex) {
            Logger.getLogger( ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
         Logger.getLogger(ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
     }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger( ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchMethodException ex) {
            Logger.getLogger( ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
         Logger.getLogger(ProdutoController.class.getName()).log(Level.SEVERE, null, ex);
     }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
