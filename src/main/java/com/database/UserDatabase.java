package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.UserDeatil.UserDetail;

public class UserDatabase {
	
	private Connection conn;

	public UserDatabase(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean newUser(UserDetail us) {
		
		boolean fail= false;
		try {
			String query="INSERT INTO enotes(name,email,password) VALUES (?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1) {
				fail=true;
			}
			
			
			
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return fail;
		
		
	}
	
	
	public UserDetail loginUser(UserDetail us) {
		UserDetail user=null;
		try {
			String query="Select * from enotes where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
			ResultSet rs=ps.executeQuery();
			
			
			if(rs.next()) {
				user=new UserDetail();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword("password");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
}

