package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;

public class DelExpServlet extends ExpControllerSupport 
{

	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "ɾ��");
		this.query();
		return "queryExp";
	}
}
