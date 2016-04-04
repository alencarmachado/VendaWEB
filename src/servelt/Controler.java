package servelt;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xalan.internal.xsltc.dom.ArrayNodeListIterator;

import Modelo.Cliente;
import Modelo.Produto;

/**
 * Servlet implementation class Controler
 */
@WebServlet("/Controler")
public class Controler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cliente c = new Cliente();
		c.setId(1L);
		c.setNome("Alencar");
		
		Cliente c1 = new Cliente();
		c1.setId(2L);
		c1.setNome("Paulo");
		
		Cliente c2 = new Cliente();
		c2.setId(3L);
		c2.setNome("Jose");
		
		Cliente c3 = new Cliente();
		c3.setId(3L);
		c3.setNome("Marcos");
		
		ArrayList<Cliente> clientes = new ArrayList<Cliente>();
		clientes.add(c);
		clientes.add(c1);
		clientes.add(c2);
		clientes.add(c3);
		
		Produto p = new Produto();
		p.setId(11L);
		p.setDescricao("Vinho Cabernet");
		p.setPreco(15.7f);
		
		Produto p1 = new Produto();
		p1.setId(12L);
		p1.setDescricao("Vinho Camernere");
		p1.setPreco(23.7f);
		
		Produto p2 = new Produto();
		p2.setId(13L);
		p2.setDescricao("Carvão");
		p2.setPreco(5.2f);
		
		ArrayList<Produto> produtos = new ArrayList<Produto>();
		produtos.add(p);
		produtos.add(p1);
		produtos.add(p2);
		
		
		
		RequestDispatcher dispatcher;
		String pagina = "/venda.jsp";
		request.setAttribute("clientes", clientes);	
		request.setAttribute("produtos", produtos);
		dispatcher= getServletContext().getRequestDispatcher(pagina);
		dispatcher.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
