package edu.whu.services.impl;

import edu.whu.services.support.JdbcServicesSupport;
import edu.whu.system.tools.Tools;

public class ChooseRoleServicesImpl extends JdbcServicesSupport{
	
	public boolean chooseRole(String[] list,String uid) throws Exception 
	{
		String sql="insert into u_r_relation (uid,rid,u_r_state) values ("+uid+",?,'1')";
		for(String s:list)
		{
			this.executeUpdate(sql, s);
		}
		return true;
	}
	
}
