package edu.whu.services.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.whu.services.support.JdbcServicesSupport;

public class MessageServicesImpl extends JdbcServicesSupport 
{
	public Map<String,List<String>> getMessage(String uid) throws Exception
	{
		Map<String,List<String>> map=new HashMap<String,List<String>>();
		String sql="select b501,b502,CONCAT('<a href=\"message.jsp?index=',b501,'\">',b502,'</a>') atext, b503 from b05 where uid="+uid;
		List<Map<String,String>> list=this.queryForList(sql);
		for(Map<String,String> m:list)
		{
			List<String> temp=new ArrayList<String>();
			//标签
			temp.add(m.get("atext"));
			//标题
			temp.add(m.get("b502"));
			//内容
			temp.add(m.get("b503"));
			//id
			map.put(m.get("b501"), temp);
		}
		return map;
	}
	
	public boolean sendMessage(String[] content) throws Exception
	{
		String sql="insert into b05 (uid,b502,b503) values (?,?,?);";
		return this.batchUpdate(sql, content);
	}
}
