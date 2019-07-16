package edu.whu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.whu.services.support.JdbcServicesSupport;
import edu.whu.system.db.DBUtils;
import edu.whu.system.tools.Tools;

public class A01ServicesImpl extends JdbcServicesSupport 
{
    public boolean update(String utype) throws Exception 
    {
    	if(utype.equalsIgnoreCase("addEmp"))
    	{
    		return this.addEmp();
    	}
    	else if(utype.equalsIgnoreCase("deleteById"))
    	{
    		return this.deleteById();
    	}
    	else if(utype.equalsIgnoreCase("modifyEmp"))
    	{
    		return this.modifyEmp();
    	}
    	else if(utype.equalsIgnoreCase("batchDelete"))
    	{
    		return this.batchDelete();
    	}
    	else
    	{
    		throw new Exception("����[ Ab01ServicesImpl ]�н�����δ����Ķ�������,����������  "+utype);
    	}	
    }
	
    private boolean deleteById()throws Exception
    {
    	boolean tag = false;
    	DBUtils.beginTransaction();
    	try 
    	{  		
    		String sql="delete from a01 where uid=?";
    		this.executeUpdate(sql, this.getFromDto("uid"));
    		String sql2="update u_r_relation set u_r_state=0 where uid=?";
    		this.executeUpdate(sql2, this.getFromDto("uid"));
    		String sql3="update user set ustate=0 where uid=?";
    		this.executeUpdate(sql3, this.getFromDto("uid"));
    	}
    	catch(Exception ex)
    	{
    		DBUtils.rollback();
    		ex.printStackTrace();
    	}
    	finally
    	{
    		DBUtils.endTransaction();
    	}
    	return tag;
    }
    
    private boolean modifyEmp()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update a01 a, user b")
    			.append("   set a.a101=?,a.a102=?,a.a103=?,a.a104=?,b.name=?")
    			.append(" where a.uid=b.uid")
    			.append("   and a.uid=?")
    			;
    	Object args[]={
    			this.getFromDto("a101"),
    			this.getFromDto("a102"),
    			this.getFromDto("a103"),
    			this.getFromDto("a104"),
    			this.getFromDto("name"),
    			this.getFromDto("uid")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
    private boolean addEmp()throws Exception
    {
    	String username = Tools.getFormatNumber("1","S");
    	boolean tag=false;
    	//��DTO���Ա�����
    	
    	DBUtils.beginTransaction();
    	try
    	{
    	String sql2 = "insert into user(uname,upassword,name,ustate) values(?,?,?,?)";
    	
    	Object args2[]= {
    			username,
    			Tools.getMd5(username),
    			this.getFromDto("name"),
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
    			Integer.parseInt(this.getFromDto("uid2").toString()) ,
    			this.getFromDto("a101"),
    			this.getFromDto("a102"),
    			this.getFromDto("a103"),
    			this.getFromDto("a104"),
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

    private boolean batchDelete()throws Exception
    {
    	//1.����SQL���
    	String sql="delete from a01 where uid=?";
    	//2.��ȡҳ��idlist����
    	String idlist[]=this.getIdList("idlist");
    	//3.ִ��
    	return this.batchUpdate(sql, idlist);
    }

    
    
    public Map<String,String> queryByID()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select b.name,a.uid,a.uid2,a.a101,a.a102,a.a103,a.a104")
    			.append("  from a01 a,user b")
    			.append(" where a.uid=b.uid")
    			.append("   and a.uid=?")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.getFromDto("uid"));
    }
    
    
      /**
       * ����������ѯ
       * @return
       * @throws Exception
       */
	  public List<Map<String,String>> query()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object name=this.getFromDto("qname");   
	  		Object a101=this.getFromDto("qa101");     
  		    Object a104=this.getFromDto("qa104");    
    
	  		
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
	  				.append("select b.name,a.uid,a.uid2,a.a101,a.a102,a.a103,a.a104")
	  				.append("  from a01 a,user b,u_r_relation c")
	  				.append(" where a.uid=b.uid")
	  				.append(" and c.uid=b.uid")
	  				.append(" and c.rid=1")
	  				;
	  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(name))
	  		{
	  			sql.append(" and b.name like ?");
	  			paramList.add("%"+name+"%");
	  		}
	  		if(this.isNotNull(a101))
	  		{
	  			sql.append(" and a.a101=?");
	  			paramList.add(a101);
	  		}
	  		if(this.isNotNull(a104))
	  		{
	  			sql.append(" and a.a104=?");
	  			paramList.add(a104);
	  		}

	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
}    
