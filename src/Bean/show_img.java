package Bean;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class show_img extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public show_img() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("image/*");// 设置为图pain方式
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		Connection con;
		PreparedStatement pstmt;// 获得PreparedStatement对象
		ResultSet rs = null;
		// 通过img 的src 获得上传人
		String owner = new String(request.getParameter("owner").getBytes("ISO-8859-1"), "gbk");
		System.out.println(owner);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			System.out.println("驱动找不到");
		}
		String sql = "select * from allhouseinfo where owner =?";
		List img = new ArrayList();// 存放img名字用于页面显示；
		try {
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/house", "root", "root");
			try {
				// 实例化PreparedStatement对象
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, owner);// 查询条件根据上传人查询
				rs = pstmt.executeQuery();// 执行查询
				if (rs.next()) {// 循环取出所有图片
					byte[] buff = rs.getBytes("housephoto");// 图片所在的字段名，前面存的是byte 现在相对应的取
					OutputStream os = response.getOutputStream();// 获得输出流
					os.write(buff);// 将其输出页面
					System.out.println("取出成功");
				}
				pstmt.close();
				rs.close();
			} catch (Exception e) {
				System.out.println("取出失败 " + e);
			}
		} catch (SQLException e1) {
			System.out.println(e1);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		doGet(request, response);
	}

}
