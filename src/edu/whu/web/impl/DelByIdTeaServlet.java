package edu.whu.web.impl;

import edu.whu.web.support.TeaControllerSupport;

public class DelByIdTeaServlet extends TeaControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ��");
		this.queryByID();
		//this.savePageData();
		return "queryTea";
	}
}
