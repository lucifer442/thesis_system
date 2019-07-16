package edu.whu.web.impl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
				request.setAttribute("msg", "答辩时间区间设置有误");
			}
			if(datesub>7)
			{
				request.setAttribute("msg", "答辩时间区间过长");
			}
			if(a.before(new Date()));
			{
				request.setAttribute("msg", "请设置当前时间之后的时间段");
			}
			request.setAttribute("msg", "答辩时间区间为:"+btime+"~"+etime);
				int index =1;
				Date k = a;
				for(;index<=datesub;index++)
				{
					
					app01.setAttribute("date"+index, Tools.outputDate(k));
					k=Tools.addDate(k);
				}
				for(;index<=7;index++)
				{
					app01.setAttribute("date"+index, null);
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
