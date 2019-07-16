package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;
import edu.whu.web.support.TeaControllerSupport;

public final class QueryTeaServlet extends TeaControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.query();
		return "queryTea";
	}
}
