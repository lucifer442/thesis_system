package edu.whu.system.tools;

import java.io.IOException;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class RedirectFilter
 */
@WebFilter(servletNames={"SecQueryServlet"})
public class RedirectFilter implements Filter 
{
	public void destroy() 
	{
		
	}
 
	public void doFilter(ServletRequest servletRequest,ServletResponse servletResponse, FilterChain filterChain)throws IOException, ServletException 
	{
		HttpServletRequest req = (HttpServletRequest) servletRequest;
		HttpSession session = req.getSession();
		//��ȡcuid
		String cuid = (String)session.getAttribute("cuid");
		System.out.println("RedirectFilter:cuid = "+cuid);
		if (cuid != null && cuid!="") 
		{
			// ��������û��Ѿ���¼�����������¼�������
			filterChain.doFilter(servletRequest, servletResponse);
		}
		else 
		{
			// ��ת����ʾ��½ҳ��
			servletRequest.getRequestDispatcher("/redirect.jsp").forward(servletRequest, servletResponse);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException 
	{
		
	}
}
