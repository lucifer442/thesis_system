package edu.whu.web.impl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.print.attribute.standard.MediaSize.Other;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.whu.services.impl.TimeSetImpl;
import edu.whu.system.tools.Tools;

/**
 * Servlet implementation class TimeServlet
 */
@WebServlet("/TimeServlet")
public class TimeServlet extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String btime=request.getParameter("btime");
		String etime=request.getParameter("etime");	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try 
		{
			Date a = sdf.parse(btime);
			Date b = sdf.parse(etime);


			long datesub = Tools.datesub(a, b);
			ServletContext app01 = this.getServletContext();
        	app01.setAttribute("btime", btime); 
        	app01.setAttribute("etime", etime); 
        	app01.setAttribute("datesub", datesub); 
			if(datesub<=0)
			{
				request.setAttribute("msg", "���ʱ��������������");
			}
			else if(datesub>7)
			{
				request.setAttribute("msg", "���ʱ���������");
			}
			else if(a.before(new Date()))
			{
				request.setAttribute("msg", "�����õ�ǰʱ��֮���ʱ���");
			}
			else
			{
				request.setAttribute("msg", "���ʱ������Ϊ:"+btime+"~"+etime);
				int index =1;
				Date k = a;
				for(;index<=datesub;index++)
				{	
					app01.setAttribute("date"+index, Tools.outputDate(k).substring(5));
					k=Tools.addDate(k);
				}
				for(;index<=7;index++)
				{
					app01.setAttribute("date"+index, null);
				}
				TimeSetImpl ts = new TimeSetImpl();
			    ts.timeclear();
			}
				
			} 
			catch (Exception e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
		    request.getRequestDispatcher("timeManage.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
