package controller;

import dao.PersistenceUtil;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import model.Anunciante;
import model.Cliente;

public class Login {

    private static Login instance = new Login();

    public static Login getInstance() {
        return instance;
    }

    private Login() {

    }
    
    public Anunciante anuncianteLogin(String login) {
        EntityManager em = PersistenceUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        Anunciante anunciante = null;

        try {
                tx.begin();
            TypedQuery<Anunciante> query = em.createQuery("select p From Anunciante p WHERE p.login like :login", Anunciante.class);
            query.setParameter("login", login);
            anunciante = query.getSingleResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException(e);
        } finally {
            PersistenceUtil.close(em);
        }
        return anunciante;
    }

    
     public Cliente clienteLogin(String login) {
        EntityManager em = PersistenceUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        Cliente cliente = null;

        try {
                tx.begin();
            TypedQuery<Cliente> query = em.createQuery("select p From Cliente p WHERE p.login like :login", Cliente.class);
            query.setParameter("login", login);
            cliente = query.getSingleResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException(e);
        } finally {
            PersistenceUtil.close(em);
        }
        return cliente;
    }



}
