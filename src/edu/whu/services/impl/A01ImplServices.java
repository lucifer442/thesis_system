package edu.whu.services.impl;

import java.util.Map;

import edu.whu.services.support.JdbcServicesSupport;

public class A01ImplServices extends JdbcServicesSupport
{
	
	public Map<String, String> queryByID() throws Exception
	{
    	StringBuilder sql=new StringBuilder()
    			.append("select uid,uid2,uid3,a101,a102,")
    			.append("       a103,a104,b101,a105")
    			.append("  from a01")
    			.append(" where uid=?")
    			;

    	Object uid= this.getFromDto("cuid");
    	Map<String, String> dto = new UserImplServices().queryByID(uid);
    	
    	dto.putAll(this.queryForMap(sql.toString(), this.getFromDto("cuid")));
    	
    	return dto;
	}
	
	public Map<String, String> queryUID2ByUID(Object object) throws Exception
	{
    	StringBuilder sql=new StringBuilder()
    			.append("select uid2")
    			.append("  from a01")
    			.append(" where uid=?")
    			;

    	return this.queryForMap(sql.toString(), object);
	}
	
}
