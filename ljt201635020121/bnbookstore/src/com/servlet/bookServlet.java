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

import com.bean.Book;
import com.bean.DB;
import com.bean.User;

public class bookServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	public static Statement stmt =DB.createStmt(DB.getConn()); //查询
	public static ResultSet rs = null; //得到的数据
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		try {
			request.setCharacterEncoding("UTF-8");//设置编码格式
			
			String isbn= request.getParameter("isbn");
			String name= request.getParameter("name");
			String author= request.getParameter("author");
			String pricep= request.getParameter("pricep");
			String prices= request.getParameter("prices");
			String publish= request.getParameter("publish");
			String number= request.getParameter("number");
			
			//String per= request.getParameter("per");
			String id= request.getParameter("id");
			
			String type= request.getParameter("type");
			type=(type==null?"list":type);
			if(type.equals("update")){
				stmt.executeUpdate("update book set isbn='"+isbn+"',name='"+name+"',author='"+author
						+"',pricep='"+pricep+"',prices='"+prices+"',publish='"+publish+"',number='"+number+"'  where id='"+id+"' ");
				response.sendRedirect(basePath+"bookeditlist.jsp");
			}else if(type.equals("list")){
				
				String sql="select * from book where 1=1 ";
				if(isbn!=null && isbn.length()>0){ sql=sql+"and isbn='"+isbn+"' ";}
				if(name!=null && name.length()>0){ sql=sql+"and name like '%"+name+"%' ";}
				if(author!=null && author.length()>0){ sql=sql+"and author like '"+author+"' ";}
				if(pricep!=null && pricep.length()>0){ sql=sql+"and pricep='"+pricep+"' ";}
				if(prices!=null && prices.length()>0){ sql=sql+"and prices='"+prices+"' ";}
				if(publish!=null && publish.length()>0){ sql=sql+"and publish='"+publish+"' ";}
				if(number!=null && number.length()>0){ sql=sql+"and number='"+number+"' ";}
				
				rs = DB.executeQuery(stmt, sql);
				List<Book> list=new ArrayList<Book>();
				while(rs.next()){
					Book b=new Book();
					b.setId(Integer.parseInt(rs.getString("id")));
					b.setIsbn(rs.getString("isbn"));
					b.setName(rs.getString("name"));
					b.setNumber(rs.getString("number"));
					b.setPricep(rs.getString("pricep"));
					b.setPrices(rs.getString("prices"));
					b.setPublish(rs.getString("publish"));
					b.setAuthor(rs.getString("author"));
					list.add(b);
				}
				session.setAttribute("listbook", list);
			}else if(type.equals("del")){
				stmt.executeUpdate("delete from book where id='"+id+"' ");
				String url=request.getParameter("url");
				if(url!=null){
					response.sendRedirect(basePath+url);
				}
			}else if(type.equals("add")){
				if(name!=null && name.length()>0){
					stmt.executeUpdate("insert into book(isbn,name,author,pricep,prices,publish,number) values('"+isbn+"','"+name+"','"+author+"','"+pricep+"','"+prices+"','"+publish+"','"+number+"')");
				}
				response.sendRedirect(basePath+"bookeditlist.jsp");
			}else if(type.equals("updatenumber")){
				String snumber=request.getParameter("snumber");
				if(snumber!=null && Integer.parseInt(number)>0){
					int a=Integer.parseInt(number);
					a=a-1;
					stmt.executeUpdate("update book set number='"+a+"' where id='"+id+"' ");
				}
			}else if(type.equals("cart")){
				rs = DB.executeQuery(stmt, "select * from book where id='"+id+"' ");
				int indexkc=0;
				while(rs.next()){
					indexkc=indexkc+Integer.parseInt(rs.getString("number"));
				}
				if(indexkc>0){
					User user=(User)session.getAttribute("user");
					int index=0;
					rs = DB.executeQuery(stmt, "select * from cart where userid='"+user.getId()+"' and bookid='"+id+"' and state='0' ");
					while(rs.next()){
						index=index+Integer.parseInt(rs.getString("number"));
					}
					if(index>0){
						index=index+1;
						stmt.executeUpdate("update cart set number='"+index+"' where bookid='"+id+"' and state='0' ");
					}else{
						SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						stmt.executeUpdate("insert into cart(userid,bookid,number,state,addressid,time) values('"+user.getId()+"','"+id+"','1','0','0','"+sf.format(new Date())+"')");
					}
					
					indexkc=indexkc-1;
					stmt.executeUpdate("update book set number='"+indexkc+"' where id='"+id+"' ");
				}
				
				response.sendRedirect(basePath+"booklist.jsp");
			}
		} catch (SQLException e) {}
		
	}
	
	public bookServlet() {
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
