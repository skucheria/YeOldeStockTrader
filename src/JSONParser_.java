package kucheria_CSCI201L_Assignment2_Servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kucheria_CSCI201L_Assignment2_Classes.Parent;
import kucheria_CSCI201L_Assignment2_Classes.School;




/**
 * Servlet implementation class JSONParser_
 */
@WebServlet("/JSONParser_")
@MultipartConfig
public class JSONParser_ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public JSONParser_() {
		super();
	}
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part filePart = request.getPart("file"); 
//	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		InputStream fileContent = filePart.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(fileContent)); //putting file contents in the bufferedReader
		Parent allData = new Parent();
		Gson gson = new Gson();
		allData = gson.fromJson(br, Parent.class); //parsing the gson
		ArrayList<School> allSchools = allData.getSchools();
		
		String designNumber = request.getParameter("design"); //getting the design
		Boolean design1 = true;
		if("Design 2".equals(designNumber)) {
			design1 = false;
		}
		
	
		request.getSession().setAttribute("schools", allSchools);
		request.getSession().setAttribute("design", design1);
		request.getSession().setMaxInactiveInterval(1200);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
		dispatcher.forward(request, response);
		
	}
	

}