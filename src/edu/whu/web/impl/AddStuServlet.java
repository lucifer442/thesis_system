package edu.whu.web.impl;

import javax.websocket.Session;

import com.sun.glass.ui.Application;

import edu.whu.web.support.ExpControllerSupport;
import edu.whu.web.support.StuControllerSupport;

public class AddStuServlet extends StuControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addEmp", "���", "��ӳɹ�,��Ա�������:", "uid");
		return "addStu";
	}

}
