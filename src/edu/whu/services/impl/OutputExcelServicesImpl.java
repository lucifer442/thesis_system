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
		//�������ִ�����Ϣ�ģ���syscode��ı������ת��
		//��neu���ݿ�������ݲ���
		StringBuilder sql=new StringBuilder()
				.append("select b.b603,b.b602 ����,b.b604 ��ʦ,")
				.append("       u.name ����,s.fvalue ְ��,a.a601 ��λ,'200' as '���'")
				.append("  from a06 a,b06 b,user u,syscode s")
				.append(" where b.uid=u.uid and a.uid=u.uid")
				.append("   and s.fname='a604' and b.a604=s.fcode")
				.append("   and rid in('4','5')")
				.append(" union ")
				.append("select b.b603,b.b602 ����,b.b604 ��ʦ,")
				.append("       u.name ����,s.fvalue ְ��,a.a601 ��λ,'70' as '���'")
				.append("  from a06 a,b06 b,user u,syscode s")
				.append(" where b.uid=u.uid and a.uid=u.uid")
				.append("   and s.fname='a604' and b.a604=s.fcode")
				.append("   and rid='3'")
				.append("order by b603;");
	    return DBUtils.prepareStatement(sql.toString()).executeQuery();
	}

	public ResultSet financialListForInner()throws Exception
	{
		//�������ִ�����Ϣ�ģ���syscode��ı������ת��
		//��neu���ݿ�������ݲ���
	    StringBuilder sql=new StringBuilder()
	    		.append(" select x.name ר������,x.a601 ����ԺУ,count(x.b101) ����������,count(x.b101)*'200' ��� ")
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
		//�������ִ�����Ϣ�ģ���syscode��ı������ת��
		//��neu���ݿ�������ݲ���
	    StringBuilder sql=new StringBuilder()
	    		.append(" select x.name ר������,x.a601 ����ԺУ,x.a605 ���֤����,x.a606 �����˻�,x.a607 ���忪������,")
	    		.append("        x.a608 �ֻ�����,count(x.b101) ����������,count(x.b101)*'200' ��� from ")
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
     * �����û�
     * 
     * @throws Exception
     */
    public void fillExcelData(ResultSet rs,Workbook wb,String[]headers)throws Exception 
    {
        int rowIndex=0; //��һ��
        Sheet sheet=wb.createSheet(); //����sheetҳ
        Row row=sheet.createRow(rowIndex++);
        //��������
        for (int i=0;i<headers.length;i++) 
        {
            row.createCell(i).setCellValue(headers[i]);
        }
        //�������ݿ��е�����
        while(rs.next())
        {
            row=sheet.createRow(rowIndex++);
            for (int i=0;i<headers.length;i++)
            {
            	//rs.getObject(i + 1)�õ�һ�����󣬼����ݿ���һ�еĽ����ÿһ�о������Դճ�һ�б�ɶ�����Ϊid�Ǵ�1��ʼ������Ҫ+1��
                row.createCell(i).setCellValue(rs.getObject(i+1).toString());
            }
        }
    }

}
