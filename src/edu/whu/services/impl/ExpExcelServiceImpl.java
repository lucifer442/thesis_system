package edu.whu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.whu.services.support.JdbcServicesSupport;
import edu.whu.system.db.DBUtils;
import edu.whu.system.tools.Tools;

public class ExpExcelServiceImpl extends JdbcServicesSupport 
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
    	DBUtils.beginTransaction();
    	String username = Tools.getFormatNumber("2","S");
    	boolean tag=false;
    	//��DTO���Ա�����
    	
    	
    	try
    	{
    	String sql2 = "insert into user(uname,upassword,name,ustate) values(?,?,?,?)";
    	
    	Object args2[]= {
    			username,
    			Tools.getMd5(username),
    			this.getFromDto("����").toString(),
    			"0"
    	};
    	this.executeUpdate(sql2.toString(), args2);
//    	String sql3  = "insert into u_r_relation(uid,rid,u_r_state) values(?,?,?)";
//    	Object args3[]= 
//    	{
//    		uid,
//    		"1",
//    		"1"
//    	};
//    	this.executeUpdate(sql3.toString(), args3);
    	

    	
    	//1.��дSQL���
    	StringBuilder sql = new StringBuilder()
				.append("insert into a06(uid,uid2,a601,a602,a603,a604,a605,")
				.append("                 a606,a607,a608,a609)")
				.append(" select user.uid,?,?,?,?,?,?,?,?,?,?  ")
				.append(" from user     ")
		        .append(" where user.uname=?  ");

    	//2.��д��������
    	Object args[]={
    			Integer.parseInt(this.getFromDto("�Ƽ���ʦid").toString().substring(0,1)),
    			this.getFromDto("������ѧ"),
    			this.getFromDto("ר������").toString().substring(0,1),
    			this.getFromDto("�о�����"),
    			this.getFromDto("ְ��").toString().substring(0,1),
    			this.getFromDto("���֤��"),
    			this.getFromDto("�����˻�"),
    			this.getFromDto("��������"),
    			this.getFromDto("�ֻ�����"),
    			this.getFromDto("����"),
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

