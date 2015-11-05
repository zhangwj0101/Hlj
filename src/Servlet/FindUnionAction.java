package Servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.FindUnionDAO;
import JavaBean.UnionCategory;

public class FindUnionAction extends HttpServlet {

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
		FindUnionDAO findUnionDAO = new FindUnionDAO();
		Vector<UnionCategory> unionCategories = findUnionDAO
				.FindUnionCategories();
		StringBuffer data_name = new StringBuffer().append("[");
		StringBuffer data_num = new StringBuffer().append("[");
		for (UnionCategory unionCategory : unionCategories) {
			data_name.append("'" + unionCategory.getCategory() + "',");
			data_num.append("'" + unionCategory.getNum() + "',");
		}
		data_name.deleteCharAt(data_name.length() - 1);
		data_num.deleteCharAt(data_num.length() - 1);
		data_name.append("]");
		data_num.append("]");
		request.setAttribute("data_name", data_name.toString());
		request.setAttribute("data_num", data_num.toString());
		Vector<String> unions = findUnionDAO.FindUnions();
		StringBuffer data_union = new StringBuffer().append("[");
		for (String union : unions) {
			data_union.append("{ name:'" + union + "', value:"
					+ (int) (Math.random() * 1000)
					+ ", itemStyle: createRandomItemStyle() },");
		}
		data_union.deleteCharAt(data_union.length() - 1);
		data_union.append("]");
		request.setAttribute("data_union", data_union.toString());
		request.getRequestDispatcher("/union.jsp").forward(request, response);
	}
}
