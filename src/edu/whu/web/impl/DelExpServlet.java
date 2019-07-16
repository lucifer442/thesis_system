package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;

public class DelExpServlet extends ExpControllerSupport 
{

	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "É¾³ý");
		this.query();
		return "queryExp";
	}
}
