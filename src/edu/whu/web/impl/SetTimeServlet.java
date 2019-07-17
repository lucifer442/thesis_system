package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;
import edu.whu.web.support.SetTimeControllerSupport;
import edu.whu.web.support.TeaControllerSupport;

public class SetTimeServlet extends SetTimeControllerSupport 
{

	public SetTimeServlet() throws Exception {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute() throws Exception 
	{
		this.update("settime");
		return "setTime";
	}

}

