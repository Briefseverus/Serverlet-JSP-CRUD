package com.example.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.daos.MegazineDao;

import com.example.models.Megazine;

@WebServlet("/MegazineController")
public class MegazineController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			MegazineDao megDao = new MegazineDao();
			List<Megazine> megs = megDao.getAllMegazine();
			request.setAttribute("megs", megs);
			request.getRequestDispatcher("MegazineDisplay.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("add".equals(action)) {
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String publisher = request.getParameter("publisher");
			double price = Double.parseDouble(request.getParameter("price"));

			Megazine newMegazine = new Megazine();
			newMegazine.setID(id);
			newMegazine.setTitle(title);

			newMegazine.setPublisher(publisher);
			newMegazine.setPrice(price);

			try {
				MegazineDao.createMegazine(newMegazine);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			response.sendRedirect(request.getContextPath() + "/MegazineController");

		} else if ("delete".equals(action)) {
			String id = request.getParameter("id");

			try {
				MegazineDao.deleteMegazine(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			response.sendRedirect(request.getContextPath() + "/MegazineController");
		} else if ("update".equals(action)) {
	        
	        String id = request.getParameter("id");
	        String title = request.getParameter("title");
	        String publisher = request.getParameter("publisher");
	        double price = Double.parseDouble(request.getParameter("price"));

	     
	        Megazine megazine = new Megazine();
	        megazine.setID(id);
	        megazine.setTitle(title);
	        megazine.setPublisher(publisher);
	        megazine.setPrice(price);

	        try {
	            
	            MegazineDao.updateMegazine(megazine);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }


	        response.sendRedirect(request.getContextPath() + "/MegazineController");
	    }
		
		
	}
}
