package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;
import edu.whu.web.support.TeaControllerSupport;

public class FindByIdTeaServlet extends TeaControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryByID();
		return "addTea";
	}

}
