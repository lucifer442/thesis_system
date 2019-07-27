package edu.whu.web;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;

import edu.whu.services.impl.OutputExcelServicesImpl;
import edu.whu.system.db.DBUtils;
import edu.whu.web.BaseServlet;

@WebServlet(urlPatterns = "/PreviewExcel.xls",name="PreviewExcelOutputServlet")
public class PreviewExcelOutputServlet extends BaseServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=utf-8");
		ResultSet rs1=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
        try
        {
        	OutputExcelServicesImpl servicesImpl=new OutputExcelServicesImpl();
        	//������ݿ�����
            Workbook wb=new HSSFWorkbook();
            //�õ������
            rs1=servicesImpl.OutputpreviewExcel1();
            rs2=servicesImpl.OutputpreviewExcel2();
            rs3=servicesImpl.OutputpreviewExcel3();
            servicesImpl.fillExcelData2(rs1,rs2,rs3,wb);
            export(response,wb,"�������ű�.xls");
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        finally
        {
        	DBUtils.close(rs1);
        	DBUtils.close(rs2);
        	DBUtils.close(rs3);
        }
	}

    /**
     * �����ݷ��뵽.xls�ļ��в����ص�����
     * 
     * @param response
     * @param wb
     * @param fileName
     * @throws Exception
     */
    public void export(HttpServletResponse response,Workbook wb,String fileName)throws Exception 
    {
    	//����ͷ��Ϣ
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String(fileName.getBytes("utf-8"), "iso8859-1"));
        response.setContentType("application/ynd.ms-excel;charset=UTF-8");
        OutputStream out = response.getOutputStream();
        //������������ص�����
        wb.write(out);
        out.flush();
        out.close();
    }
	
}
