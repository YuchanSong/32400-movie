package com.project.tfa;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBUtil {
	
	public static Connection getMySQLConnection() {
		Connection conn = null;
		String driver = "org.gjt.mm.mysql.Driver";
		String url = "jdbc:mysql://localhost:3306/cgv";
		String username = "root";
		String password = "onlyroot";
		
		try {
			Class c = Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
		} catch (java.lang.ClassNotFoundException e) {
			System.err.println("### JDBC �삤瑜�: " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("## SQL �삤瑜�" + e.getMessage());
		}
		return conn;
	}
	
	public static ArrayList<String> showAuditorium() {
			Statement stmt = null;
		   Connection conn = getMySQLConnection();
		   ResultSet rs = null;
		   String sql = "select * from auditorium";
		   ArrayList<String> result = new ArrayList<String>();
	 	   try {
	 		   stmt = conn.createStatement();
	 		   rs = stmt.executeQuery(sql);

	 	   } catch( SQLException ex ) 	    {
	 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
	 	   }
			try{
				while(rs.next()) {
					result.add(rs.getString("ano")+";"+rs.getString("scount"));
				}
			}
			catch( SQLException ex ) {       
			}
			return result;
	    }
	   
	   public static int deleteAuditorium(String ano) {
		   Statement stmt = null;
		   Connection conn = getMySQLConnection();
		   ResultSet rs = null;
		   int cnt = 0;
		   
			try {
				stmt = conn.createStatement();
				cnt = stmt.executeUpdate("delete from auditorium where ano ="+ano);
			} catch( SQLException ex ) 
			{              
				System.err.println("  !! <JDBC Error > SQL占쎈쐻占쎈짗占쎌굲 exec 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲: " + ex.getMessage() );
			}
			return cnt;
	   }
	   
	   public static int updateAuditorium(String ano, String scount) {
		   Statement stmt = null;
		   Connection conn = getMySQLConnection();
		   int cnt = 0;
		   
		   try {
			   stmt = conn.createStatement();
			   cnt = stmt.executeUpdate("update auditorium set scount ="+scount+" where ano = "+ano+";");
		   } catch( SQLException ex ) 
			{              
				System.err.println("  !! <JDBC Error > SQL占쎈쐻占쎈짗占쎌굲 exec 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲: " + ex.getMessage() );
			}
			return cnt;
	   }
	   
	   public static int insertAuditorium(String scount) {
		   Statement stmt = null;
		   Connection conn = getMySQLConnection();
		   ResultSet rs = null;
		   int cnt = 0;
		   
		   try {
			   stmt = conn.createStatement();
			   cnt = stmt.executeUpdate("insert into auditorium(scount) values("+scount+");");
		   } catch( SQLException ex ) 
			{              
				System.err.println("  !! <JDBC Error > SQL占쎈쐻占쎈짗占쎌굲 exec 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲: " + ex.getMessage() );
			}
			return cnt;
	   }

	
	
	////////////////////////////////////////////
	   public static ArrayList<String> showMovie(){
		   Statement stmt = null;
		   Connection conn = getMySQLConnection();
		   ResultSet rs = null;
		   String sql = "select * from movie";
		   ArrayList<String> result = new ArrayList<String>();
	 	   try {
	 		   // Statement 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
	 		   stmt = conn.createStatement();
	 		   rs = stmt.executeQuery(sql);

	 	   } catch( SQLException ex ) 	    {
	 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
	 	   }
			try{
				while(rs.next()) {
					result.add(rs.getString("mnum")+";"+rs.getString("mn")+";"+rs.getString("sc")+";"+rs.getString("genre")+";"+rs.getString("price")+";"+rs.getString("limit_age"));
				}
			}
			catch( SQLException ex ) {       
			}
			return result;
	    }
	
	public static int updateMovie(String mnum, String mn, String sc, String genre, String limit_age) {
		Statement stmt = null;
		   Connection conn = getMySQLConnection();
		   int cnt = 0;
		   
		   try {
			   stmt = conn.createStatement();
			   cnt = stmt.executeUpdate("update movie set mn ='"+mn+"', sc ='"+sc+"', genre ='"+genre+"', limit_age ="+limit_age+" where mnum = '"+mnum+"';");
		   } catch( SQLException ex ) 
			{              
				System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
			}
			return cnt;
	   }
	
	public static int deleteMovie(String mnum) {
		 Statement stmt = null;
		   Connection conn = getMySQLConnection();
		   int cnt = 0;
			try {
				// SQL �뜝�룞�삕�뜝�떎諭꾩삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕�뜝�떬�뙋�삕.
				   stmt = conn.createStatement();
				cnt = stmt.executeUpdate("delete from movie where mnum ="+mnum);
			} catch( SQLException ex ) 
			{              
				System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
			}
			return cnt;
	   }
	
	
	   public static int insertMovie(String mn, String sc, String genre, String limit_age) {
		   
		   Statement stmt = null;
		   Connection conn = getMySQLConnection();
		   int cnt = 0;
		   try {
			   stmt = conn.createStatement();
			   cnt = stmt.executeUpdate("insert into movie(mn, sc, genre, limit_age) values('"+mn+"', '"+sc+"', '"+genre+"', '"+limit_age+"');");
		   } catch( SQLException ex ) 
			{              
				System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
			}
			return cnt;
	   }
	   
	   public static int updateTimetable(String tno, String mnum, String ano, String od, String ot) {
				Statement stmt = null;
			   Connection conn = getMySQLConnection();
			   System.out.println(tno);
			   System.out.println(mnum);
			   System.out.println(ano);
			   System.out.println(od);
			   System.out.println(ot);
			   int cnt = 0;
			   
			   try {
				   stmt = conn.createStatement();
				   cnt = stmt.executeUpdate("update timetable set mnum ='"+mnum+"', ano ='"+ano+"', od ='"+od+"', ot ='"+ot+"' where tno = '"+tno+"';");
			   } catch( SQLException ex ) 
				{              
					System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
				}
				return cnt;
		   }
	   
	   public static int deleteTimetable(String tno) {
			 Statement stmt = null;
			   Connection conn = getMySQLConnection();
			   int cnt = 0;
				try {
					   stmt = conn.createStatement();
					cnt = stmt.executeUpdate("delete from timetable where tno ="+tno);
				} catch( SQLException ex ) 
				{              
					System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
				}
				return cnt;
		   }
	   
	   public static ArrayList<String> showTimetable(){
		   Statement stmt = null;
		   Connection conn = getMySQLConnection();
		   ResultSet rs = null;
		   String sql = "select * from timetable";
		   ArrayList<String> result = new ArrayList<String>();
	 	   try {
	 		   // Statement 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
	 		   stmt = conn.createStatement();
	 		   rs = stmt.executeQuery(sql);

	 	   } catch( SQLException ex ) 	    {
	 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
	 	   }
			try{
				while(rs.next()) {
					result.add(rs.getString("tno")+";"+rs.getString("mnum")+";"+rs.getString("ano")+";"+rs.getString("od")+";"+rs.getString("ot"));
				}
			}
			catch( SQLException ex ) {       
			}
			return result;
	   }
	
	   public static int insertTimetable(String mnum, String ano, String od, String ot){
		   Statement stmt = null;
		   Connection conn = getMySQLConnection();
		   
		   int cnt = 0;
		   try {
			   stmt = conn.createStatement();
			   cnt = stmt.executeUpdate("insert into timetable(mnum, ano, od, ot) values('"+mnum+"', '"+ano+"', '"+od+"', '"+ot+"');");
		   } catch( SQLException ex ) 
			{              
				System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
			}
			return cnt;   
	   }

public static ArrayList<String> data_statistics_op() {
		
		Connection conn = getMySQLConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList<String> result = new ArrayList<String>();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select op, count(rno) as c_reservation " + "from reservation " + "group by op");
		} catch (SQLException ex) {
			System.err.println("  !! <JDBC Error > SQL臾� 寃곌낵異쒕젰 �삤瑜�:" + ex.getMessage());
		}
		
		try {
			System.out.println("\n* 寃곗젣諛⑸쾿 蹂� 寃곗젣 �슏�닔");
			while (rs.next()) {
				System.out.println(rs.getString("op") + "	" + rs.getInt("c_reservation"));
				result.add(";" + rs.getString("op") + ";" + rs.getInt("c_reservation"));
			}
		} catch (SQLException ex) { }
		
		return result;
	}
	
public static ArrayList<String> data_statistics_movie() {
		
		Connection conn = getMySQLConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		ArrayList<String> result = new ArrayList<String>();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select mn, count(rno) as c_reservation " + "from reservation " + "group by mn;");
		} catch (SQLException ex) {
			System.err.println("  !! <JDBC Error > SQL臾� 寃곌낵異쒕젰 �삤瑜�:" + ex.getMessage());
		}
		System.out.println("*************************");
		
		try {
			System.out.println("\n* �쁺�솕蹂� �삁留� �슏�닔");
			while (rs.next()) {
				System.out.println(rs.getString("mn") + "	" + rs.getInt("c_reservation"));
				result.add(";" + rs.getString("mn") + ";" + rs.getInt("c_reservation"));
			}
		} catch (SQLException ex) { }
		
		return result;
	}
	
	public static ArrayList<String> data_statistics_mem() {
		
		Connection conn = getMySQLConnection();
		Statement stmt = null;
		Statement stmt2 = null;
		Statement stmt3 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		
		ArrayList<String> result = new ArrayList<String>();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(mno) as c_member, avg(age) as a_age " + "from member;");
		} catch (SQLException ex) {
			System.err.println("  !! <JDBC Error > SQL臾� 寃곌낵異쒕젰 �삤瑜�:" + ex.getMessage());
		}
		System.out.println("*************************");
		
		try {
			if (rs.next()) {
				result.add(rs.getInt("c_member") + ";" + rs.getInt("a_age") + ";");
			}
			System.out.println("*************************");
		} catch (SQLException ex) {
		}
		return result;
	}
	
	public static ArrayList<String> showReservationList() {
		
			Statement stmt = null;
		   Connection conn = getMySQLConnection();
		   ResultSet rs = null;
		
		   String sql = "select reservation.rno, reservation.mno, movie.mn, timetable.ano, timetable.od, timetable.ot, seat.line, seat.row, reservation.op, reservation.rdate from movie, timetable, seat, reservation where reservation.sno = seat.sno and seat.tno = timetable.tno and timetable.mnum = movie.mnum";
		   ArrayList<String> result = new ArrayList<String>();
		   
	 	   try {
	 		   stmt = conn.createStatement();
	 		   rs = stmt.executeQuery(sql);

	 	   } catch( SQLException ex ) 	    {
	 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
	 	   }
	 	  
			try{
				while(rs.next()) {
					result.add(rs.getString("reservation.rno")+";"+rs.getString("reservation.mno")+";"+rs.getString("movie.mn")+";"+rs.getString("timetable.ano")+";"+rs.getString("timetable.od")+" "+rs.getString("timetable.ot")+";"+rs.getString("seat.line")+";"+rs.getString("seat.row")+";"+rs.getString("reservation.op")+";"+rs.getString("reservation.rdate"));
				}
			}
			catch( SQLException ex ) {       
			}
			
			return result;
	    }


	   public static ArrayList<String> showMember() {
		   
		   PreparedStatement psmt = null;
		   Connection conn = getMySQLConnection();
		   ResultSet rs = null;
		   
		   String sql = "select * from member";
		   ArrayList<String> result = new ArrayList<String>();
	 	   try {
	 		   psmt = conn.prepareStatement(sql);
	 		   rs = psmt.executeQuery();

	 	   } catch( SQLException ex ) 	    {
	 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
	 	   }
			try{
				while(rs.next()) {
					result.add(rs.getInt("mno")+";"+rs.getString("mname")+";"+rs.getInt("age")+";"+rs.getString("tel")+";"+rs.getString("id")+";"+rs.getString("pw")+";"+rs.getInt("point"));
				}
			}
			catch( SQLException ex ) {       
			}
			return result;
	    }
	
	   public static ArrayList<String> showMember_id(String id) {
		   
		   PreparedStatement psmt = null;
		   Connection conn = getMySQLConnection();
		   ResultSet rs = null;
		   
		   String sql = "select * from member where id = ?";
		   ArrayList<String> result = new ArrayList<String>();
	 	   try {
	 		   psmt = conn.prepareStatement(sql);
	 		   psmt.setString(1, id);
	 		   rs = psmt.executeQuery();

	 	   } catch( SQLException ex ) 	    {
	 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
	 	   }
			try{
				if(rs.next()) {
					result.add(rs.getInt("mno")+";"+rs.getString("mname")+";"+rs.getInt("age")+";"+rs.getString("tel")+";"+rs.getString("id")+";"+rs.getString("pw")+";"+rs.getInt("point"));
				}
			}
			catch( SQLException ex ) {       
			}
			return result;
	    }
	
	
	   public static ArrayList<String> showMember_mno(int mno) {
		   
		   PreparedStatement psmt = null;
		   Connection conn = getMySQLConnection();
		   ResultSet rs = null;
		   
		   String sql = "select * from member where mno = ?";
		   ArrayList<String> result = new ArrayList<String>();
	 	   try {
	 		   psmt = conn.prepareStatement(sql);
	 		   psmt.setInt(1, mno);
	 		   rs = psmt.executeQuery();

	 	   } catch( SQLException ex ) 	    {
	 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
	 	   }
			try{
				if(rs.next()) {
					result.add(rs.getInt("mno")+";"+rs.getString("mname")+";"+rs.getInt("age")+";"+rs.getString("tel")+";"+rs.getString("id")+";"+rs.getString("pw")+";"+rs.getInt("point"));
				}
			}
			catch( SQLException ex ) {       
			}
			return result;
	    }
	
	public static boolean select_check(String id, String pw) {
		
		int cnt = 0;
		ResultSet rs = null;
		
		Connection conn = getMySQLConnection();
		String sql = "select count(mno) as c_mno from member where id = ? and pw = password(?)";
		PreparedStatement psmt;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			if (rs.next()) {
				cnt = rs.getInt("c_mno");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (cnt > 0) return true;
		else return false;
	}
	
	public static void close(Connection conn) {
		try{
			if(conn != null)
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	public static void close(Statement stmt) {
		try{
			if(stmt != null)
				stmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	public static void close(PreparedStatement psmt) {
		try{
			if(psmt != null)
				psmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	public static void close(ResultSet rs) {
		try{
			if(rs != null)
				rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	
	
}
