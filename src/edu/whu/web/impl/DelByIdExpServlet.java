package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;

public class DelByIdExpServlet extends ExpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ��");
		this.queryByID();
		//this.savePageData();
		return "queryExp";
	}

}
