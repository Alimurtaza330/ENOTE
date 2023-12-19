package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.UserDeatil.UserDetail;
import com.connection.DBConnection;
import com.database.UserDatabase;

@WebServlet("/loginservlet")
public class loginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String email = req.getParameter("loginemail");
		String password = req.getParameter("loginpassword");

		UserDetail UD = new UserDetail();
		UD.setEmail(email);
		UD.setPassword(password);

		UserDatabase Ud = new UserDatabase(DBConnection.getConnection());
		UserDetail user=Ud.loginUser(UD);
		
		if(user!=null) {
			HttpSession session=req.getSession();
			session.setAttribute("userDetails", user);
			
			res.sendRedirect("home.jsp");
		}
		else {
			HttpSession session=req.getSession();
			session.setAttribute("login-sms", "Invalid Username and Password");
			res.sendRedirect("login.jsp");
		}
		
		
		

	}

}
