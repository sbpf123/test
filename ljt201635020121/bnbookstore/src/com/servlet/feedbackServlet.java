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

import com.bean.DB;
import com.bean.Feedback;
import com.bean.User;

public class feedbackServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	public static Statement stmt =DB.createStmt(DB.getConn()); //查询
	public static ResultSet rs = null; //得到的数据
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		try {
			request.setCharacterEncoding("UTF-8");//设置编码格式
			
			String type= request.getParameter("type");
			type=(type==null?"list":type);
			if(type.equals("update")){
				
			}else if(type.equals("list")){
				String sql="select * from feedback ";
				rs = DB.executeQuery(stmt, sql);
				List<Feedback> list=new ArrayList<Feedback>();
				while(rs.next()){
					Feedback b=new Feedback();
					b.setId(Integer.parseInt(rs.getString("id")));
					b.setTime(rs.getString("time"));
					b.setTite(rs.getString("tite"));
					b.setContent(rs.getString("content"));
					b.setUsername(rs.getString("username"));
					list.add(b);
				}
				session.setAttribute("listfeedback", list);
			}else if(type.equals("del")){
				//stmt.executeUpdate("delete from address where id='"+id+"' ");
				//response.sendRedirect(basePath+"addresslist.jsp");
			}else if(type.equals("add")){
				String tite= request.getParameter("tite");
				String content= request.getParameter("content");
				User user=(User)session.getAttribute("user");
				SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				stmt.executeUpdate("insert into feedback(tite,content,time,username) values('"+tite+"','"+content+"','"+sf.format(new Date())+"','"+user.getUsername()+"')");
				response.sendRedirect(basePath+"feedbackok.jsp");
			}
		} catch (SQLException e) {}
		
	}
	
	public feedbackServlet() {
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
