package edu.whu.web.impl;

import edu.whu.web.support.DicExcelControllerSupport;
import edu.whu.web.support.ExpControllerSupport;

public class DicExcelServlet extends DicExcelControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addEmp", "���", "��ӳɹ�,��Ա�������:", "uid");
		return "dicResults";
	}

}
