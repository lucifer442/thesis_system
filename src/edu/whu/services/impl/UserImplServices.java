package edu.whu.services.impl;

import java.util.Map;

import edu.whu.services.support.JdbcServicesSupport;

public class UserImplServices extends JdbcServicesSupport
{
	/**
	 * �޸�����
	 * @return
	 * @throws Exception
	 */
	public boolean modify() throws Exception
	{
		StringBuilder comfirm=new StringBuilder()
				.append("select uid,upassword")
				.append("  from `user`")
				.append(" where uid=? and upassword=?")
				;
		Object args1[]= {
				this.getFromDto("cuid"),
				this.getFromDto("upassword1")
				};
		
		//ԭ���벻��ȷ����false
		if(this.queryForMap(comfirm.toString(), args1)==null)
		{
			return false;
		}
		
		StringBuilder sql=new StringBuilder()
				.append("update `user`")
				.append("   set upassword=?")
				.append(" where uid=?")
				;
		Object args2[]= {
				this.getFromDto("upassword2"),
				this.getFromDto("cuid")
		};
		return this.executeUpdate(sql.toString(), args2)>0;
	}
	
	public Map<String, String> queryByID() throws Exception
	{
    	StringBuilder sql=new StringBuilder()
    			.append("select uid,uname,upassword,name")
    			.append("  from user")
    			.append(" where uid=?")
    			;

    	return this.queryForMap(sql.toString(), this.getFromDto("cuid"));
	}
	
	/**
	 * ��������
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> queryByID(Object uid) throws Exception
	{
    	StringBuilder sql=new StringBuilder()
    			.append("select name")
    			.append("  from user")
    			.append(" where uid=?")
    			;
    	
    	return this.queryForMap(sql.toString(), uid);
	}
	
	/**
	 * ��¼
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> Login() throws Exception
	{
    	StringBuilder sql=new StringBuilder()
    			.append("select uid,name")
    			.append("  from user")
    			.append(" where uname=? and upassword=?")
    			;

		Object args[]= {
				this.getFromDto("uname"),
				this.getFromDto("upassword")
		};
		
    	return this.queryForMap(sql.toString(), args);
	}
}
