package edu.whu.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.whu.services.impl.MessageServicesImpl;

@WebServlet("/message")
public class MessageServlet extends BaseServlet {
	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		try
		{
			this.getMessage(request);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("msg", "Õ¯¬Áπ ’œ!");
		}
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		this.doGet(request, response);
	}
}
