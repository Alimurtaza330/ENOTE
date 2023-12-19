package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import com.UserDeatil.mynotes;
import com.connection.DBConnection;
import com.database.mynotesDatabase;

@WebServlet("/addNote")
public class addnotes extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int uid=Integer.parseInt(request.getParameter("uid"));
		String title=request.getParameter("title");
		String discription=request.getParameter("discription");
		
		mynotesDatabase mn=new mynotesDatabase(DBConnection.getConnection());
		boolean f= mn.addnotes(title, discription, uid);
		if(f) {
			response.sendRedirect("shownotes.jsp");
		}
		else {
			System.out.println("Data not Inserted ");
		}
		
		
		
	}

}
