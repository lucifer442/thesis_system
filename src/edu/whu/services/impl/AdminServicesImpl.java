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
	private boolean deleteById()throws Exception
	{
		DBUtils.beginTransaction();
		boolean tag=false;
		try
		{
			//���ĳ�û�������ͬʱ����������ɫ��ɾ�����û��������ɫ��������������Ϣ
			String sql1="delete from a03 where uid=?;";
//			String sql2="delete from a06 where uid=?;";
			String sql3="delete from u_r_relation where rid='3' and uid=?;";
			//���ǵ�������Ҫ�������û���������ɫ������user�����޸�
			//String sql4="delete from user where uid=?;";
//			System.out.println(getFromDto("uid"));
			this.executeUpdate(sql1, this.getFromDto("uid"));
//			this.executeUpdate(sql2, this.getFromDto("uid"));
			this.executeUpdate(sql3, this.getFromDto("uid"));
			//this.executeUpdate(sql4, this.getFromDto("uid"));
			String sql5="update a01 set uid3='0' where uid3=?";
			this.executeUpdate(sql5, this.getFromDto("uid"));
			this.modifyOtherInfo(this.getFromDto("uid"));
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

	
	private boolean modifySecretary()throws Exception
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
	 * ����Ա�ֶ��������
	 */
	private boolean secAdd()throws Exception
	{
		DBUtils.beginTransaction();
		boolean tag=false;
		try
		{
			//��ȡ��ǰԱ���û���//2��ʾΪ��ְ��
			String uname=Tools.getFormatNumber("2","2");
	    	//��DTO���Ա���û���R
			this.putIntoDto("uname", uname);
//			System.out.println(uname);
//			System.out.println(this.getFromDto("name"));
	    	//1.��дSQL���
			StringBuilder sql=new StringBuilder()
	    			.append("insert into user(uname,upassword,name,ustate)")
	    			.append("          values(?,?,?,'1')");
	    			;
	    	//2.��д��������
			Object args[]={
					uname,
	    			uname,
	    			this.getFromDto("name")
			};
			this.executeUpdate(sql.toString(), args);
		
			//��uname��user���ȡuid
			String sql2="select uid from user where uname=?";
			Map<String, String> map=new HashMap<>();
			map=this.queryForMap(sql2.toString(), uname);
			
			//��ר�ұ�(a06)�������
			//1.��дSQL���
			StringBuilder sql3=new StringBuilder()
	    			.append("insert into a06(uid,uid2,a601,a602,a603,a604,a605,a606,a607,a608,a609)")
	    			.append("         values(?,null,?,'1',?,")
	    			.append("                ?,?,null,null,?,")
	    			.append("                ?);")
	    			;
	    	//2.��д��������
			Object args3[]={map.get("uid"),
					this.getFromDto("a601"),//����
					//1,//a602Ĭ��ΪУ��ר��(ר�����)
	    			this.getFromDto("a603"),//�о�����
	    			this.getFromDto("a604"),//ְ��
	    			this.getFromDto("a605"),//���֤����
	    			this.getFromDto("a608"),//�ֻ�����
	    			this.getFromDto("a609"),//����
			};
			this.executeUpdate(sql3.toString(), args3);
			
			//�������(a03)�������
			String sql4="insert into a03(uid) values(?);";
			Object[] args4={map.get("uid")};
			this.executeUpdate(sql4, args4);
			
			//���û�-��ɫ��(u_r_relation)�������
			String sql5="insert into u_r_relation (uid,rid,u_r_state) values(?,?,'1');";
			Object args5[]={map.get("uid"),"3"};//3��ʾ��ɫΪ����
			this.executeUpdate(sql5, args5);
			
			//���֤����
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
				.append("   and s.fname='a604' and u.uid=r.uid and r.rid='3';");
		return this.queryForList(sql.toString());
	}
	
	private boolean batchDelete()throws Exception
	{
    	//����SQL���
		String sql1="delete from a03 where uid=?";
		String sql2="delete from a06 where uid=?;";
		String sql3="delete from u_r_relation where uid=?;";
//		String sql4="delete from user where uid=?;";
		Object idList[]=this.getIdList("idList");
    	//ִ��
		this.batchUpdate(sql1, idList);
		this.batchUpdate(sql2, idList);
		this.batchUpdate(sql3, idList);
//		this.batchUpdate(sql4, idList);
		for(Object id:idList)
		{
			modifyOtherInfo(id);
		}
		return true;
	}
	
	public Map<String,String> queryByID()throws Exception
	{
    	//��дSQL���
		StringBuilder sql=new StringBuilder()
    			.append("select u.name,a.a601,a.a603,a.a604,a.a605,")
    			.append("       a.a608,a.a609")
    			.append("  from user u,a06 a")
    			.append(" where a.uid=u.uid")
    			.append("   and u.uid=?")
    			;
    	//ִ�в�ѯ
		return this.queryForMap(sql.toString(),this.getFromDto("uid"));
	}
	
	//����Excel
	public boolean secAddByExcel() throws Exception 
	{
		//��������
		DBUtils.beginTransaction();
		boolean tag=false;
		Map<String,String>map=new HashMap<>();
		List<Map<String,String>>list=readXls();
		try
		{
			for (int i = 0; i < list.size(); i++) 
			{
				map=list.get(i);
		    	//��ȡ��ǰԱ���û���//2��ʾΪ��ְ��
				String uname=Tools.getFormatNumber("2","2");
				map.put("uname", uname);
				
				//��DTO���Ա���û���
				StringBuilder sql2=new StringBuilder()
						.append(" insert into user(uname,upassword,name,ustate)")
						.append(" values(?,?,?,'1')");
				//��ʼ�������û�����ͬ����һ�ε�¼ʱ�޸�
				Object args2[]={uname,uname,map.get("name")};
				
				this.executeUpdate(sql2.toString(), args2);
				
				String sqlForId="select uid from user where uname=?";
				Map<String,String> m=this.queryForMap(sqlForId.toString(), map.get("uname"));
			    
				//��ר�ұ�(a06)�������
				StringBuilder sql3=new StringBuilder()
		    			.append("insert into a06(uid,a601,a602,a603,a604,a605,a608,a609)")
		    			.append("         values(?,?,?,?,")
		    			.append("                ?,?,?,")
		    			.append("                ?)")
		    			;
				Object args3[]={
						m.get("uid"),
						map.get("a601"),//����
						"1",//a602Ĭ��ΪУ��ר��(ר�����)
						map.get("a603"),//�о�����
						map.get("a604"),//ְ��
						map.get("a605"),//���֤����
						map.get("a608"),//�ֻ�����
						map.get("a609"),//����
				};
				this.executeUpdate(sql3.toString(),args3);
				
				//�������(a03)�������
				String sql4="insert into a03(uid) select uid from user where uname=?";
				this.executeUpdate(sql4,map.get("uname"));
				
				//���û�-��ɫ��(u_r_relation)�������
				String sql5="insert into u_r_relation (uid,rid,u_r_state) values(?,?,'1')";
				Object args[]={m.get("uid"),"3"};
				//3��ʾ��ɫΪ����
				this.executeUpdate(sql5,args);
				
				//���֤����
				if(this.isAdded()==true)
				{
					DBUtils.rollback();
				}
				else
				{
					//�ύ����
					DBUtils.commit();
					tag=true;
				}
			}
		}
		catch(Exception e)
		{
			//�ع�����
			DBUtils.rollback();
			e.printStackTrace();
		}
		finally
		{
			//��������
			DBUtils.endTransaction();
		}
		return tag;
	}
	
	//����ɾ������ʱ������������޸�
	private boolean modifyOtherInfo(Object uid)throws Exception
	{
		//��ѯ���û��Ƿ���������ɫ
		String sql1="select rid from u_r_relation where uid="+uid;
		List<Map<String,String>> list=this.queryForList(sql1);
		System.out.println(list);
		if(list.size()==0)
		{
			//û��������ɫ����ר�ұ���û���ɾ�����û�
			String sql2="delete from a06 where uid="+uid;
			String sql3="delete from user where uid="+uid;
			this.executeUpdate(sql2);
			this.executeUpdate(sql3);
		}
		else
		{
			//��������ɫ��ɾ�����û��Ĵ˽�ɫ
			String sql2="delete from u_r_relation where rid='3' and uid="+uid;
			this.executeUpdate(sql2);
		}
		return true;
	}
	
	protected List<Map<String,String>>readXls()throws Exception 
	{
		//��Ҫ�����Excel�ļ����ȴ����WEB-INF�ļ����£���׺��ʱֻ��xls
		String path="D:/work/project/WebRoot/WEB-INF/sec_info.xls";
		InputStream is=new FileInputStream(path);
		HSSFWorkbook hssfWorkbook=new HSSFWorkbook(is);
		List<Map<String,String>> list=new ArrayList<>();
		//ѭ��������Sheet
		for (int numSheet=0;numSheet<hssfWorkbook.getNumberOfSheets();numSheet++)
		{
			HSSFSheet hssfSheet=hssfWorkbook.getSheetAt(numSheet);
			if (hssfSheet==null) 
			{
				continue;
			}
			//ѭ����Row
			for (int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++) 
			{
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				//��ÿһ�ж������ݱ�����list��
				if (hssfRow!=null)
				{
					Map<String,String> map=new HashMap<>();
					//�����Ҫ����������������
					HSSFCell name=hssfRow.getCell(0);
					HSSFCell a601=hssfRow.getCell(1);
					HSSFCell a603=hssfRow.getCell(2);
					HSSFCell a604=hssfRow.getCell(3);
					HSSFCell a605=hssfRow.getCell(4);
					HSSFCell a608=hssfRow.getCell(5);
					HSSFCell a609=hssfRow.getCell(6);
					//��Excel��ͷ��ȡ���ݣ��ϸ�Ҫ���ͷ�����ݿ��������һһ��Ӧ
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
	
	//��syscodeת��
	private String toChar(String s)
	{
		if(s.equals("����"))
		{
			return "1";
		}
		else if(s.equals("������"))
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
	        // ������ֵ���͵�ֵ
			//hssfCell.getNumericCellValue()����double���ͣ���Ŀ������ɿ�ѧ����
	        return toVarchar(hssfCell.getNumericCellValue());
	    }
		else
	    {
	        // �����ַ������͵�ֵ
	        return String.valueOf(hssfCell.getStringCellValue());
	    }
	}	
	
	//��Doubleת��ΪString�����ұ����ѧ����
	private String toVarchar(double d)
	{
		BigDecimal bigDecimal = new BigDecimal(d);
		return bigDecimal.toString();
	}
	
	//�������
	private boolean isAdded()throws Exception
	{
		PreparedStatement pstm1=null;
		PreparedStatement pstm2=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
		try
		{
			//�����֤�������
			String sql1="select count(a605) as a from a06;";
			String sql2="select count(distinct a605) as a from a06;";
			
			pstm1=DBUtils.prepareStatement(sql1);
			pstm2=DBUtils.prepareStatement(sql2.toString());
			rs1=pstm1.executeQuery();
			rs2=pstm2.executeQuery();
			rs1.next();
			rs2.next();
			//ͨ��distinctɾ���ظ����ݣ��ж��������count��ֵ�Ƿ���ͬ����ͬ��˵��û���ظ�����
			if(rs1.getObject(1).equals(rs2.getObject(1)))
			{
				//û�����ظ�
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
