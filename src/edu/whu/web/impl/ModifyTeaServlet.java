package edu.whu.web.impl;

import edu.whu.web.support.BaseControllerSupport;
import edu.whu.web.support.ExpControllerSupport;
import edu.whu.web.support.TeaControllerSupport;

public class ModifyTeaServlet extends TeaControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyEmp", "ÐÞ¸Ä");
		return "queryTea";
	}

}
