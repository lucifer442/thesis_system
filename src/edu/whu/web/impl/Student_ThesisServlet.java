package edu.whu.web.impl;

import edu.whu.web.support.UserControllerSupport;

public class Student_ThesisServlet extends UserControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.queryByID();
		return "studentThesis";
	}

}
