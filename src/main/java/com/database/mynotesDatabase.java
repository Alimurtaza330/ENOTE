package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.UserDeatil.UserDetail;
import com.UserDeatil.mynotes;

public class mynotesDatabase {
	
	private Connection conn;


	public mynotesDatabase(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean addnotes(String title, String description, int uid) {
		
		boolean fail=false;
		try {
			String query="Insert into mynotes(title,description,uid) values (?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setInt(3, uid);
			
			int i=ps.executeUpdate();
			if(i==1) {
				fail=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fail;
		
	}
	
	
	public  List<mynotes> getData(int id){
		
		List<mynotes> list=new ArrayList<mynotes>();
		mynotes mn=null;

		try {
			 
			String query="Select * from mynotes where uid=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, id);
			
			
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				mn=new mynotes();
				mn.setId(rs.getInt(1));
				mn.setTitle(rs.getString(2));
				mn.setDiscription(rs.getString(3));
				mn.setPdate(rs.getTimestamp(4));
				list.add(mn);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	
	
	public mynotes getDataByID(int noteid) {
		
		mynotes mynote=null;
		try {
			String query="Select * from mynotes where id=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, noteid);
			
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				mynote=new mynotes();
				mynote.setId(rs.getInt(1));
				mynote.setTitle(rs.getString(2));
				mynote.setDiscription(rs.getString(3));
				
				
				
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mynote;
		
	}
	
	
	
	public boolean updatenote(int noteid,String title,String discription) {
		boolean fail=false;
		
		try {
			String query="UPDATE mynotes SET title = ?, description = ? WHERE id = ?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, discription);
			ps.setInt(3, noteid);
			
			int i=ps.executeUpdate();
			if(i==1) {
				fail=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fail;
	}
	
	
	public boolean deletenote(int noteid) {
		boolean fail=false;
		
		try {
			String query="DELETE FROM mynotes WHERE id = ?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, noteid);
			int x=ps.executeUpdate();
			if(x==1) {
				fail=true;
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fail;
	}
	
	

}
