package edu.whu.system.tools;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.whu.services.support.JdbcServicesSupport;
import edu.whu.system.db.DBUtils;

public class News extends JdbcServicesSupport
{
	/*
	 * title:����
	 * text:����
	 * 
	 */
	public static void setNews(String title,String text,Object...idlist) throws Exception
	{
		List<Map<String,String>> lists = null;
		System.out.println(idlist.toString());
		if(idlist.toString()=="alluser")
		{
			String sql = "select uid from user where user.ustate=1";
			lists= createList(sql);
		}
		else if(idlist.toString()=="allstu")
		{
			String sql = "select uid from a01 ";
			lists= createList(sql);
		}
		else if(idlist.toString()=="alltea")
		{
			String sql = "select uid from a02 where user.ustate=1";
			lists= createList(sql);
		}
		else if(idlist.toString()=="allemp")
		{
			String sql = "select uid from a03 where user.ustate=1";
			lists= createList(sql);
		}
		else if(idlist.toString()=="allsec")
		{
			String sql = "select uid from a06 where user.ustate=1";
			lists= createList(sql);
		}
		else 
		{
			List<Map<String,String>> dtos = new ArrayList<>();
			for(Object id:idlist)
			{
				Map<String,String> dto = new HashMap<>();
				dto.put("uid", id.toString());
				dtos.add(dto);
			}
			lists = dtos;
		}
			for(Map<String, String> idmap:lists) 
			{
				String sql = "insert into b05(uid, b502,b503) values(?,?,?)";
				Object args[]= {
					idmap.get("uid"),
					title,
					text
				};
				//1.����JDBC�ӿڱ���
				PreparedStatement pstm=null;
				try
				{
					//3.����SQL
					pstm=DBUtils.prepareStatement(sql);
					//4.������ֵ
					int index=1;
					for(Object param:args)
					{
						pstm.setObject(index++, param);
					}
					//5.ִ��SQL���
					pstm.executeUpdate();
				}
				finally
				{
					DBUtils.close(pstm);
				}	
			}
	}
	
	protected final static  List<Map<String,String>> createList(final String sql,final Object...args)throws Exception
    {
    	//1.����JDBC�ӿ�
    	PreparedStatement pstm=null;
    	ResultSet rs=null;
    	try
    	{
    		//����SQL
    		pstm=DBUtils.prepareStatement(sql.toString());
    		
    		//������ֵ
    		if(args!=null)
    		{
    			int index=1;
        		for(Object param:args)
        		{
        			pstm.setObject(index++, param);
        		}	
    		}
    		
    		//ִ��SQL
    		rs=pstm.executeQuery();
    		//��ȡ�������������
    		ResultSetMetaData rsmd=rs.getMetaData();
    		//��ѯ������
    		int count=rsmd.getColumnCount();
    		//���㰲ȫ�ĳ�ʼ����
    		int initSize=((int)(count/0.75))+1;
    		
    		//����List����,װ��������ѯ���
    		List<Map<String,String>> rows=new ArrayList<>();
    		//����װ�ص�ǰ�����ݵ�Map��������
    		Map<String,String> ins=null;
    		
    		//ѭ�������
    		while(rs.next())
    		{
    			//ʵ������ǰ�����ݵĳ�������
    			ins=new HashMap<>(initSize);
    			//ѭ����ǰ�е�������
    			for(int i=1;i<=count;i++)
    			{
    				//����м�ӳ��
    				ins.put(rsmd.getColumnLabel(i).toLowerCase(),rs.getString(i));
    			}
    			//��list�з��뵱ǰ������
    			rows.add(ins);
    		}
    		return rows;
    	}
    	finally
    	{
    		DBUtils.close(rs);
    		DBUtils.close(pstm);
    	}
    	
    }
}
