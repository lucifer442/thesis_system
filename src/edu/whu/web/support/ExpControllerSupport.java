package edu.whu.web.support;

import edu.whu.services.impl.A06ServicesImpl;

public abstract class ExpControllerSupport extends BaseControllerSupport
{
	public ExpControllerSupport() 
	{
		this.setServices(new A06ServicesImpl());
	}
}
