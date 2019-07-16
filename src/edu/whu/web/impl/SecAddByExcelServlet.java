package edu.whu.web.impl;

import edu.whu.web.support.AdminControllerSupport;

public final class SecAddByExcelServlet extends AdminControllerSupport
{
	@Override
	public String execute()throws Exception
	{
		this.update("secAddByExcel","Ìí¼Ó");
		this.query();
		return "secManage";
	}
}
