package edu.whu.services.impl;

import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;

import edu.whu.services.support.JdbcServicesSupport;
import edu.whu.system.db.DBUtils;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

public class OutputExcelServicesImpl extends JdbcServicesSupport 
{
	public ResultSet financialList()throws Exception
	{
		//若用数字代表信息的，用syscode表的编码进行转换
		//用neu数据库进行数据测试
		StringBuilder sql=new StringBuilder()
				.append("select b.b603,b.b602 姓名,b.b604 导师,")
				.append("       u.name 姓名,s.fvalue 职称,a.a601 单位,'200' as '酬金'")
				.append("  from a06 a,b06 b,user u,syscode s")
				.append(" where b.uid=u.uid and a.uid=u.uid")
				.append("   and s.fname='a604' and b.a604=s.fcode")
				.append("   and rid in('4','5')")
				.append(" union ")
				.append("select b.b603,b.b602 姓名,b.b604 导师,")
				.append("       u.name 姓名,s.fvalue 职称,a.a601 单位,'70' as '酬金'")
				.append("  from a06 a,b06 b,user u,syscode s")
				.append(" where b.uid=u.uid and a.uid=u.uid")
				.append("   and s.fname='a604' and b.a604=s.fcode")
				.append("   and rid='3'")
				.append("order by b603;");
	    return DBUtils.prepareStatement(sql.toString()).executeQuery();
	}

	public ResultSet financialListForInner()throws Exception
	{
		//若用数字代表信息的，用syscode表的编码进行转换
		//用neu数据库进行数据测试
	    StringBuilder sql=new StringBuilder()
	    		.append(" select x.name 专家名称,x.a601 所属院校,count(x.b101) 答辩评审次数,count(x.b101)*'200' 酬金 ")
	    		.append("   from ")
	    		.append("(select n.uid,n.name,n.a601,n.b101 ")
	    		.append("   from ")
	    		.append("(select u.uid,u.name,a.a601,b.b101 ")
	    		.append("   from a06 a,user u,b02 b")
	    		.append("  where u.uid=a.uid and u.uid=b.uid and a.a602='1')n")
	    		.append("  union ")
	    		.append(" select m.uid,m.name,m.a601,m.b101 ")
	    		.append("   from ")
	    		.append("(select u.uid,u.name,a.a601,c.b101 ")
	    		.append("   from a06 a,user u,b03 c")
	    		.append("  where u.uid=a.uid and u.uid=c.uid and a.a602='1')m)x")
	    		.append("  group by uid");
	    return DBUtils.prepareStatement(sql.toString()).executeQuery();
	}
	
	public ResultSet financialListForOuter()throws Exception
	{
		//若用数字代表信息的，用syscode表的编码进行转换
		//用neu数据库进行数据测试
	    StringBuilder sql=new StringBuilder()
	    		.append(" select x.name 专家名称,x.a601 所属院校,x.a605 身份证号码,x.a606 银行账户,x.a607 具体开户银行,")
	    		.append("        x.a608 手机号码,count(x.b101) 答辩评审次数,count(x.b101)*'200' 酬金 from ")
	    		.append("(select n.uid,n.name,n.a601,n.b101,n.a605,n.a606,n.a607,n.a608 from ")
	    		.append("(select u.uid,u.name,a.a601,b.b101,a.a605,a.a606,a.a607,a.a608")
	    		.append("   from a06 a,user u,b02 b")
	    		.append("  where u.uid=a.uid and u.uid=b.uid and a.a602='2')n")
	    		.append("  union ")
	    		.append(" select m.uid,m.name,m.a601,m.b101,m.a605,m.a606,m.a607,m.a608 from ")
	    		.append("(select u.uid,u.name,a.a601,c.b101,a.a605,a.a606,a.a607,a.a608")
	    		.append("   from a06 a,user u,b03 c")
	    		.append("  where u.uid=a.uid and u.uid=c.uid and a.a602='2')m)x")
	    		.append("  group by uid;");
	    return DBUtils.prepareStatement(sql.toString()).executeQuery();
	}
	
    /**
     * 导出用户
     * 
     * @throws Exception
     */
    public void fillExcelData(ResultSet rs,Workbook wb,String[]headers)throws Exception 
    {
        int rowIndex=0; //第一行
        Sheet sheet=wb.createSheet(); //创建sheet页
        Row row=sheet.createRow(rowIndex++);
        //创建标题
        for (int i=0;i<headers.length;i++) 
        {
            row.createCell(i).setCellValue(headers[i]);
        }
        //导出数据库中的数据
        while(rs.next())
        {
            row=sheet.createRow(rowIndex++);
            for (int i=0;i<headers.length;i++)
            {
            	//rs.getObject(i + 1)得到一个对象，即数据库中一行的结果，每一列就是属性凑成一行变成对象。因为id是从1开始，所以要+1。
                row.createCell(i).setCellValue(rs.getObject(i+1).toString());
            }
        }
    }

}
