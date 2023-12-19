package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.connection.DBConnection;
import com.database.mynotesDatabase;


@WebServlet("/deletenote")
public class deletenote extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Integer noteid=Integer.parseInt(request.getParameter("noteid"));
		
		mynotesDatabase mn=new mynotesDatabase(DBConnection.getConnection());
		boolean f=mn.deletenote(noteid);
		if(f) {
			
			HttpSession session=request.getSession();
			session.setAttribute("updatemsg", "Note Delete Successfully...");
			response.sendRedirect("shownotes.jsp");
		}
		else {
			HttpSession session=request.getSession();
			session.setAttribute("failsms", "Something went wrong...");
			response.sendRedirect("shownotes.jsp");
		}
		
		
	}

}
