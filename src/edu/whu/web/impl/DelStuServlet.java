package edu.whu.web.impl;

import edu.whu.web.support.ExpControllerSupport;
import edu.whu.web.support.StuControllerSupport;

public class DelStuServlet extends StuControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "ɾ��");
		this.query();
		return "queryStu";
	}
}
