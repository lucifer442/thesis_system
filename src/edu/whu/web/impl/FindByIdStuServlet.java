package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;
import edu.whu.web.support.StuControllerSupport;

public class FindByIdStuServlet extends StuControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryByID();
		return "addStu";
	}

}
