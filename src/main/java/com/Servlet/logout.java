package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/logout")
public class logout extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				
				HttpSession session=request.getSession();
				session.removeAttribute("userDetails");
				
				HttpSession session2=request.getSession();
				session2.setAttribute("logoutsms", "Logout Successfully...");
				response.sendRedirect("login.jsp");
				
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
	
	}

	

}
