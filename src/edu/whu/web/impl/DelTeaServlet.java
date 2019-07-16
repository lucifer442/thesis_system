package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;
import edu.whu.web.support.TeaControllerSupport;

public class DelTeaServlet extends TeaControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "É¾³ý");
		this.query();
		return "queryTea";
	}
}
