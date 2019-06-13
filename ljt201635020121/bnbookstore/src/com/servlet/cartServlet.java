package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Cart;
import com.bean.DB;

public class cartServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	public static Statement stmt =DB.createStmt(DB.getConn()); //查询
	public static ResultSet rs = null; //得到的数据
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		try {
			request.setCharacterEncoding("UTF-8");//设置编码格式
			String id=request.getParameter("id");
			
			String type= request.getParameter("type");
			type=(type==null?"list":type);
			if(type.equals("updatestate")){
				String addressid=request.getParameter("addressid");
				SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				stmt.executeUpdate("update cart set state='1',addressid='"+addressid+"',time='"+sf.format(new Date())+"' where id='"+id+"' ");
				response.sendRedirect(basePath+"cartlist.jsp");
			}else if(type.equals("del")){
				stmt.executeUpdate("delete from cart where id='"+id+"' ");
				response.sendRedirect(basePath+"cartlist.jsp");
			}else if(type.equals("list")){
				rs = DB.executeQuery(stmt, "select * from cart ");
				List<Cart> listcart=new ArrayList<Cart>();
				while(rs.next()){
					Cart u=new Cart();
					u.setId(Integer.parseInt(rs.getString("id")));
					u.setUserid(Integer.parseInt(rs.getString("userid")));
					u.setNumber(Integer.parseInt(rs.getString("number")));
					u.setBookid(Integer.parseInt(rs.getString("bookid")));
					u.setState(Integer.parseInt(rs.getString("state")));
					u.setAddressid(Integer.parseInt(rs.getString("addressid")));
					u.setTime(rs.getString("time"));
					listcart.add(u);
				}
				session.setAttribute("listcart", listcart);
			}
		} catch (SQLException e) {}
		
	}
	
	public cartServlet() {
		super();
	}
	public void destroy() {
		super.destroy();
	}
	public void init() throws ServletException {
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}


}
