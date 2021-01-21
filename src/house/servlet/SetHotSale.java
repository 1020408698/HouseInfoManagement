package house.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import house.service.HouseService;

public class SetHotSale extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SetHotSale() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String owner = request.getParameter("owner");
		HouseService service = new HouseService();
		boolean result = service.SetHotSale(owner);
		response.setContentType("text/html charset=utf-8");
		response.setCharacterEncoding("utf-8");
		if (result) {
			response.sendRedirect("admin/allrecord.jsp");		
		} else
			response.getWriter().print("…Ë÷√ ß∞‹");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
