package edu.whu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.whu.services.support.JdbcServicesSupport;
import edu.whu.system.db.DBUtils;
import edu.whu.system.tools.Tools;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class A06ServicesImpl extends JdbcServicesSupport 
{
	public boolean update(String utype) throws Exception 
	{
		if (utype.equalsIgnoreCase("addEmp")) 
		{
			return this.addEmp();
		} 
		else if (utype.equalsIgnoreCase("deleteById")) 
		{
			return this.deleteById();
		} 
		else if (utype.equalsIgnoreCase("modifyEmp"))
		{
			return this.modifyEmp();
		} 
		else if (utype.equalsIgnoreCase("batchDelete")) 
		{
			return this.batchDelete();
		} 
		else if (utype.equalsIgnoreCase("email")) 
		{
			return this.email();
		} 
		else 
		{
			throw new Exception("����[ Ab01ServicesImpl ]�н�����δ����Ķ�������,����������  " + utype);
		}
	}

	private boolean deleteById() throws Exception {
		boolean tag = false;
		DBUtils.beginTransaction();
		try {
			String sql = "delete from u_r_relation where uid=?";
			this.executeUpdate(sql, this.getFromDto("uid"));
			String sql2 = "update u_r_relation set u_r_state=0 where uid=?";
			this.executeUpdate(sql2, this.getFromDto("uid"));
			String sql3 = "update user set ustate=0 where uid=?";
			this.executeUpdate(sql3, this.getFromDto("uid"));
		} catch (Exception ex) {
			DBUtils.rollback();
			ex.printStackTrace();
		} finally {
			DBUtils.endTransaction();
		}
		return tag;
	}

	private boolean modifyEmp() throws Exception {
		StringBuilder sql = new StringBuilder()
				.append("update a06 a, user b")
				.append("   set a.a601=?,a.a602=?,a.a603=?,a.a604=?,a.a605=?,a.a606=?,")
				.append("       a.a607=?,a.a608=?,a.a609=?,b.name=?")
				.append(" where a.uid=b.uid")
				.append("   and a.uid=?");
		Object args[] = { 
				this.getFromDto("a601"), 
				this.getFromDto("a602"), 
				this.getFromDto("a603"), 
				this.getFromDto("a604"), 
				this.getFromDto("a605"), 
				this.getFromDto("a606"), 
				this.getFromDto("a607"), 
				this.getFromDto("a608"), 
				this.getFromDto("a609"), 
				this.getFromDto("name"),
				this.getFromDto("uid") 
				};
		return this.executeUpdate(sql.toString(), args) > 0;

	}

	private boolean addEmp() throws Exception {
		String username = Tools.getFormatNumber("4", "E");
		boolean tag = false;
		System.out.println(username);
		// ��DTO���Ա�����

		DBUtils.beginTransaction();
		try {
			String sql2 = "insert into user( uname,upassword,name,ustate) values(?,?,?,?)";

			Object args2[] = { 
					username, 
					Tools.getMd5(username), 
					this.getFromDto("name"), 
					"0" 
					};
			this.executeUpdate(sql2.toString(), args2);

//    	String sql3  = "insert into u_r_relation(uid,rid,u_r_state) values(?,?,?)";
//    	Object args3[]= 
//    	{
//    		uid,	
//    		"1",
//    		"1"
//    	};
//    	this.executeUpdate(sql3.toString(), args3);
//    	

			// 1.��дSQL���
			StringBuilder sql = new StringBuilder()
					.append("insert into a06(uid,a601,a602,a603,a604,a605,")
					.append("                 a606,a607,a608,a609)")
					.append(" select user.uid,?,?,?,?,?,?,?,?,?  ")
					.append(" from user     ")
			        .append(" where user.uname=?  ");
			// 2.��д��������
			Object args[] = {
					this.getFromDto("a601"), 
					this.getFromDto("a602"),
					this.getFromDto("a603"),
					this.getFromDto("a604"), 
					this.getFromDto("a605"),
					this.getFromDto("a606"),
					this.getFromDto("a607"),
					this.getFromDto("a608"), 
					this.getFromDto("a609"),
					username
					};
			this.executeUpdate(sql.toString(), args);
			DBUtils.commit();
		} catch (Exception ex) {
			DBUtils.rollback();
			ex.printStackTrace();
		} finally {
			tag = true;
			DBUtils.endTransaction();
		}
		return tag;
	}

	private boolean batchDelete() throws Exception {
		// 1.����SQL���
		String sql = "delete from a06 where uid=?";
		// 2.��ȡҳ��idlist����
		String idlist[] = this.getIdList("idlist");
		// 3.ִ��
		return this.batchUpdate(sql, idlist);
	}

	public Map<String, String> queryByID() throws Exception {
		// 1.��дSQL���
		StringBuilder sql = new StringBuilder()
				.append("select b.name,a.uid,a.a601,a.a602,a.a603,a.a604,")
				.append("       a.a605,a.a606,a.a607,a.a608,a.a609")
				.append("  from a06 a,user b")
				.append(" where a.uid=b.uid")
				.append("   and a.uid=?");
		// ִ�в�ѯ
		return this.queryForMap(sql.toString(), this.getFromDto("uid"));
	}

	/**
	 * ����������ѯ
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> query() throws Exception {
		// ��ԭҳ���ѯ����
		Object name = this.getFromDto("qname");
		Object a601 = this.getFromDto("qa601");
		Object a602 = this.getFromDto("qa602");
		Object a605 = this.getFromDto("qa605");

		// ����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select b.name,a.a601,a.a602,a.a603,a.a604,")
				.append("       a.a605,a.a608,a.a609,a.uid")
				.append("  from a06 a,user b")
				.append(" where a.uid=b.uid")
				;

		// �����б�
		List<Object> paramList = new ArrayList<>();
		// ��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
		if (this.isNotNull(name)) {
			sql.append(" and b.name like ?");
			paramList.add("%" + name + "%");
		}
		if (this.isNotNull(a601)) {
			sql.append(" and a.a601=?");
			paramList.add(a601);
		}
		if (this.isNotNull(a602)) {
			sql.append(" and a.a602=?");
			paramList.add(a602);
		}
		if (this.isNotNull(a605)) {
			sql.append(" and a.a605=?");
			paramList.add(a605);
		}

		return this.queryForList(sql.toString(), paramList.toArray());
	}

	public boolean email() throws Exception
	{
		boolean tag = false;
		Properties properties = new Properties();
		properties.put("mail.transport.protocol", "smtp");// ����Э��
		properties.put("mail.smtp.host", "smtp.qq.com");// ������
		properties.put("mail.smtp.port", 465);// �˿ں�
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.ssl.enable", "true");// �����Ƿ�ʹ��ssl��ȫ���� ---һ�㶼ʹ��
		properties.put("mail.debug", "true");// �����Ƿ���ʾdebug��Ϣ true ���ڿ���̨��ʾ�����Ϣ
		// �õ��ػ�����
		Session session = Session.getInstance(properties);
		// ��ȡ�ʼ�����
		Message message = new MimeMessage(session);
		// ���÷����������ַ
		message.setFrom(new InternetAddress("2892466166@qq.com"));
		// �����ռ��������ַ
		// message.setRecipients(Message.RecipientType.TO, new InternetAddress[]{new
		
		// �����ʼ�����
		message.setSubject("�人��ѧ���Ĵ������");

		String idlist[] = this.getIdList("idlist");
		for (String id : idlist)
		{
			StringBuilder sql = new StringBuilder()
					.append("SELECT b.name, a.a609")
					.append("  from a06 a, user b")
					.append(" where a.uid=b.uid")
					.append(" and a.uid=?")
					;
			Map<String, String> mailinfo = this.queryForMap(sql.toString(), Integer.parseInt(id));
			StringBuilder mess = new StringBuilder()
					.append("�𾴵�"+mailinfo.get("name")+",����\n")
					.append("�人��ѧ�����ѧԺ��ϵ����������������о������Ĵ��.")
					.append("������ѡ�����������̻������.")
					.append("��������ڰ�æ֮�н�������,���¼������ַ����ע��\n")
					.append(this.getFromDto("path").toString()+"/activate.jsp?flag="+Integer.parseInt(id)+"\n")
					.append("�人��ѧ�����ѧԺ��ӭ���ĵ���")
					;
			// InternetAddress("xxx@qq.com"),new InternetAddress("xxx@qq.com"),new
			// InternetAddress("xxx@qq.com")});
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailinfo.get("a609")));//һ���ռ���
			// �����ʼ�����
			message.setText(mess.toString());
			// �õ��ʲ����
			Transport transport = session.getTransport();
			// �����Լ��������˻�
			transport.connect("2892466166@qq.com", "lhfqetcmysttdcij");// ����ΪQQ���俪ͨ��stmp�����õ��Ŀͻ�����Ȩ��
			// �����ʼ�
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		}
		
		return tag;
	}
}