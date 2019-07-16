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

import com.sun.xml.internal.ws.api.message.Message;

import edu.whu.services.impl.InitServicesImpl;
import edu.whu.services.impl.LoginServicesImpl;
import edu.whu.services.impl.MessageServicesImpl;
import edu.whu.system.tools.Tools;
/**
  *  ��servlet���ܣ�
 * 1.��ʼ��ϵͳrfmap��Ϊ�ض���ɫ���ɹ����б� 
 * 2.�û���¼�жϣ��ж��û��˻���ȷ�ԣ��Ƿ񼤻 
 * 3.��½���ʼ���û����ݣ�session����funclist������messageServlet��ȡ��Ϣ;
 * 
 * @author Hzy
 */

@WebServlet("/login")
public class LoginServlet extends BaseServlet {
	
	@Override
	public void init()
	{
		InitServicesImpl services=new InitServicesImpl();
		try {
			Map<String,List<String>> rfmap=services.initQuery();
			this.getServletContext().setAttribute("rfmap", rfmap);
		} catch (Exception e) {
			System.out.println("init failed");
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException 
	{
		//����servicesImpl����
		LoginServicesImpl services=new LoginServicesImpl();
		Map<String,Object> map=null;
		try
		{
			String username=request.getParameter("username");
//			String password=request.getParameter("password");
			String password=Tools.getMd5(request.getParameter("password"));
			map=services.queryUser(username, password);
			if(map==null) 
			{
				request.setAttribute("msg","��¼ʧ�ܣ��û������������");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else if(map.get("isActivated").equals(false))
			{
				request.setAttribute("msg","��¼ʧ�ܣ��˺���Ч��δ�����");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else 
			{
				//�����û����еĹ����б�
				if((boolean) map.get("hasrole")) 
				{
					Map<String,List<String>> rfmap=(Map<String, List<String>>) this.getServletContext().getAttribute("rfmap");
					List<String> funclist=new ArrayList<String>();
					for(String s:(List<String>)map.get("rid"))
					{
						for(String s1:rfmap.get(s))
						{
							if(!funclist.contains(s1))
							{
								funclist.add(s1);
							}
						}
					}
					//�����õ���ֵ����session
					request.getSession().setAttribute("cuid",map.get("uid"));
					request.getSession().setAttribute("cname",map.get("name"));
					request.getSession().setAttribute("crolelist", map.get("rid"));
					request.getSession().setAttribute("funclist", funclist);
					this.getMessage(request);
					
					request.getRequestDispatcher("main.jsp").forward(request, response);
				}
				else
				{
					request.getSession().setAttribute("uid",map.get("uid"));
					request.getSession().setAttribute("name",map.get("name"));
					request.getRequestDispatcher("chooseRole.jsp").forward(request, response);
				}
			}
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			request.setAttribute("msg", "�������!");
		}
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		this.doGet(request, response);
	}
}