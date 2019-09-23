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
import model.Anunciante;

@WebServlet(name = "AnuncianteController", urlPatterns = "/AnuncianteController")

public class AnuncianteController extends HttpServlet {

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
                    Logger.getLogger(AnuncianteController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                if (acao.equals("Only")) {
                    request.setAttribute("anunciantes", Anunciante.findAll());
                    RequestDispatcher view = request.getRequestDispatcher("gridAnunciante.jsp");
                    view.forward(request, response);

                }
            }
        }
    }

    protected void prepararOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String operacao = request.getParameter("operacao");
        request.setAttribute("operacao", operacao);
        if (!operacao.equals("Incluir")) {
            Anunciante anunciante = Anunciante.find(Long.parseLong(request.getParameter("id")));
            request.setAttribute("anunciante", anunciante);

        }
        request.getRequestDispatcher("manterAnunciante.jsp").forward(request, response);
    }

    public void confirmarOperacao(HttpServletRequest request, HttpServletResponse response) throws ServletException, NoSuchMethodException {
        String operacao = request.getParameter("operacao");
        Long id = Long.parseLong(request.getParameter("txtIdAnunciante"));
        String nome = request.getParameter("txtNomeAnunciante");
        String sexo = request.getParameter("optSexoAnunciante");
        String cpf = request.getParameter("txtCpfAnunciante");
        String email = request.getParameter("txtEmailAnunciante");
        String telefone = request.getParameter("txtTelefoneAnunciante");
        String login = request.getParameter("txtLoginAnunciante");
        String senha = request.getParameter("txtSenhaAnunciante");
        String logradouro = request.getParameter("txtLogradouroAnunciante");
        String cep = request.getParameter("txtCepAnunciante");
        String numero = request.getParameter("txtNumeroAnunciante");
        String complemento = request.getParameter("txtComplementoAnunciante");
        String bairro = request.getParameter("txtBairroAnunciante");
        String cidade = request.getParameter("txtCidadeAnunciante");
        String estado = request.getParameter("optTipoEstado");

        try {
            Anunciante anunciante = new Anunciante(nome, sexo, cpf, email, telefone, login, senha, cep, logradouro, numero, complemento, bairro, cidade, estado);

            if (operacao.equals("Incluir")) {
                anunciante.save();
            } else if (operacao.equals("Editar")) {
                anunciante.setId(id);
                anunciante.save();
            } else if (operacao.equals("Excluir")) {
                anunciante.setId(id);
                anunciante.remove();
            }
            RequestDispatcher view = request.getRequestDispatcher("AnuncianteController?acao=Only");
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
