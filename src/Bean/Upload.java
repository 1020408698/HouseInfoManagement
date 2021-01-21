package Bean;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String name;
	String housenumber,housename,owner,housetype,content,telnumber;
	int louceng,housearea,houseprice;

	public Upload() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		PreparedStatement pstmt;// ���PreparedStatment���� ��PreparedStatmentִ��SQL��ѯ����API,�� Statement ����
		PreparedStatement pstmt1;
		PreparedStatement pstmt2;
		// �������ݿ�����
		Connection con;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			System.out.println("�����Ҳ���");
		}
		List Files = new ArrayList();// ��ȡ�ϴ��ļ� String name = "";//��ȡ�ϴ�������
										// DiskFileItemFactory factory = new
										// DiskFileItemFactory();
		// ����һ���ļ�����������
		DiskFileItemFactory fu = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fu);
		upload.setHeaderEncoding("UTF-8");

		try {
			// ��ȡ��������Ϣ
			List<FileItem> list = upload.parseRequest(request);// ȡ�ñ�����������
			//multipart/form-data������post�ϴ�ʱ��request.getpara��õ�nullֵ��Ҫ�����·����ſ���
			// �˲���ǿforѭ�����������ж��ٸ��ϴ��ļ����ļ��浽list��
			for (FileItem items : list) {
				if (items.isFormField()) {// �ж��Ƿ����ļ�
					if (items.getFieldName().equals("housenumber")) {
						housenumber = new String(items.getString().getBytes("ISO-8859-1"), "UTF-8");
					}
					if (items.getFieldName().equals("housename")) {
						housename = new String(items.getString().getBytes("ISO-8859-1"), "UTF-8");
					}
					if (items.getFieldName().equals("owner")) {
						owner = new String(items.getString().getBytes("ISO-8859-1"), "UTF-8");
					}
					if (items.getFieldName().equals("housetype")) {
						housetype = new String(items.getString().getBytes("ISO-8859-1"), "UTF-8");
					}
					if (items.getFieldName().equals("suozailouceng")) {
						louceng = new Integer(items.getString());
					}
					if (items.getFieldName().equals("housearea")) {
						housearea = new Integer(items.getString());
					}
					if (items.getFieldName().equals("houseprice")) {
						houseprice = new Integer(items.getString());
					}
					if (items.getFieldName().equals("content")) {
						content = new String(items.getString().getBytes("ISO-8859-1"), "UTF-8");
					}
					if (items.getFieldName().equals("telnumber")) {
						telnumber = new String(items.getString().getBytes("ISO-8859-1"), "UTF-8");
					}
					System.out.println(items.getFieldName());
				} else {
					Files.add(items);
				}
			}
			// sql�������
			String sql = "insert into allhouseinfo (housenumber,housename,housetype,louceng,housearea,houseprice,housephoto,beizhu,telnumber,owner) values(?,?,?,?,?,?,?,?,?,?)";
			for (int i = 0; i < Files.size(); i++) {
				System.out.println(Files.size());
				FileItem item = (FileItem) Files.get(i);// �Ӽ���ȡ���ļ�
				String filename = item.getName();// ����ļ���
				InputStream file = item.getInputStream();// ���ļ�תΪ������
				// read(byte[])����,���ض��뻺���������ֽ���
				byte[] buffer = new byte[file.available()];// ���ֽ�����ֱ�Ӵ��ȥ���ݿ�Ϳ���
				file.read(buffer);
				try {
					con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/house", "root", "root");
					pstmt = con.prepareStatement(sql);// Ԥ����
					pstmt.setString(1, housenumber);// ����һ��ռλ����?����ֵ
					pstmt.setString(2, housename);
					pstmt.setString(3, housetype);
					pstmt.setInt(4, louceng);
					pstmt.setInt(5, housearea);
					pstmt.setInt(6, houseprice);
					pstmt.setBytes(7, buffer);// ͼƬռλ����ֵ
					pstmt.setString(8, content);
					pstmt.setString(9, telnumber);
					pstmt.setString(10, owner);
					pstmt.executeUpdate();// ִ�����
					if(housetype.equals("��Ԣ��")){
						String sql1 = "insert into apartment(owner,housetype,houseprice,housephoto)values(?,?,?,?)";
						pstmt1 = con.prepareStatement(sql1);
						pstmt1.setString(1, owner);
						pstmt1.setString(2, housetype);
						pstmt1.setInt(3, houseprice);
						pstmt1.setBytes(4, buffer);// ͼƬռλ����ֵ
						pstmt1.executeUpdate();
					}
					if(housetype.equals("����")){
						String sql2 = "insert into city(owner,housetype,houseprice,housephoto)values(?,?,?,?)";
						pstmt2 = con.prepareStatement(sql2);
						pstmt2.setString(1, owner);
						pstmt2.setString(2, housetype);
						pstmt2.setInt(3, houseprice);
						pstmt2.setBytes(4, buffer);// ͼƬռλ����ֵ
						pstmt2.executeUpdate();
					}
					file.close();// �����ر�						
					System.out.println("����ͼƬ�ɹ�");
				} catch (SQLException e1) {
					System.out.println(e1);
				}
			}
		} catch (FileUploadException e2) {
			e2.printStackTrace();
		}
		out.println("<script>alert('������Ϣ�����ɹ���');</script>");
		response.setHeader("refresh", "0;url=houseinfo.jsp");
		//request.getRequestDispatcher("houseinfo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		doGet(request, response);
		//PrintWriter out = response.getWriter();
	}

}
