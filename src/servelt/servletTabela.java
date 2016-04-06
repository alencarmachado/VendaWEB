package servelt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class servletTabela
 */
@WebServlet("/servletTabela")
public class servletTabela extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletTabela() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	 
		String dataVenda = request.getParameter("dataVenda");
		System.out.println("dataVenda: "+dataVenda);
		
		String idCliente = request.getParameter("idCliente");
		System.out.println("idCliente: "+idCliente);
		
		String[] qtd = request.getParameterValues("qtd[]");
		System.out.println("----> "+qtd);
		
		String[] id = request.getParameterValues("id[]");
		System.out.println("--- qtds...");
		
		for(String v: qtd){
			System.out.println("qtd: "+v);
		}
		
		System.out.println("--- ids ---");
		for(String i: id){
			System.out.println("id: "+i);
		}
		
		
		
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
