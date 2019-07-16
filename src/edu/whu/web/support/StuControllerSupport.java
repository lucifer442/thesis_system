package edu.whu.web.support;

import edu.whu.services.impl.A01ServicesImpl;
import edu.whu.services.impl.A06ServicesImpl;

public abstract class StuControllerSupport extends BaseControllerSupport
{
	public StuControllerSupport() 
	{
		this.setServices(new A01ServicesImpl());
	}
}
