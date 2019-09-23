package controller;

import dao.DAO;
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
import model.Cliente;
@WebServlet (name="ClienteController", urlPatterns = "/ClienteController")
public class  ClienteController extends HttpServlet {

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
                    Logger.getLogger(ClienteController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                if (acao.equals("Only")) {
                    request.setAttribute("clientes", Cliente.findAll());
                    RequestDispatcher view = request.getRequestDispatcher("gridCliente.jsp");
                    view.forward(request, response);

                }
            }
        }
    }

    protected void prepararOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String operacao = request.getParameter("operacao");
        request.setAttribute("operacao", operacao);
       
        if (!operacao.equals("Incluir")) {
            Cliente cliente = Cliente.find(Long.parseLong(request.getParameter("id")));
            request.setAttribute("cliente", cliente);

        }
        request.getRequestDispatcher("manterCliente.jsp").forward(request, response);
    }

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, NoSuchMethodException {
        String operacao = request.getParameter("operacao");
         Long id = Long.parseLong(request.getParameter("txtIdCliente"));
        String nome = request.getParameter("txtNomeCliente");
        String sexo = request.getParameter("optTipoSexoCliente");
        String cpf = request.getParameter("txtCpfCliente");
        String email = request.getParameter("txtEmailCliente");
        String telefone = request.getParameter("txtTelefoneCliente");
        String login = request.getParameter("txtLoginCliente");
        String senha = request.getParameter("txtSenhaCliente");
        String logradouro = request.getParameter("txtLogradouroCliente");
        String cep = request.getParameter("txtCepCliente");
        String numero = request.getParameter("txtNumeroCliente");
        String complemento = request.getParameter("txtComplementoCliente");
        String bairro = request.getParameter("txtBairroCliente");
        String cidade = request.getParameter("txtCidadeCliente");
        String estado = request.getParameter("optTipoEstado");
        
        
    

        try {
          Cliente cliente = new Cliente(nome, sexo, cpf, email, telefone, login, senha, cep, logradouro, numero, complemento, bairro, cidade, estado);
          Object test = cliente;
          
            if (operacao.trim().equals("Incluir")) {
                cliente.save();
               
            } else if (operacao.equals("Editar")) {
                cliente.setId(id);
                cliente.save();
            } else if (operacao.equals("Excluir")) {
                cliente.setId(id);
                cliente.remove();
            }
            RequestDispatcher view = request.getRequestDispatcher("ClienteController?acao=Only");
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
            Logger.getLogger(AnuncianteController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchMethodException ex) {
            Logger.getLogger(AnuncianteController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AnuncianteController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AnuncianteController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchMethodException ex) {
            Logger.getLogger(AnuncianteController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AnuncianteController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
