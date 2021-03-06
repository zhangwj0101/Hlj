package Servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.FindSpecialBaseDAO;
import JavaBean.SpecialBase;
import JavaBean.Union;

public class FindSpecialItemsAction extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		FindSpecialBaseDAO findspecialDAO = new FindSpecialBaseDAO();

		String itemid = request.getParameter("itemid");
		System.out.println("itemid :" + itemid);

		// get specialitem
		Vector<SpecialBase> specialbaseitem = new Vector<SpecialBase>();
		specialbaseitem = findspecialDAO.FindSpecialItems(Integer.valueOf(itemid));
		// request.setAttribute("itemcontent", unionitem);

		String start = "<table class='table' cellspacing='0'> <tbody><tr class='odd-row'><th>名称</th><th>级别</th></tr>";
		String content = "";
		for (SpecialBase one : specialbaseitem) {
			content += "<tr><td>" + one.getName() + "</td><td>"
					+ one.getLevel() + "</td>" + "</tr>";
		}
		String end = "</tbody></table>";
		response.getWriter().print(start + content + end);
	}


}
