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

import com.bean.Address;
import com.bean.DB;
import com.bean.User;

public class addressServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	public static Statement stmt =DB.createStmt(DB.getConn()); //查询
	public static ResultSet rs = null; //得到的数据
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		try {
			request.setCharacterEncoding("UTF-8");
			
			String id= request.getParameter("id");
			String name= request.getParameter("name");
			String tel= request.getParameter("tel");
			String region= request.getParameter("region");
			
			String type= request.getParameter("type");
			type=(type==null?"list":type);
			if(type.equals("update")){
				
			}else if(type.equals("list")){
				User user=(User)session.getAttribute("user");
				String sql="select * from address where 1=1 ";
				if(!user.getPer().equals("0")){
					sql=sql+"and userid='"+user.getId()+"' ";
				}
				
				if(name!=null && name.length()>0){
					sql=sql+"and name like '%"+name+"%' ";
				}
				if(tel!=null && tel.length()>0){
					sql=sql+"and tel like '%"+tel+"%' ";
				}
				if(region!=null && region.length()>0){
					sql=sql+"and region like '%"+region+"%' ";
				}
				
				rs = DB.executeQuery(stmt, sql);
				List<Address> list=new ArrayList<Address>();
				while(rs.next()){
					Address b=new Address();
					b.setId(Integer.parseInt(rs.getString("id")));
					b.setName(rs.getString("name"));
					b.setTel(rs.getString("tel"));
					b.setRegion(rs.getString("region"));
					b.setUserid(Integer.parseInt(rs.getString("userid")));
					list.add(b);
				}
				session.setAttribute("listaddress", list);
			}else if(type.equals("del")){
				stmt.executeUpdate("delete from address where id='"+id+"' ");
				response.sendRedirect(basePath+"addresslist.jsp");
				
			}else if(type.equals("add")){
				if(tel!=null && tel.length()>0){
					User user=(User)session.getAttribute("user");
					stmt.executeUpdate("insert into address(name,tel,region,userid) values('"+name+"','"+tel+"','"+region+"','"+user.getId()+"')");
				}
				response.sendRedirect(basePath+"addresslist.jsp");
			}
		} catch (SQLException e) {}
		
	}
	
	public addressServlet() {
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
