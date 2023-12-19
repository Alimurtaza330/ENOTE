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
import com.mysql.cj.Session;

@WebServlet("/editnote")
public class editnote extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Integer noteid = Integer.parseInt(request.getParameter("noteid"));
			String title = request.getParameter("title");
			String discription = request.getParameter("discription");

			mynotesDatabase mnd = new mynotesDatabase(DBConnection.getConnection());
			boolean f = mnd.updatenote(noteid, title, discription);
			if (f) {
				
				HttpSession session=request.getSession();
				session.setAttribute("updatemsg", "Note Update Successfully");
				response.sendRedirect("shownotes.jsp");
				
				
			} else {
				System.out.println("Data Update");
			}

		} catch (Exception e) { 
			e.printStackTrace();
		}

	}

}
