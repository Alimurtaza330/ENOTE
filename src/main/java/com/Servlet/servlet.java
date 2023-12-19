package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.UserDeatil.UserDetail;
import com.connection.DBConnection;
import com.database.UserDatabase;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/servlet")
public class servlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
		
		String name=req.getParameter("username");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		
		UserDetail us=new UserDetail();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDatabase UD=new UserDatabase(DBConnection.getConnection());
		boolean fail=UD.newUser(us);
		PrintWriter out=res.getWriter();
		HttpSession session;
		
		
		if(fail) {
			
			session=req.getSession();
			session.setAttribute("reg-success", "User Registration Successfull...");
			res.sendRedirect("register.jsp");
		}
		else {
			session=req.getSession();
			session.setAttribute("failed-message", "Something went wrong on server");
			res.sendRedirect("register.jsp");
		}
		
		
	}

}
