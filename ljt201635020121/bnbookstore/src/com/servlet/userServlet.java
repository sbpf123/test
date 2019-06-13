package com.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.DB;
import com.bean.User;

public class userServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	public static Statement stmt =DB.createStmt(DB.getConn()); //查询
	public static ResultSet rs = null; //得到的数据
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		try {
			String username= request.getParameter("username");
			String password= request.getParameter("password");
			String per= request.getParameter("per");
			String id= request.getParameter("id");
			
			String type= request.getParameter("type");
			type=(type==null?"list":type);
			if(type.equals("login")){
				rs = DB.executeQuery(stmt, "select * from user where password='"+password+"' and username='"+username+"' and per='"+per+"' ");
				User u=new User();
				while(rs.next()){
					u.setUsername(rs.getString("username"));
					u.setPassword(rs.getString("password"));
					u.setPer(rs.getString("per"));
					u.setId(Integer.parseInt(rs.getString("id")));
				}
				if(u.getId()>0){
					session.setAttribute("user", u);
					response.sendRedirect(basePath+"index.jsp");
				}else{
					response.sendRedirect(basePath+"login.jsp");
				}
			}else if(type.equals("update")){
				stmt.executeUpdate("update user set username='"+username+"',password='"+password+"',per='"+per+"' where id='"+id+"' ");
				response.sendRedirect(basePath+"index.jsp");
			}else if(type.equals("list")){
				rs = DB.executeQuery(stmt, "select * from user ");
				List<User> listuser=new ArrayList<User>();
				while(rs.next()){
					User u=new User();
					u.setUsername(rs.getString("username"));
					u.setPassword(rs.getString("password"));
					u.setPer(rs.getString("per"));
					u.setId(Integer.parseInt(rs.getString("id")));
					listuser.add(u);
				}
				session.setAttribute("listuser", listuser);
			}else if(type.equals("del")){
				stmt.executeUpdate("delete from user where id='"+id+"' ");
				response.sendRedirect(basePath+"index.jsp");
			}else if(type.equals("add")){
				if(username.length()>0 && password.length()>0 && per.length()>0){
					stmt.executeUpdate("insert into user(username,password,per) values('"+username+"','"+password+"','"+per+"')");
					String url= request.getParameter("url");
					if(url!=null){
						response.sendRedirect(basePath+url);
					}else{
						response.sendRedirect(basePath+"urseeditlist.jsp");
					}
				}else{
					response.sendRedirect(basePath+"register.jsp");
				}
				
			}
		} catch (SQLException e) {}
		
	}
	
	public userServlet() {
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
