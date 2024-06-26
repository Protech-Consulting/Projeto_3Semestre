package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import model.PizzaBeans;
import model.PizzaDAO;

/**
 * Servlet implementation class PizzariaController
 */

@WebServlet(urlPatterns = { "/cadastrarPizza", "/viewCadastrarPizza", "/cardapio", "/consultarPizza",
		"/consultarPorTipoPizza", "/viewAtualizarPizza", "/atualizarPizza", "/deletarPizza", "/consultarPesquisaPizza",
		"/consultarPorIdPizza" })
@MultipartConfig
public class PizzariaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PizzaDAO daoPizza = new PizzaDAO();
	PizzaBeans beansPizza = new PizzaBeans();
	Gson gson = new Gson();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PizzariaController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		System.out.print(action);
		// Ação a partir da Url Recebida

		if (action.equals("/viewCadastrarPizza")) {
			HttpSession session = request.getSession();
			Object usuarioSession;
			Object NivelusuarioSession;
			try {
				NivelusuarioSession = session.getValue("nivel_usuario").toString();
				usuarioSession = session.getValue("id_usuario");
				System.out.print("Nivel" + NivelusuarioSession.toString());
				if (NivelusuarioSession.toString().equals("2")) {
					telaCadastro(request, response);
				} else {
					System.out.print("else");
					response.sendRedirect("admin/viewLogin");
				}
			} catch (Exception e) {
				response.sendRedirect("admin/viewLogin");
			}
		} else if (action.equals("/viewAtualizarPizza")) {
			HttpSession session = request.getSession();
			Object usuarioSession=null;
			Object NivelusuarioSession=null;
			try {
				NivelusuarioSession = session.getValue("nivel_usuario").toString();
				usuarioSession = session.getValue("id_usuario");
				System.out.print("Nivel" + NivelusuarioSession.toString());
			} catch (Exception e) {
				response.sendRedirect("admin/viewLogin");
			}
			if (NivelusuarioSession.toString().equals("2")) {
				TelaAtualizarPizza(request, response);
			} else {
				System.out.print("else");
				response.sendRedirect("admin/viewLogin");
			}
		} else if (action.equals("/consultarPizza")) {
			HttpSession session = request.getSession();
			Object usuarioSession;
			usuarioSession = session.getValue("id_usuario");
			if (usuarioSession == null) {
				response.sendRedirect("viewLoginUsuario");
			} else {
				System.out.print("IF");
				ConsultarPizza(request, response);
			}
		} else if (action.equals("/consultarPorTipoPizza")) {
			System.out.print("IF");
			ConsultarTipoPizza(request, response);
		} else if (action.equals("/consultarPesquisaPizza")) {
			System.out.print("IF");
			ConsultarPesquisaPizza(request, response);
		} else if (action.equals("/deletarPizza")) {
			System.out.print("IF");
			DeletarPizza(request, response);
		} else if (action.equals("/consultarPorIdPizza")) {
			ConsultarPizzaPorId(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		System.out.print(action);
		if (action.equals("/cadastrarPizza")) {
			CadastrarPizza(request, response);
		} else if (action.equals("/atualizarPizza")) {
			AtualizarPizza(request, response);
		}
	}

	protected void telaCadastro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("view/cadastroPizza.jsp");
	}

	protected void CadastrarPizza(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("");
		// Setando dados no Objeto PizzaBeans
		System.out.println(request.getParameter("txtEstoquePizza"));
		beansPizza.setNome_Pizza(request.getParameter("txtNomePizza"));
		beansPizza.setDescricao_Pizza(request.getParameter("txtDescricaoPizza"));
		beansPizza.setValor_Pizza(Double.parseDouble(request.getParameter("txtValorPizza")));
		beansPizza.setEstoque_Pizza(Boolean.parseBoolean(request.getParameter("txtEstoquePizza")));
		beansPizza.setTipo_Pizza(request.getParameter("txtTipoPizza"));

		String path = getServletContext().getRealPath("uploads");
		try {
			for (Part part : request.getParts()) {
				if (part.getName().equals("txtCaminhoImgPizza")) {
					System.out.println(path + File.separator + part.getSubmittedFileName());
					part.write(path + File.separator + part.getSubmittedFileName());
					beansPizza.setCaminho_img_Pizza("uploads/" + part.getSubmittedFileName());
				}
			}
		} catch (Exception e) {

		}

		System.out.println(beansPizza.isEstoque_Pizza());
		System.out.println(beansPizza.getNome_Pizza());
		System.out.println(beansPizza.getCaminho_img_Pizza());
		System.out.println(beansPizza.getDescricao_Pizza());
		System.out.println(beansPizza.getValor_Pizza());
		System.out.println(beansPizza.getTipo_Pizza());
		daoPizza.cadastrarPizza(beansPizza);

	}

	protected void AtualizarPizza(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Ta ai Jovem");
		System.out.println(beansPizza.getId_Pizza());
		// Setando dados no Objeto PizzaBeans
		beansPizza.setNome_Pizza(request.getParameter("txtNomePizza"));
		beansPizza.setCaminho_img_Pizza(request.getParameter("txtCaminhoImgPizza"));
		beansPizza.setDescricao_Pizza(request.getParameter("txtDescricaoPizza"));
		beansPizza.setValor_Pizza(Double.parseDouble(request.getParameter("txtValorPizza")));
		beansPizza.setEstoque_Pizza(Boolean.parseBoolean(request.getParameter("txtEstoquePizza")));
		beansPizza.setTipo_Pizza(request.getParameter("txtTipoPizza"));

		System.out.println(beansPizza.isEstoque_Pizza());
		System.out.println(beansPizza.getNome_Pizza());
		System.out.println(beansPizza.getCaminho_img_Pizza());
		System.out.println(beansPizza.getDescricao_Pizza());
		System.out.println(beansPizza.getValor_Pizza());
		System.out.println(beansPizza.getTipo_Pizza());
		daoPizza.alterarPizza(beansPizza);

	}

	protected void ConsultarPizza(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.printf("Aqui");
		ArrayList<PizzaBeans> listaPizza = daoPizza.consultaPizzas();
		request.setAttribute("pizzas", listaPizza);
		System.out.println();
		System.out.println();
		System.out.println(gson.toJson(listaPizza));
		response.getWriter().append(gson.toJson(listaPizza));
		RequestDispatcher rd = request.getRequestDispatcher("view/consultaPizza.jsp");
		rd.forward(request, response);
	}

	protected void DeletarPizza(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.printf("Aqui");
		Integer id = Integer.parseInt(request.getParameter("txtIdPizza"));
		daoPizza.DeletarPizza(id);
		System.out.print("Deletado");
	}

	protected void ConsultarTipoPizza(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.printf("Aqui");
		String tipo = request.getParameter("txtTipoPizza");
		ArrayList<PizzaBeans> listaPizza = daoPizza.consultaTipoPizzas(tipo);
		response.getWriter().append(gson.toJson(listaPizza));
	}

	protected void ConsultarPesquisaPizza(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.printf("Aqui");
		String pesquisa = request.getParameter("txtPesquisaPizza") + "%";
		String descricao = request.getParameter("txtPesquisaPizza") + "%";
		ArrayList<PizzaBeans> listaPizza = daoPizza.pesquisaPizzas(pesquisa, descricao);
		response.getWriter().append(gson.toJson(listaPizza));
	}

	protected void ConsultarPizzaPorId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("txtIdPizza"));
		ArrayList<PizzaBeans> listaPizza = daoPizza.consultaIdPizzas(id);
		response.getWriter().append(gson.toJson(listaPizza));
	}

	protected void TelaAtualizarPizza(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.printf("Aqui");
		Integer id = Integer.parseInt(request.getParameter("txtIdPizza"));
		beansPizza.setId_Pizza(id);
		ArrayList<PizzaBeans> listaPizza = daoPizza.consultaIdPizzas(id);
		request.setAttribute("pizzas", listaPizza);
		RequestDispatcher rd = request.getRequestDispatcher("view/telaAtualizarPizza.jsp");
		rd.forward(request, response);
	}

	protected void telaCardapio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("view/cardapios.html");
	}

}
