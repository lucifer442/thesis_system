package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;

public class FindByIdExpServlet extends ExpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryByID();
		return "addExp";
	}

}
