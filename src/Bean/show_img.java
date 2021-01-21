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

		response.setContentType("image/*");// ����Ϊͼpain��ʽ
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		Connection con;
		PreparedStatement pstmt;// ���PreparedStatement����
		ResultSet rs = null;
		// ͨ��img ��src ����ϴ���
		String owner = new String(request.getParameter("owner").getBytes("ISO-8859-1"), "gbk");
		System.out.println(owner);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e2) {
			System.out.println("�����Ҳ���");
		}
		String sql = "select * from allhouseinfo where owner =?";
		List img = new ArrayList();// ���img��������ҳ����ʾ��
		try {
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/house", "root", "root");
			try {
				// ʵ����PreparedStatement����
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, owner);// ��ѯ���������ϴ��˲�ѯ
				rs = pstmt.executeQuery();// ִ�в�ѯ
				if (rs.next()) {// ѭ��ȡ������ͼƬ
					byte[] buff = rs.getBytes("housephoto");// ͼƬ���ڵ��ֶ�����ǰ������byte �������Ӧ��ȡ
					OutputStream os = response.getOutputStream();// ��������
					os.write(buff);// �������ҳ��
					System.out.println("ȡ���ɹ�");
				}
				pstmt.close();
				rs.close();
			} catch (Exception e) {
				System.out.println("ȡ��ʧ�� " + e);
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
