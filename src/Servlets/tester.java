package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Classes.User;
import Database.DatabaseFunction;

/**
 * Servlet implementation class tester
 */
@WebServlet("/tester")
public class tester extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public tester() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password"); 
		User u = DatabaseFunction.getUserFromName(username);
		String email = u.getEmail();
		System.out.println("User: " + u.getUsername() + " " + u.getEmail());
		request.getSession().setAttribute("test", email);
		request.getSession().setMaxInactiveInterval(100000);

		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/GeneralFeed.jsp");
		dispatch.forward(request, response);
		
	}

}
