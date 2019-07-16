package edu.whu.web.support;

import edu.whu.services.impl.A02ServicesImpl;
import edu.whu.services.impl.A06ServicesImpl;

public abstract class TeaControllerSupport extends BaseControllerSupport
{
	public TeaControllerSupport() 
	{
		this.setServices(new A02ServicesImpl());
	}
}
