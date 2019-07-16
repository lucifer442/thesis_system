package edu.whu.services.impl;

import edu.whu.services.support.JdbcServicesSupport;
import edu.whu.system.db.DBUtils;
import edu.whu.system.tools.Tools;

public class DicExcelServicesImpl extends JdbcServicesSupport 
{
	 public boolean update(String utype) throws Exception 
	    {
	    	if(utype.equalsIgnoreCase("addEmp"))
	    	{
	    		return this.addEmp();
	    	}
	    	else
	    	{
	    		throw new Exception("在类[ Ab01ServicesImpl ]中进行了未定义的动作调用,动作名称是  "+utype);
	    	}	
	    }

	public boolean addEmp() throws Exception 
	{
		boolean tag = false;
			DBUtils.beginTransaction();
			try {

				// 1.编写SQL语句
				StringBuilder sql = new StringBuilder()
						.append("insert into b04(c101,user06,b402,b403,b404,b405,b406,b407,b408,b409,b410) ")
						.append("select b01.b101, a03.uid,?,?,?,?,?,?,?,?,?")
						.append("from b01 ,a01, a03, user ")
						.append("where a01.uid=b01.uid1 ")
						.append("and user.uid = a03.uid ")
						.append("and user.name=? ")
						.append("and a01.a101=?  ");
				// 2.编写参数数组
				Object args[] = { 
						this.getFromDto("答辩时间"), 
						" ",
						this.getFromDto("优秀"), 
						this.getFromDto("良好"), 
						this.getFromDto("合格"), 
						this.getFromDto("不合格"),
						this.getFromDto("同意授予"), 
						this.getFromDto("同意重新答辩"), 
						" ",
						this.getFromDto("答辩秘书"), 
						this.getFromDto("学号")
				};
				this.executeUpdate(sql.toString(), args);
				
				StringBuilder sql2 = new StringBuilder()
						.append("insert into b03(uid,b101,b302)")
						.append("select user.uid,b01.b101,'1'")
						.append("from user,b01,a01")
						.append("where user.name=?")
						.append("and b01.uid1=a01.uid ")
						.append("and a01.a101=? ")
						;
				
				Object args2[] = { 
						this.getFromDto("答辩主席"), 
						this.getFromDto("学号"), 	
				};
				this.executeUpdate(sql2.toString(), args2);
				
				StringBuilder sql3 = new StringBuilder()
						.append("insert into b03(uid,b101,b302)")
						.append("select user.uid,b01.b101,'0'")
						.append("from user,b01,a01")
						.append("where user.name=?")
						.append("and b01.uid1=a01.uid ")
						.append("and a01.a101=? ")
						;
				
				Object args3[] = { 
						this.getFromDto("委员一"), 
						this.getFromDto("学号"), 	
				};
				this.executeUpdate(sql3.toString(), args3);
				
				StringBuilder sql4 = new StringBuilder()
						.append("insert into b03(uid,b101,b302)")
						.append("select user.uid,b01.b101,'0'")
						.append("from user,b01,a01")
						.append("where user.name=?")
						.append("and b01.uid1=a01.uid ")
						.append("and a01.a101=? ")
						;
				
				Object args4[] = { 
						this.getFromDto("委员二"), 
						this.getFromDto("学号"), 	
				};
				this.executeUpdate(sql4.toString(), args4);
				
				StringBuilder sql5 = new StringBuilder()
						.append("insert into b03(uid,b101,b302)")
						.append("select user.uid,b01.b101,'0'")
						.append("from user,b01,a01")
						.append("where user.name=?")
						.append("and b01.uid1=a01.uid ")
						.append("and a01.a101=? ")
						;
				
				Object args5[] = { 
						this.getFromDto("委员三"), 
						this.getFromDto("学号"), 	
				};
				this.executeUpdate(sql5.toString(), args5);
				
				
				StringBuilder sql6 = new StringBuilder()
						.append("insert into b03(uid,b101,b302)")
						.append("select user.uid,b01.b101,'0'")
						.append("from user,b01,a01")
						.append("where user.name=?")
						.append("and b01.uid1=a01.uid ")
						.append("and a01.a101=? ")
						;
				
				Object args6[] = { 
						this.getFromDto("委员四"), 
						this.getFromDto("学号"), 	
				};
				this.executeUpdate(sql6.toString(), args6);
				
				
				DBUtils.commit();
			} 
			catch (Exception ex) 
			{
				DBUtils.rollback();
				ex.printStackTrace();
			} finally
			{
				tag = true;
				DBUtils.endTransaction();
			}
		return tag;
	}
}
