package edu.whu.services.impl;

import java.util.Map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import edu.whu.services.support.JdbcServicesSupport;

public class B01ImplServices extends JdbcServicesSupport
{
	/**
	 * �����ѯ����
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> query() throws Exception
	{	
		StringBuilder sql=new StringBuilder()
				.append("select x.b101,x.uid1,x.uid2,x.b102,x.b103,")
				.append("       x.b104,x.b105,x.b106,")
				.append("       a.fvalue b107,b.fvalue b108,c.fvalue b109")
				.append("  from syscode a,syscode b,syscode c,b01 x")
				.append(" where x.b107=a.fcode and a.fname='b107'")
				.append("   and x.b108=b.fcode and b.fname='b108'")
				.append("   and x.b109=c.fcode and c.fname='b109'")
				;

		return this.queryForList(sql.toString());
	}
	
	/**
	 * ��ʦ�����Ĳ�ѯ
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> tequery() throws Exception
	{
		Object uid2=this.getFromDto("cuid");
		
		StringBuilder sql=new StringBuilder()
				.append("select x.b101,x.uid1,x.uid2,x.b102,x.b103,")
				.append("       x.b104,x.b105,x.b106,")
				.append("       a.fvalue b107,b.fvalue b108,c.fvalue b109")
				.append("  from syscode a,syscode b,syscode c,b01 x")
				.append(" where x.b107=a.fcode and a.fname='b107'")
				.append("   and x.b108=b.fcode and b.fname='b108'")
				.append("   and x.b109=c.fcode and c.fname='b109'")
				;
		
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
		
		if (this.isNotNull(uid2))
		{
			sql.append("   and x.uid2=?");
			paramList.add(uid2);
		}

		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * ѧ�������Ĳ�ѯ
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> stuquery() throws Exception
	{
		Object uid1=this.getFromDto("cuid");

		StringBuilder sql=new StringBuilder()
				.append("select x.b101,x.uid1,x.uid2,x.b102,x.b103,")
				.append("       x.b104,x.b105,x.b106,")
				.append("       a.fvalue b107,b.fvalue b108,c.fvalue b109")
				.append("  from syscode a,syscode b,syscode c,b01 x")
				.append(" where x.b107=a.fcode and a.fname='b107'")
				.append("   and x.b108=b.fcode and b.fname='b108'")
				.append("   and x.b109=c.fcode and c.fname='b109'")
				;
		
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
		
		if (this.isNotNull(uid1)) 
		{
			sql.append("   and x.uid1=?");
			paramList.add(uid1);
		}

		Map<String,String> map = new HashMap<>();
		Map<String,String> dataMap = this.queryForMap(sql.toString(), paramList.toArray());
		if(dataMap!=null) 
		{
			map.putAll(dataMap);
		}
		map.put("uid",uid1.toString());
		return map;
	}
	
	/**
	 * ��ʦɸѡ
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> teQuery() throws Exception
	{
		Object uid2=this.getFromDto("cuid");
		Object b102=this.getFromDto("b102");
		Object b107=this.getFromDto("b107");
		Object b108=this.getFromDto("b108");
		Object b109=this.getFromDto("b109");
		
		StringBuilder sql=new StringBuilder()
				.append("select x.b101,x.uid1,x.uid2,x.b102,x.b103,")
				.append("       x.b104,x.b105,x.b106,")
				.append("       a.fvalue b107,b.fvalue b108,c.fvalue b109")
				.append("  from syscode a,syscode b,syscode c,b01 x")
				.append(" where x.b107=a.fcode and a.fname='b107'")
				.append("   and x.b108=b.fcode and b.fname='b108'")
				.append("   and x.b109=c.fcode and c.fname='b109'")
				.append("   and x.uid2=?")
				;
		
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		
  		paramList.add(uid2);
  		if(isNotNull(b102))
  		{
  			sql.append("   and x.b102 like ?");
  			paramList.add("%"+b102+"%");
  		}
  		if(isNotNull(b107))
  		{
  			sql.append("   and x.b107=?");
  			paramList.add(b107);
  		}
  		if(isNotNull(b108))
  		{
  			sql.append("   and x.b108=?");
  			paramList.add(b108);
  		}
  		if(isNotNull(b109))
  		{
  			sql.append("   and x.b109=?");
  			paramList.add(b109);
  		}
  		
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * ����ɸѡ
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> secQuery() throws Exception
	{
		Object b102=this.getFromDto("b102");
		Object b107=this.getFromDto("b107");
		Object b108=this.getFromDto("b108");
		Object b109=this.getFromDto("b109");
		
		StringBuilder sql=new StringBuilder()
				.append("select x.b101,x.uid1,x.uid2,x.b102,x.b103,")
				.append("       x.b104,x.b105,x.b106,")
				.append("       a.fvalue b107,b.fvalue b108,c.fvalue b109")
				.append("  from syscode a,syscode b,syscode c,b01 x")
				.append(" where x.b107=a.fcode and a.fname='b107'")
				.append("   and x.b108=b.fcode and b.fname='b108'")
				.append("   and x.b109=c.fcode and c.fname='b109'")
				;
		
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		
  		if(isNotNull(b102))
  		{
  			sql.append("   and x.b102 like ?");
  			paramList.add("%"+b102+"%");
  		}
  		if(isNotNull(b107))
  		{
  			sql.append("   and x.b107=?");
  			paramList.add(b107);
  		}
  		if(isNotNull(b108))
  		{
  			sql.append("   and x.b108=?");
  			paramList.add(b108);
  		}
  		if(isNotNull(b109))
  		{
  			sql.append("   and x.b109=?");
  			paramList.add(b109);
  		}
  		
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * ��һʵ����ѯ
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> queryByID() throws Exception
	{
    	StringBuilder sql=new StringBuilder()
				.append("select x.b101,x.uid1,x.uid2,x.b102,x.b103,")
				.append("       x.b104,x.b105,x.b106,")
				.append("       a.fvalue b107,b.fvalue b108,c.fvalue b109")
				.append("  from syscode a,syscode b,syscode c,b01 x")
				.append(" where x.b107=a.fcode and a.fname='b107'")
				.append("   and x.b108=b.fcode and b.fname='b108'")
				.append("   and x.b109=c.fcode and c.fname='b109'")
    			.append("   and b101=?")
    			;

    	return this.queryForMap(sql.toString(), this.getFromDto("b101"));
	}
	
	public Map<String, String> queryByUID(Object object) throws Exception
	{
    	StringBuilder sql=new StringBuilder()
				.append("select x.b101,x.uid1,x.uid2,x.b102,x.b103,")
				.append("       x.b104,x.b105,x.b106,")
				.append("       a.fvalue b107,b.fvalue b108,c.fvalue b109")
				.append("  from syscode a,syscode b,syscode c,b01 x")
				.append(" where x.b107=a.fcode and a.fname='b107'")
				.append("   and x.b108=b.fcode and b.fname='b108'")
				.append("   and x.b109=c.fcode and c.fname='b109'")
    			.append("   and uid1=?")
    			;

    	return this.queryForMap(sql.toString(), object);
	}
	
	/**
	 * ר������������ѯ
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> queryByID(Object object) throws Exception
	{
    	StringBuilder sql=new StringBuilder()
				.append("select x.b101,x.uid1,x.uid2,x.b102,x.b103,")
				.append("       x.b104,x.b105,x.b106,")
				.append("       a.fvalue b107,b.fvalue b108,c.fvalue b109")
				.append("  from syscode a,syscode b,syscode c,b01 x")
				.append(" where x.b107=a.fcode and a.fname='b107'")
				.append("   and x.b108=b.fcode and b.fname='b108'")
				.append("   and x.b109=c.fcode and c.fname='b109'")
    			.append("   and b101=?")
    			;

    	return this.queryForMap(sql.toString(), object);
	}
	
	/**
	 * ɾ������ʱ���ã�ȡ���ļ���
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> queryByID(Map<String, Object> dto) throws Exception
	{
    	StringBuilder sql=new StringBuilder()
				.append("select b106")
				.append("  from b01")
    			.append(" where b101=?")
    			;

    	return this.queryForMap(sql.toString(), dto.get("b101"));
	}

	/**
	 * �µ������ύ
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> add(Map<String, Object> dto) throws Exception
	{
		
		//��ѯ��ʦ��uid2
		A01ImplServices a01ImplServices=new A01ImplServices();
		dto.putAll(a01ImplServices.queryUID2ByUID(dto.get("uid")));
		
		StringBuilder sql=new StringBuilder()
				.append("insert into b01(uid1,uid2,b102,b103,b104,")
				.append("                b105,b106,b107,b108,b109)")
				.append("         values(?,?,?,?,?,")
				.append("                ?,?,?,?,?)")
				;
    	Object args[]={
    			dto.get("uid"),
    			dto.get("uid2"),
    			dto.get("b102"),
    			dto.get("b103"),
    			dto.get("b104"),
    			dto.get("b105"),
    			dto.get("b106"),
    			0,
    			0,
    			0
    	};
		this.executeUpdate(sql.toString(), args);	
		
		return queryByUID(dto.get("uid"));
	}
	
	/**
	 * �����ύ����
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> modify(Map<String, Object> dto) throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("update b01")
				.append("   set b102=?,b103=?,b104=?,b105=?,b106=?")
				.append(" where b101=?")
				;
		Object args[]= {
				dto.get("b102"),
				dto.get("b103"),
				dto.get("b104"),
				dto.get("b105"),
				dto.get("b106"),
				dto.get("b101")
		};
		this.executeUpdate(sql.toString(), args);	
		
		return queryByID();
	}
	
	/**
	 * ����ר�Ҷ����ĵ������޸�
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> examModify() throws Exception
	{
		Object b108=this.getFromDto("b108");
		
		List<Object> paramList=new ArrayList<>();
		
		StringBuilder sql=new StringBuilder()
				.append("update b01")
				;
		
		if(this.isNotNull(b108))
		{
			sql.append("   set b108=?");
			paramList.add(b108);
		}
		
		sql.append(" where b101=?");
		paramList.add(this.getFromDto("b101"));
		
		this.executeUpdate(sql.toString(), paramList.toArray());
		
		B02ImplServices b02ImplServices = new B02ImplServices();
		return b02ImplServices.query(this.getFromDto("b101"));
	}
	
	/**
	 * ��ʦ�����ĵļ���޸�
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> teaModify() throws Exception
	{	
		StringBuilder sql=new StringBuilder()
				.append("update b01")
				.append("   set b107=?")
		        .append(" where b101=?")
				;
		
		Object[] objects = {
				this.getFromDto("b107"),
				this.getFromDto("b101")
		};
		this.executeUpdate(sql.toString(), objects);
		
		return this.queryByID();
	}
	
	/**
	 * ����ר�Ҳ�ѯ����
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> examQuery() throws Exception
	{
		List<Map<String,String>> resultList=new ArrayList<Map<String,String>>();
		StringBuilder sql=new StringBuilder()
				.append("select x.b101,x.uid1,x.uid2,x.b102,x.b103,")
				.append("       x.b104,x.b105,x.b106,")
				.append("       a.fvalue b107,b.fvalue b108")
				.append("  from syscode a,syscode b,b01 x")
				.append(" where x.b107=a.fcode and a.fname='b107'")
				.append("   and x.b108=b.fcode and b.fname='b108'")
				.append("   and x.b101=?")
				;
		
		Object b108=this.getFromDto("b108");
		Object[] objects = {this.getFromDto("cuid")};
		//������Ϣ���¸�ר�����е�����id
		B02ImplServices b02ImplServices=new B02ImplServices();
		List<Map<String,String>> b101List = b02ImplServices.query(objects);
		
		List<Object> paramList=new ArrayList<>();
		for (Map<String, String> maplist : b101List) 
		{
			for (String map : maplist.keySet()) 
			{
				paramList.add(maplist.get(map));

				if(this.isNotNull(b108))
				{
					sql.append("   and x.b108=?");
					paramList.add(b108);
					Map<String,String> result=this.queryForMap(sql.toString(), paramList.toArray());
					if(result!=null)
					{
						resultList.add(result);
					}
					sql.replace((sql.lastIndexOf("and")-3),sql.lastIndexOf("?")+1,"");
				}
				else 
				{
					Map<String,String> result=this.queryForMap(sql.toString(), paramList.toArray());
					if(result!=null)
					{
						resultList.add(result);
					}
				}
				paramList.clear();
			}
		}
		
		return resultList;
	}
	
	/**
	 * ���ר�Ҳ�ѯ����
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> previewQuery() throws Exception
	{
		List<Map<String,String>> resultList=new ArrayList<Map<String,String>>();
		StringBuilder sql=new StringBuilder()
				.append("select x.b101,x.uid1,x.uid2,x.b102,x.b103,")
				.append("       x.b104,x.b105,x.b106,")
				.append("       a.fvalue b107,c.fvalue b109")
				.append("  from syscode a,syscode c,b01 x")
				.append(" where x.b107=a.fcode and a.fname='b107'")
				.append("   and x.b109=c.fcode and c.fname='b109'")
				.append("   and x.b101=?")
				;
		
		Object b109=this.getFromDto("b109");
		
		B03ImplServices b03ImplServices=new B03ImplServices();
		List<Map<String,String>> b101List = b03ImplServices.query(this.getFromDto("cuid"));

		List<Object> paramList=new ArrayList<>();
		for (Map<String, String> maplist : b101List) 
		{
			for (String map : maplist.keySet()) 
			{
				paramList.add(maplist.get(map));
				
				if(this.isNotNull(b109))
				{
					sql.append("   and x.b109=?");
					paramList.add(b109);
					Map<String,String> result=this.queryForMap(sql.toString(), paramList.toArray());
					if(result!=null)
					{
						resultList.add(result);
					}
					sql.replace((sql.lastIndexOf("and")-3),sql.lastIndexOf("?")+1,"");
				}
				else 
				{
					Map<String,String> result=this.queryForMap(sql.toString(), paramList.toArray());
					if(result!=null)
					{
						resultList.add(result);
					}
				}
				paramList.clear();
			}
		}
			
		return resultList;
	}
	
	public List<Map<String,String>> statib107() throws Exception
	{
		StringBuilder b107=new StringBuilder()
//				.append("  select a.fvalue b107,count(x.b107) count")
				.append("  select any_value(a.fvalue) b107,count(x.b107) count")
				.append("    from syscode a,b01 x")
				.append("   where x.b107=a.fcode and a.fname='b107'")
				.append("group by b107")
				;
		
		return this.queryForList(b107.toString());
	}
	
	public List<Map<String,String>> statib108() throws Exception
	{
		StringBuilder b108=new StringBuilder()
//				.append("  select a.fvalue b108,count(x.b108) count")
				.append("  select any_value(a.fvalue) b108,count(x.b108) count")
				.append("    from syscode a,b01 x")
				.append("   where x.b108=a.fcode and a.fname='b108'")
				.append("group by b108")
				;
		return this.queryForList(b108.toString());
	}
	
	public List<Map<String,String>> statib109() throws Exception
	{
		StringBuilder b109=new StringBuilder()
//				.append("  select a.fvalue b109,count(x.b109) count")
				.append("  select any_value(a.fvalue) b109,count(x.b109) count")
				.append("    from syscode a,b01 x")
				.append("   where x.b109=a.fcode and a.fname='b109'")
				.append("group by b109")
				;
		return this.queryForList(b109.toString());
	}
}