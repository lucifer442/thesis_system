package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;

public class EmailServlet extends ExpControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("email", "É¾³ý");
		this.queryByID();
		return "queryExp";
	}
}
