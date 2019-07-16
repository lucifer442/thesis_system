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
	 * title:标题
	 * text:内容
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
				//1.定义JDBC接口变量
				PreparedStatement pstm=null;
				try
				{
					//3.编译SQL
					pstm=DBUtils.prepareStatement(sql);
					//4.参数赋值
					int index=1;
					for(Object param:args)
					{
						pstm.setObject(index++, param);
					}
					//5.执行SQL语句
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
    	//1.定义JDBC接口
    	PreparedStatement pstm=null;
    	ResultSet rs=null;
    	try
    	{
    		//编译SQL
    		pstm=DBUtils.prepareStatement(sql.toString());
    		
    		//参数赋值
    		if(args!=null)
    		{
    			int index=1;
        		for(Object param:args)
        		{
        			pstm.setObject(index++, param);
        		}	
    		}
    		
    		//执行SQL
    		rs=pstm.executeQuery();
    		//获取结果集描述对象
    		ResultSetMetaData rsmd=rs.getMetaData();
    		//查询的列数
    		int count=rsmd.getColumnCount();
    		//计算安全的初始容量
    		int initSize=((int)(count/0.75))+1;
    		
    		//定义List容器,装载整个查询结果
    		List<Map<String,String>> rows=new ArrayList<>();
    		//定义装载当前行数据的Map容器变量
    		Map<String,String> ins=null;
    		
    		//循环结果集
    		while(rs.next())
    		{
    			//实例化当前行数据的承载容器
    			ins=new HashMap<>(initSize);
    			//循环当前行的所有列
    			for(int i=1;i<=count;i++)
    			{
    				//完成列级映射
    				ins.put(rsmd.getColumnLabel(i).toLowerCase(),rs.getString(i));
    			}
    			//向list中放入当前行数据
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
