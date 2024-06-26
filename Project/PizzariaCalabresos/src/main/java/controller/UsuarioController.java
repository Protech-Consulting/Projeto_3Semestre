package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import conexao.conecta;
import model.PizzaBeans;
import model.UsuarioBeans;
import model.UsuarioDAO;

/**
 * Servlet implementation class UsuarioController
 */
@WebServlet(urlPatterns = { "/viewCadastrarUsuario","/viewLoginUsuario","/cadastrarUsuario","/logarUsuario","/editarUsuario","/deslogarUsuario","/admin/viewLogin"})
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioDAO daoUsuario = new UsuarioDAO();
	UsuarioBeans beansUsuario = new UsuarioBeans();
	Gson gson = new Gson();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuarioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getServletPath();
		System.out.print(action);
		if (action.equals("/viewCadastrarUsuario")) {
			TelaCadastro(request, response);
		}
		else if (action.equals("/viewLoginUsuario")) {
			TelaLogin(request, response);
		}
		else if (action.equals("/consultarUsuario")) {
			
		}
		else if (action.equals("/editarUsuario")) {
			EditarUsuario(request, response);
		}
		else if (action.equals("/deslogarUsuario")) {
			DeslogarUsuario(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getServletPath();
		System.out.print(action);
		if (action.equals("/cadastrarUsuario")) {
			CadastrarUsuario(request, response);
		}
		else if (action.equals("/logarUsuario")) {
			LoginUsuario(request, response);
		}
	}
	protected void TelaCadastro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("view/cadastroUsuario.jsp");
	}
	protected void TelaLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("view/loginUsuario.jsp");
	}
	protected void CadastrarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user = request.getParameter("txtUserUsuario");
		String password = request.getParameter("txtSenhaUsuario");
		int nivel_acesso = 1;
		String nome = request.getParameter("txtNomeUsuario");
		String cpf = request.getParameter("txtCpfUsuario");
		String complemento = request.getParameter("txtComplementoUsuario");
		String celular = request.getParameter("txtTelefoneUsuario");
		String rua = request.getParameter("txtRuaUsuario");
		String  bairro = request.getParameter("txtBairroUsuario");
		int numero = Integer.parseInt(request.getParameter("txtNumeroRuaUsuario"));
		password = security.Criptografia.criptografar(password);
		
		beansUsuario.setUser_Usuario(user);
		beansUsuario.setPassword_Usuario(password);
		beansUsuario.setNivel_acesso_Usuario(nivel_acesso);
		beansUsuario.setNome_Usuario(nome);
		beansUsuario.setCpf_Usuario(cpf);
		beansUsuario.setComplemento_Usuario(complemento);
		beansUsuario.setCelular_Usuario(celular);
		beansUsuario.setRua_Usuario(rua);
		beansUsuario.setBairro_Usuario(bairro);
		beansUsuario.setNumeroCasa_Usuario(numero);
		
		daoUsuario.cadastrarUsuario(beansUsuario);
		String retorno = String.valueOf(beansUsuario.getId_Usuario());
		System.out.print("Retorno:"+retorno);
		response.getWriter().append(retorno);
		if(retorno.isEmpty() == true || retorno == null || retorno.equals("0") ) {
			response.getWriter().append("Usuario não Cadastrado");
		}
		else {
			response.getWriter().append("Usuario Cadastrado");
			response.sendRedirect("viewLoginUsuario");
		}
		
		
		
	}
	protected void LoginUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//String user = "user";
		//String password = "Gus123";
		String user = request.getParameter("txtUsuario");
		String password = request.getParameter("txtSenha");
		password = security.Criptografia.criptografar(password);
		ArrayList<UsuarioBeans> listaUsuario = daoUsuario.loginUsuario(user,password);
		
		if (listaUsuario.isEmpty() == true || listaUsuario == null ) {
			System.out.print("Vazio");
			response.getWriter().append("Dados não Encontrados");
			response.getWriter().append(gson.toJson(listaUsuario));
		}
		else {
			System.out.print("Dados Aqui");
			response.getWriter().append("");
			response.getWriter().append("Dados Encontrados");
			response.getWriter().append("");
			response.getWriter().append(gson.toJson(listaUsuario));
			HttpSession session = request.getSession();
			session.putValue("id_usuario",listaUsuario.get(0).getId_Usuario());
			session.putValue("nivel_usuario",listaUsuario.get(0).getNivel_acesso_Usuario());
			
			System.out.print(session.getValue("id_usuario"));
			Object nv = session.getValue("nivel_usuario");
			Object cd = session.getValue("id_usuario");
			response.getWriter().append("Código Usuario"+cd.toString());
			response.getWriter().append("Nivel Usuario"+nv.toString());
			response.sendRedirect("consultarPizza");
		}
		
	}
	protected void DeslogarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException,IOException{
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("Usuario Deslogado");
		response.sendRedirect("view/cadastroUsuario.jsp");
	}
	
	protected void EditarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user = "user";
		String password = "Gus123";
		int nivel_acesso = 1;
		String nome = "GusTavo";
		String cpf = "12345678910";
		String complemento = "rua do cara mais lindo de todos";
		String celular = "11961535779";
		String rua = "Rua Elias checone";
		String  bairro = "Vila rosalina";
		int numero = 25;
		password = security.Criptografia.criptografar(password);
		beansUsuario.setUser_Usuario(user);
		beansUsuario.setPassword_Usuario(password);
		beansUsuario.setNivel_acesso_Usuario(nivel_acesso);
		beansUsuario.setNome_Usuario(nome);
		beansUsuario.setCpf_Usuario(cpf);
		beansUsuario.setComplemento_Usuario(complemento);
		beansUsuario.setCelular_Usuario(celular);
		beansUsuario.setRua_Usuario(rua);
		beansUsuario.setBairro_Usuario(bairro);
		beansUsuario.setNumeroCasa_Usuario(numero);
		beansUsuario.setId_Usuario(11);
		daoUsuario.editarUsuario(beansUsuario);
	}
	public void DeletarUsuario (Integer id) {
		String sql = "DELETE from tbusuario WHERE id_usuario = ?";
		try {
			Connection conn = conecta.getConnection();
			System.out.print("OK");
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.execute();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.print("ERRO: " + e);
		}
	}

}
