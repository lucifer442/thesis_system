package edu.whu.web.impl;

import edu.whu.web.support.StaffControllerSupport;

public class DelStaffServlet extends StaffControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("batchDelete","ɾ��");
		this.query();
		return "queryStaff";
	}

}
