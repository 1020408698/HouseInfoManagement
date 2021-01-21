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
		PreparedStatement pstmt;// 获得PreparedStatment对象 ，PreparedStatment执行SQL查询语句的API,比 Statement 更快
		PreparedStatement pstmt1;
		PreparedStatement pstmt2;
		// 加载数据库驱动
		Connection con;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			System.out.println("驱动找不到");
		}
		List Files = new ArrayList();// 存取上传文件 String name = "";//存取上传人姓名
										// DiskFileItemFactory factory = new
										// DiskFileItemFactory();
		// 创建一个文件解析器工厂
		DiskFileItemFactory fu = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fu);
		upload.setHeaderEncoding("UTF-8");

		try {
			// 存取表单所有信息
			List<FileItem> list = upload.parseRequest(request);// 取得表单的数据内容
			//multipart/form-data表单进行post上传时用request.getpara会得到null值，要用以下方法才可以
			// 此层增强for循环遍历表单中有多少个上传文件将文件存到list中
			for (FileItem items : list) {
				if (items.isFormField()) {// 判断是否不是文件
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
			// sql插入语句
			String sql = "insert into allhouseinfo (housenumber,housename,housetype,louceng,housearea,houseprice,housephoto,beizhu,telnumber,owner) values(?,?,?,?,?,?,?,?,?,?)";
			for (int i = 0; i < Files.size(); i++) {
				System.out.println(Files.size());
				FileItem item = (FileItem) Files.get(i);// 从集合取出文件
				String filename = item.getName();// 获得文件名
				InputStream file = item.getInputStream();// 将文件转为输入流
				// read(byte[])方法,返回读入缓冲区的总字节数
				byte[] buffer = new byte[file.available()];// 将字节数组直接存进去数据库就可以
				file.read(buffer);
				try {
					con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/house", "root", "root");
					pstmt = con.prepareStatement(sql);// 预处理
					pstmt.setString(1, housenumber);// 将第一个占位符（?）设值
					pstmt.setString(2, housename);
					pstmt.setString(3, housetype);
					pstmt.setInt(4, louceng);
					pstmt.setInt(5, housearea);
					pstmt.setInt(6, houseprice);
					pstmt.setBytes(7, buffer);// 图片占位符设值
					pstmt.setString(8, content);
					pstmt.setString(9, telnumber);
					pstmt.setString(10, owner);
					pstmt.executeUpdate();// 执行语句
					if(housetype.equals("公寓房")){
						String sql1 = "insert into apartment(owner,housetype,houseprice,housephoto)values(?,?,?,?)";
						pstmt1 = con.prepareStatement(sql1);
						pstmt1.setString(1, owner);
						pstmt1.setString(2, housetype);
						pstmt1.setInt(3, houseprice);
						pstmt1.setBytes(4, buffer);// 图片占位符设值
						pstmt1.executeUpdate();
					}
					if(housetype.equals("城镇房")){
						String sql2 = "insert into city(owner,housetype,houseprice,housephoto)values(?,?,?,?)";
						pstmt2 = con.prepareStatement(sql2);
						pstmt2.setString(1, owner);
						pstmt2.setString(2, housetype);
						pstmt2.setInt(3, houseprice);
						pstmt2.setBytes(4, buffer);// 图片占位符设值
						pstmt2.executeUpdate();
					}
					file.close();// 将流关闭						
					System.out.println("插入图片成功");
				} catch (SQLException e1) {
					System.out.println(e1);
				}
			}
		} catch (FileUploadException e2) {
			e2.printStackTrace();
		}
		out.println("<script>alert('房屋信息发布成功！');</script>");
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
