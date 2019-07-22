package edu.whu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.whu.services.support.JdbcServicesSupport;
import edu.whu.system.db.DBUtils;
import edu.whu.system.tools.Tools;

public class QueryJudgeServicesImpl extends JdbcServicesSupport 
{
	  public List<Map<String,String>> query()throws Exception
	  {
	  		//��ԭҳ���ѯ����
	  		Object name=this.getFromDto("qename");    
    
	  		
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
					.append("select user.name,b01.b102 ")
					.append("from user,b01,b02 ")
					.append("where user.uid=b02.uid ")
					.append("and b01.b101=b02.b101 ")
	  				;
	  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(name))
	  		{
	  			sql.append(" and user.name like ?");
	  			paramList.add("%"+name+"%");
	  		}

	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
}    
