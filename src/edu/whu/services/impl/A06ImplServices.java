package edu.whu.services.impl;

import java.util.Map;

import edu.whu.services.support.JdbcServicesSupport;

public class A06ImplServices extends JdbcServicesSupport 
{
	public Map<String, String> queryByID() throws Exception
	{
    	StringBuilder sql=new StringBuilder()
    			.append("select x.uid,x.uid2,x.a601,a.fvalue a602,x.a603,")
    			.append("       b.fvalue a604,x.a605,x.a606,x.a607,x.a608,")
    			.append("       x.a609,u.`name`")
    			.append("  from syscode a,syscode b,a06 x,`user` u")
    			.append(" where x.a602=a.fcode and a.fname='a602'")
                .append("   and x.a604=b.fcode and b.fname='a604'")
    			.append("   and x.uid=u.uid")
                .append("   and x.uid=?")
    			;
    	
    	return this.queryForMap(sql.toString(), this.getFromDto("cuid"));
	}
}
