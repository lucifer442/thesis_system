package edu.whu.web.impl;

import edu.whu.web.support.BaseControllerSupport;
import edu.whu.web.support.ExpControllerSupport;

public class ModifyExpServlet extends ExpControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyEmp", "�޸�");
		return "queryExp";
	}

}
