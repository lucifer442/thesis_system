package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;

public class AddExpServlet extends ExpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addEmp", "���", "��ӳɹ�,��Ա�������:", "uid");
		return "addExp";
	}

}
