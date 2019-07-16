package edu.whu.services.impl;

import edu.whu.services.support.JdbcServicesSupport;

public class Delete extends JdbcServicesSupport {

	//学生禁用、删除方法
	public boolean disableStuByID() throws Exception
	{
		Object uid=this.getFromDto("uid");
		String sql="update user set ustate = '0' where uid="+uid;
		return this.executeUpdate(sql)>0;
	}
	
	public boolean disableStu() throws Exception
	{
		Object[] idlist=this.getIdList("idList");
		String sql="update user set ustate='0' where uid = ?";
		return this.batchUpdate(sql, idlist);
	}
	
	public boolean delStuByID() throws Exception
	{
		Object uid=this.getFromDto("uid");
		String sql1="delete from u_r_relation where uid="+uid;
		String sql2="delete from a01 where uid="+uid;
		String sql3="delete from user where uid="+uid;
		this.executeUpdate(sql1);
		this.executeUpdate(sql2);
		return this.executeUpdate(sql3)>0;
	}
	
	public boolean delStu() throws Exception
	{
		Object[] idlist=this.getIdList("idList");
		String sql1="delete from u_r_relation where uid=?";
		String sql2="delete from a01 where uid=?";
		String sql3="delete from user where uid=?";
		this.batchUpdate(sql1, idlist);
		this.batchUpdate(sql2, idlist);
		return this.batchUpdate(sql3, idlist);
	}
	
	//专家禁用、删除方法
	
}
