package edu.whu.services.impl;

import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import edu.whu.system.db.DBUtils;
import edu.whu.system.tools.Tools;
import edu.whu.services.support.JdbcServicesSupport;

public class AdminServicesImpl extends JdbcServicesSupport
{
	public boolean deleteById()throws Exception
	{
		DBUtils.beginTransaction();
		boolean tag=false;
		Object uid=this.getFromDto("uid");
		try
		{
			//如果某用户是秘书同时兼任其他角色，删除该用户的秘书角色及附带的所有信息
			String sql1="delete from a03 where uid="+uid;
			String sql2="delete from u_r_relation where rid='3' and uid="+uid;
			String sql3="update a01 set uid3='0' where uid3="+uid;
			this.executeUpdate(sql1);
			this.executeUpdate(sql2);
			this.executeUpdate(sql3);
			//查询该用户是否有其他角色
			String sql4="select rid from u_r_relation where uid="+uid;
			List<Map<String,String>> list=this.queryForList(sql4);
			if(list.size()==0)
			{
				//没有其他角色，在专家表里删除此用户，用户表里删除此用户
				String sql5="delete from a06 where uid="+uid;
				String sql6="delete from user where uid="+uid;
				this.executeUpdate(sql5);
				this.executeUpdate(sql6);
			}
			DBUtils.commit();
			tag=true;
		}
		catch (Exception e) 
		{
			DBUtils.rollback();
			e.printStackTrace();
		}
		finally
		{
			DBUtils.endTransaction();
		}
		return tag;
	}

	
	public boolean modifySecretary()throws Exception
	{
		DBUtils.beginTransaction();
		boolean tag=false;
		try
		{
			StringBuilder sql=new StringBuilder()    			
					.append("update a06 a,user u")
	    			.append("   set u.name=?,a.a601=?,a.a603=?,a.a604=?,a.a605=?,")
	    			.append("       a.a608=?,a.a609=?")
	    			.append(" where u.uid=?")
	    			.append("   and a.uid=?")
	    			;
	    	Object args[]={
	    			this.getFromDto("name"),
	    			this.getFromDto("a601"),
	    			this.getFromDto("a603"),
	    			this.getFromDto("a604"),
	    			this.getFromDto("a605"),
	    			this.getFromDto("a608"),
	    			this.getFromDto("a609"),
	    			this.getFromDto("uid"),
	    			this.getFromDto("uid")
	    	};
	    	this.executeUpdate(sql.toString(), args);
	    	if(isAdded()==true)
	    	{
	    		DBUtils.rollback();
	    	}
	    	else
	    	{
	    		DBUtils.commit();
	    		tag=true;
	    	}
		}
		catch(Exception e)
		{
			DBUtils.rollback();
			e.printStackTrace();
		}
		finally
		{
			DBUtils.endTransaction();
		}
    	return tag;
	}
	
	/*
	 * 管理员手动添加秘书
	 */
	public boolean secAdd()throws Exception
	{
		DBUtils.beginTransaction();
		boolean tag=false;
		try
		{
			//获取当前员工用户名//2表示为教职工
			String uname=Tools.getFormatNumber("2","Sta");
	    	//向DTO添加员工用户名R
			this.putIntoDto("uname", uname);
//			System.out.println(uname);
//			System.out.println(this.getFromDto("name"));
	    	//1.编写SQL语句
			StringBuilder sql=new StringBuilder()
	    			.append("insert into user(uname,upassword,name,ustate)")
	    			.append("          values(?,?,?,'1')");
	    			;
	    	//2.编写参数数组
			Object args[]={
					uname,
	    			uname,
	    			this.getFromDto("name")
			};
			this.executeUpdate(sql.toString(), args);
		
			//用uname从user表获取uid
			String sql2="select uid from user where uname=?";
			Map<String, String> map=new HashMap<>();
			map=this.queryForMap(sql2.toString(), uname);
			
			//向专家表(a06)添加数据
			//1.编写SQL语句
			StringBuilder sql3=new StringBuilder()
	    			.append("insert into a06(uid,uid2,a601,a602,a603,a604,a605,a606,a607,a608,a609)")
	    			.append("         values(?,null,?,'1',?,")
	    			.append("                ?,?,null,null,?,")
	    			.append("                ?);")
	    			;
	    	//2.编写参数数组
			Object args3[]={map.get("uid"),
					this.getFromDto("a601"),//姓名
					//1,//a602默认为校内专家(专家类别)
	    			this.getFromDto("a603"),//研究领域
	    			this.getFromDto("a604"),//职称
	    			this.getFromDto("a605"),//身份证号码
	    			this.getFromDto("a608"),//手机号码
	    			this.getFromDto("a609"),//邮箱
			};
			this.executeUpdate(sql3.toString(), args3);
			
			//向秘书表(a03)添加数据
			String sql4="insert into a03(uid) values(?);";
			Object[] args4={map.get("uid")};
			this.executeUpdate(sql4, args4);
			
			//向用户-角色表(u_r_relation)添加数据
			String sql5="insert into u_r_relation (uid,rid,u_r_state) values(?,?,'1');";
			Object args5[]={map.get("uid"),"3"};//3表示角色为秘书
			this.executeUpdate(sql5, args5);
			
			//身份证查重
			if(this.isAdded()==true)
			{
				DBUtils.rollback();
			}
			else
			{
				DBUtils.commit();
				tag=true;
				
			}
		}
		catch (Exception e) 
		{
			DBUtils.rollback();
			e.printStackTrace();
		}
		finally
		{
			DBUtils.endTransaction();
		}
		return tag;
	}
	
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select u.uid,u.name,a.a601,a.a603,s.fvalue xa604,a.a605,a.a608,a.a609")
				.append("  from user u,a06 a,syscode s,u_r_relation r")
				.append(" where s.fcode=a.a604 and u.uid=a.uid")
				.append("   and s.fname='a604' and u.uid=r.uid and r.rid='3' ");
		return this.queryForList(sql.toString());
	}
	
	public boolean batchDelete()throws Exception
	{
		//定义SQL语句
		//学生表内此秘书id置0
		String sql1="update a01 set uid3='0' where uid=?;";
		//删除该用户的秘书表信息
		String sql2="delete from a03 where uid=?";
		//删除该用户的秘书角色用户表信息
		String sql3="delete from u_r_relation where rid='3' and uid=?;";
		Object idList[]=this.getIdList("idList");
    	//执行
		this.batchUpdate(sql1, idList);
		this.batchUpdate(sql2, idList);
		this.batchUpdate(sql3, idList);
		for(Object id:idList)
		{
			//查询是否有其他角色
			String sql4="select rid from u_r_relation where uid="+id;
			List<Map<String,String>> list=this.queryForList(sql4);
			if(list.size()==0)
			{
				//没有其他角色，在专家表里删除此用户，用户表里删除此用户
				String sql5="delete from a06 where uid="+id;
				String sql6="delete from user where uid="+id;
				this.executeUpdate(sql5);
				this.executeUpdate(sql6);
			}
		}
		return true;
	}
	
	public Map<String,String> queryByID()throws Exception
	{
    	//编写SQL语句
		StringBuilder sql=new StringBuilder()
    			.append("select u.name,a.a601,a.a603,a.a604,a.a605,")
    			.append("       a.a608,a.a609,u.uid")
    			.append("  from user u,a06 a")
    			.append(" where a.uid=u.uid")
    			.append("   and u.uid=?")
    			;
    	//执行查询
		return this.queryForMap(sql.toString(),this.getFromDto("uid"));
	}
	
	//导入Excel
	public boolean secAddByExcel(String path) throws Exception 
	{
		//开启事务
		DBUtils.beginTransaction();
		boolean tag=false;
		Map<String,String>map=new HashMap<>();
		List<Map<String,String>>list=readXls(path);
		try
		{
			for (int i = 0; i < list.size(); i++) 
			{
				map=list.get(i);
		    	//获取当前员工用户名//2表示为教职工
				String uname=Tools.getFormatNumber("2","Sta");
				map.put("uname", uname);
				
				//向DTO添加员工用户名
				StringBuilder sql2=new StringBuilder()
						.append(" insert into user(uname,upassword,name,ustate)")
						.append(" values(?,?,?,'1')");
				//初始密码与用户名相同，第一次登录时修改
				Object args2[]={uname,uname,map.get("name")};
				
				this.executeUpdate(sql2.toString(), args2);
				
				String sqlForId="select uid from user where uname=?";
				Map<String,String> m=this.queryForMap(sqlForId.toString(), map.get("uname"));
			    
				//向专家表(a06)添加数据
				StringBuilder sql3=new StringBuilder()
		    			.append("insert into a06(uid,a601,a602,a603,a604,a605,a608,a609)")
		    			.append("         values(?,?,?,?,")
		    			.append("                ?,?,?,")
		    			.append("                ?)")
		    			;
				Object args3[]={
						m.get("uid"),
						map.get("a601"),//姓名
						"1",//a602默认为校内专家(专家类别)
						map.get("a603"),//研究领域
						map.get("a604"),//职称
						map.get("a605"),//身份证号码
						map.get("a608"),//手机号码
						map.get("a609"),//邮箱
				};
				this.executeUpdate(sql3.toString(),args3);
				
				//向秘书表(a03)添加数据
				String sql4="insert into a03(uid) select uid from user where uname=?";
				this.executeUpdate(sql4,map.get("uname"));
				
				//向用户-角色表(u_r_relation)添加数据
				String sql5="insert into u_r_relation (uid,rid,u_r_state) values(?,?,'1')";
				Object args[]={m.get("uid"),"3"};
				//3表示角色为秘书
				this.executeUpdate(sql5,args);
				
				//身份证查重
				if(this.isAdded()==true)
				{
					DBUtils.rollback();
				}
				else
				{
					//提交事务
					DBUtils.commit();
					tag=true;
				}
			}
		}
		catch(Exception e)
		{
			//回滚事务
			DBUtils.rollback();
			e.printStackTrace();
		}
		finally
		{
			//结束事务
			DBUtils.endTransaction();
		}
		return tag;
	}
	
	protected List<Map<String,String>>readXls(String path)throws Exception 
	{
		//需要导入的Excel文件事先存放在WEB-INF文件夹下，后缀暂时只用xls
		//String path="D:/work/project/WebRoot/WEB-INF/sec_info.xls";
		InputStream is=new FileInputStream(path);
		HSSFWorkbook hssfWorkbook=new HSSFWorkbook(is);
		List<Map<String,String>> list=new ArrayList<>();
		//循环工作表Sheet
		for (int numSheet=0;numSheet<hssfWorkbook.getNumberOfSheets();numSheet++)
		{
			HSSFSheet hssfSheet=hssfWorkbook.getSheetAt(numSheet);
			if (hssfSheet==null) 
			{
				continue;
			}
			//循环行Row
			for (int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++) 
			{
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				//对每一行都把数据保存在list中
				if (hssfRow!=null)
				{
					Map<String,String> map=new HashMap<>();
					//如果需要，在这里增加列数
					HSSFCell name=hssfRow.getCell(0);
					HSSFCell a601=hssfRow.getCell(1);
					HSSFCell a603=hssfRow.getCell(2);
					HSSFCell a604=hssfRow.getCell(3);
					HSSFCell a605=hssfRow.getCell(4);
					HSSFCell a608=hssfRow.getCell(5);
					HSSFCell a609=hssfRow.getCell(6);
					//按Excel表头读取数据，严格要求表头和数据库的数据项一一对应
					map.put("name", getValue(name));
					map.put("a601", getValue(a601));
					map.put("a603", getValue(a603));
					map.put("a604", toChar(getValue(a604)));
					map.put("a605", getValue(a605));
					map.put("a608", getValue(a608));
					map.put("a609", getValue(a609));
					list.add(map);
			 	}
			}
		}
		return list;
	}
	
	//按syscode转化职务
	private String toChar(String s)
	{
		if(s.equals("教授"))
		{
			return "1";
		}
		else if(s.equals("副教授"))
		{
			return "2";
		}
		else
		{
			return "3";
		}
	}

	@SuppressWarnings("static-access")
	private String getValue(HSSFCell hssfCell)
	{
		if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) 
	    {
	        // 返回数值类型的值
			//hssfCell.getNumericCellValue()返回double类型，数目过大会变成科学进制
	        return toVarchar(hssfCell.getNumericCellValue());
	    }
		else
	    {
	        // 返回字符串类型的值
	        return String.valueOf(hssfCell.getStringCellValue());
	    }
	}	
	
	//把Double转换为String，并且避免科学进制
	private String toVarchar(double d)
	{
		BigDecimal bigDecimal = new BigDecimal(d);
		return bigDecimal.toString();
	}
	
	//插入查重
	private boolean isAdded()throws Exception
	{
		PreparedStatement pstm1=null;
		PreparedStatement pstm2=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
		try
		{
			//用身份证号码查重
			String sql1="select count(a605) as a from a06;";
			String sql2="select count(distinct a605) as a from a06;";
			
			pstm1=DBUtils.prepareStatement(sql1);
			pstm2=DBUtils.prepareStatement(sql2.toString());
			rs1=pstm1.executeQuery();
			rs2=pstm2.executeQuery();
			rs1.next();
			rs2.next();
			//通过distinct删除重复数据，判断两条语句count的值是否相同，相同则说明没有重复数据
			if(rs1.getObject(1).equals(rs2.getObject(1)))
			{
				//没出现重复
				return false;
			}
			else
			{
				return true;
			}
		}
		finally
		{
			DBUtils.close(rs2);
			DBUtils.close(rs1);
			DBUtils.close(pstm2);
			DBUtils.close(pstm1);
		}
		
	}
}
