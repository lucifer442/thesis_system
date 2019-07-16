package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;
import edu.whu.web.support.StuControllerSupport;

public class DelByIdStuServlet extends StuControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.queryByID();
		//this.savePageData();
		return "queryStu";
	}

}
