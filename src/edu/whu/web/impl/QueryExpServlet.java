package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;

public final class QueryExpServlet extends ExpControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.query();
		return "queryExp";
	}
}
