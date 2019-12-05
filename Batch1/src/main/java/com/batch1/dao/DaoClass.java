package com.batch1.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.batch1.bo.AddUserbo;
import com.batch1.bo.BoClass;
import com.batch1.bo.LoginBO;

public class DaoClass implements DaoInter {
	 static String user,coding,viva,project;
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;
	public  void setList(String date,String batch ) {
		System.out.println("in dao class");
		   String sql = "select * from students where batch='" + batch +"'";
	    List<BoClass> users = jdbcTemplate.query(sql, new UserMapper1());
	    for(int i=0;i<users.size();i++)
	    {
	    	sql = "insert into mark(id,name,batch,date) values(?,?,?,?)";
			jdbcTemplate.update(sql, new Object[] { users.get(i).getId(),users.get(i).getName(),batch,date});
	    }
	   
	  }
	public void addstudent(AddUserbo addbo) {
		String sql = "insert into students values(?,?,?)";
		jdbcTemplate.update(sql, new Object[] {addbo.getId(),addbo.getName(),addbo.getBatch()});
	}
	public List<BoClass> ListView(String date, String batch) {
		String sql = "select * from mark where batch='" + batch +"'and date='"+date+"'";
		    List<BoClass> markdis =  jdbcTemplate.query(sql, new UserMapper2());
		    return markdis;
	}
	public void markupdate(BoClass boclass,String date) {
		
		jdbcTemplate.update("update mark set viva='"+boclass.getViva()+"',coding='"+boclass.getCoding()+"',project='"+boclass.getProject()+"' where id='"+boclass.getId()+"'and batch='"+boclass.getBatch()+"'and date='"+date+"'" );
		
	}
	public void setListWeek(String week, String batch) {
		 String sql = "select * from students where batch='" + batch +"'";
		    List<BoClass> users = jdbcTemplate.query(sql, new UserMapper1());
		    for(int i=0;i<users.size();i++)
		    {
		    	sql = "insert into week(id,name,batch,week) values(?,?,?,?)";
				jdbcTemplate.update(sql, new Object[] { users.get(i).getId(),users.get(i).getName(),batch,week});
		    }
		
	}
	public List<BoClass> ListViewWeek(String week, String batch) {
		String sql = "select * from week where batch='" + batch +"'and week='"+week+"'";
	    List<BoClass> markdis =  jdbcTemplate.query(sql, new UserMapper3());
	    return markdis;
	}
	public void markupdateWeek(BoClass boclass, String week) {
		jdbcTemplate.update("update week set project='"+boclass.getProjectWeek()+"',interview='"+boclass.getInterview()+"',overall='"+boclass.getOverall()+"' where id='"+boclass.getId()+"'and batch='"+boclass.getBatch()+"'and week='"+week+"'" );
		
	}
	public LoginBO uservalidate(LoginBO logbo) {
		List<LoginBO> users;
		if(logbo.getUsername().charAt(0)=='P'&&logbo.getUsername().charAt(1)=='G'&&logbo.getUsername().charAt(2)=='K')
		{
			System.out.println("Student Validate");
			user="student";
			String sql = "select * from students where id='" + logbo.getUsername() + "'";
		    users = jdbcTemplate.query(sql, new UserMapper4());
		    
		}
		else
		{
			System.out.println("Trainer Validate");
			user="trainer";
			String sql = "select * from trainers where id='" + logbo.getUsername() + "' and password='" +logbo.getPassword()+ "'";
			users = jdbcTemplate.query(sql, new UserMapper4());
		    
		}
		return users.size() > 0 ? users.get(0) : null;
		
	}
	public  List<BoClass> studentDetails(String id) {
		String sql = "select * from mark where id='" + id + "'";
		List<BoClass> markdis1=jdbcTemplate.query(sql, new UserMapper5());
		 
	   
	    return markdis1;
	}
	public List<BoClass> studentDetailsweek(String id) {
		String sql = "select * from week where id='" + id +"'";
	    List<BoClass> markdis2 =  jdbcTemplate.query(sql, new UserMapper6());
		return markdis2;
	}
	
	}
	class UserMapper1 implements RowMapper<BoClass> {
	  public BoClass mapRow(ResultSet rs, int arg1) throws SQLException {
		  BoClass user = new BoClass();
	    user.setName(rs.getString("name"));
	    user.setId(rs.getString("id"));
	    return user;
	  }	
	}
	class UserMapper2 implements RowMapper<BoClass> {
		  public BoClass mapRow(ResultSet rs, int arg1) throws SQLException {
			  BoClass user = new BoClass();
		    user.setName(rs.getString("name"));
		    user.setId(rs.getString("id"));
		    user.setBatch(rs.getString("batch"));
		    user.setViva(rs.getString("viva"));
		    user.setCoding(rs.getString("coding"));
		    user.setProject(rs.getString("project"));
		    return user;
		  }	
		}
	class UserMapper3 implements RowMapper<BoClass> {
		  public BoClass mapRow(ResultSet rs, int arg1) throws SQLException {
			  BoClass user = new BoClass();
		    user.setName(rs.getString("name"));
		    user.setId(rs.getString("id"));
		    user.setBatch(rs.getString("batch"));
		    user.setProjectWeek(rs.getString("project"));
		    user.setInterview(rs.getString("interview"));
		    user.setOverall(rs.getString("overall"));
		    return user;
		  }	
		}
	class UserMapper4 implements RowMapper<LoginBO> {
		  public LoginBO mapRow(ResultSet rs, int arg1) throws SQLException {
			  LoginBO usera = new LoginBO();
			  usera.setUsername(rs.getString("name"));
			  usera.setUser(DaoClass.user);
			  usera.setId(rs.getString("id"));
		    return usera;
		  }	
		}
	class UserMapper5 implements RowMapper<BoClass> {
		  public BoClass mapRow(ResultSet rs, int arg1) throws SQLException {
			  BoClass bo=new BoClass();
			  bo.setId(rs.getString("id"));
			  bo.setName(rs.getString("name"));
			  bo.setDay(rs.getString("date"));
			  if(rs.getString("viva")==null)
			  {
				  System.out.println("viva null");
				  bo.setViva("0");  
			  }
			  else
			  {
				  System.out.println(rs.getString("viva"));
				  bo.setViva(rs.getString("viva"));
			  }
			  if(rs.getString("coding")==null)
			  {
				  bo.setProject("0");  
			  }
			  else
			  {
				  bo.setProject(rs.getString("coding"));
			  }
			  if(rs.getString("project")==null)
			  {
				  bo.setCoding("0");  
			  }
			  else
			  {
				  bo.setCoding(rs.getString("project"));
			  }
			  
			  
			  System.out.println("Usemapper5");
			return bo;
		   
		  }	
		}
	class UserMapper6 implements RowMapper<BoClass> {
		  public BoClass mapRow(ResultSet rs, int arg1) throws SQLException {
			  BoClass bo=new BoClass();
			  bo.setId(rs.getString("id"));
			  bo.setName(rs.getString("name"));
			  bo.setWeek(rs.getString("week"));
			  if(rs.getString("project")==null)
			  {
				  bo.setProjectWeek("0");  
			  }
			  else
			  {
				  bo.setProjectWeek(rs.getString("project")); 
			  }
			  if(rs.getString("interview")==null)
			  {
				  bo.setInterview("0");  
			  }
			  else
			  {
				  bo.setInterview(rs.getString("interview"));
			  }
			  if(rs.getString("overall")==null)
			  {
				  bo.setOverall("0");  
			  }
			  else
			  {
				  bo.setOverall(rs.getString("overall"));
			  }
			  
			  System.out.println("Usemapper6");
		    return bo;
		  }	
		}
