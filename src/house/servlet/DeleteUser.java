package house.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import house.service.HouseService;

public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteUser() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user = request.getParameter("user");
		HouseService service = new HouseService();
		boolean result = service.deleteUserRecord(user);
		response.setContentType("text/html charset=utf-8");
		response.setCharacterEncoding("utf-8");
		if (result) {
			// response.getWriter().print("ɾ���ɹ�");
			response.sendRedirect("admin/adminManagement.jsp");
		} else
			response.getWriter().print("ɾ��ʧ��");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
