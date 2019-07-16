package edu.whu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.whu.services.support.JdbcServicesSupport;
import edu.whu.system.db.DBUtils;
import edu.whu.system.tools.Tools;

public class StuExcelServiceImpl extends JdbcServicesSupport 
{
	public boolean update(String utype) throws Exception 
    {
    	if(utype.equalsIgnoreCase("addEmp"))
    	{
    		return this.addEmp();
    	}
    	else
    	{
    		throw new Exception("����[ Ab01ServicesImpl ]�н�����δ����Ķ�������,����������  "+utype);
    	}	
    }
    
    public boolean addEmp()throws Exception
    {
    	String username = Tools.getFormatNumber("2","T");
    	boolean tag=false;
    	//��DTO���Ա�����
    	
    	DBUtils.beginTransaction();
    	try
    	{
    		String sql2 = "insert into user(uname,upassword,name,ustate) values(?,?,?,?)";
        	
        	Object args2[]= {
        			username,
        			Tools.getMd5(username),
        			this.getFromDto("����"),
        			"1"
        	};
        	this.executeUpdate(sql2.toString(), args2);
        	
        	
        	String sql3  = "insert into u_r_relation(uid,rid,u_r_state) select user.uid,?,? from user where user.uname=?";
        	Object args3[]= 
        	{	
        		"1",
        		"1",
        		username
        	};
        	this.executeUpdate(sql3.toString(), args3);
        	

        	
        	//1.��дSQL���
        	StringBuilder sql=new StringBuilder()
        			.append("insert into a01(uid,uid2,a101,a102,a103,a104)")
        			.append("select user.uid,?,?,?,?,?")
        			.append(" from user ")
        			.append("where user.uname=?")
        			;
        	//2.��д��������
        	Object args[]={
        			Integer.parseInt(this.getFromDto("��ʦid").toString().substring(0,1)) ,
        			this.getFromDto("ѧ��"),
        			this.getFromDto("���֤��"),
        			this.getFromDto("ѧ������"),
        			this.getFromDto("ѧԺ"),
        			username
        	               };
        	this.executeUpdate(sql.toString(), args);
    	DBUtils.commit();
    	}
    	catch(Exception ex)
    	{
    		DBUtils.rollback();
    		ex.printStackTrace();
    	}
    	finally
    	{
    		tag = true;
        	DBUtils.endTransaction();
    	}
    	
    	return tag;
    }
}

