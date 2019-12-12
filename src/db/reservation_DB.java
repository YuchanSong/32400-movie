package db;
  
import java.sql.*;
import java.util.ArrayList;
import java.util.*;

public class reservation_DB {

	static  Connection con         = null;
    static  Statement stmt         = null;
    static  Statement stmt2         = null;
    static  ResultSet rs           = null;
    static  ResultSet rs2		   = null;
    
    static String driver= "org.gjt.mm.mysql.Driver";
    static String URL = "jdbc:mysql://localhost:3306/cgv";

    public static void loadConnect()  {
 	   		try {
		   		// 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈솧占쎈뮉占쎈솇占쎌굲.
 		   		if( stmt != null ) stmt.close();
 		   		if( con != null ) con.close();
	   		} catch (SQLException ex ) {};  
	   	             
    		    // 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲�댖�떣�쐻�뜝占� 占쎈쐻占쎈뼢占쎈쿈占쎌굲
    		 try {
     	         Class.forName(driver);
    	 
    	 	} catch ( java.lang.ClassNotFoundException e ) {
    	         System.err.println("** Driver loaderror in loadConnect: " + e.getMessage() );
    	         e.printStackTrace();
    	         
    		}
    		
    	 	try {
    	         
    	         // 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣繹먮씮�굲
    	         con  = DriverManager.getConnection(URL, "root", "onlyroot");
    	         
    	         System.out.println("\n"+URL+"占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占�");
  					
    					 
    		} catch( SQLException ex ) 
    		{
    	        
    	         System.err.println("** connection error in loadConnect: " + ex.getMessage() );
    	         ex.printStackTrace();
    	 	}	   
    	     
    }
    
   public static void disconnect()  {
	   try {
		   	// 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈솧占쎈뮉占쎈솇占쎌굲.
		   if( stmt != null ) stmt.close();
		   if( con != null ) con.close();
	   	} catch (SQLException ex ) {};    
   }
   
   public static ArrayList<String> selectTimeTable(){

	   String sql = "select tno, mn, ano, od, ot from movie, timetable where timetable.mnum = movie.mnum";
	   ArrayList<String> result = new ArrayList<String>();
	   int x = 0;
	   
 	   try {
 		   // Statement 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
 		   stmt = con.createStatement();
 		   rs = stmt.executeQuery(sql);

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
 	   }
 	   
 	  System.out.println("占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲占쎌깈	占쎈쐻占쎈짗占쎌굲占쎌넅占쎈쐻占쎈짗占쎌굲占쎌깈	占쎈쐻占쎈짗占쎌굲占쎌넅占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲	占쎈쐻占쎈＋占쎌겫�ⓦ끉�굲	占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈뼣占쎈짗占쎌굲");
 	  
		try{
			while(rs.next()) {
				result.add(rs.getString("tno")+";"+rs.getString("mn")+";"+rs.getString("ano")+";"+rs.getString("od")+" "+rs.getString("ot"));
				System.out.println(result.get(x));
				x++;
			}
		}
		catch( SQLException ex ) {       
		}
		
		return result;
    }
   
   public static ArrayList<String> showTimeTable(String tno){

	   String sql = "select tno, mn, ano, od, ot from movie, timetable where timetable.mnum = movie.mnum AND timetable.tno = "+tno+";";
	   ArrayList<String> result = new ArrayList<String>();
	   int x = 0;
	   
 	   try {
 		   // Statement 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
 		   stmt = con.createStatement();
 		   rs = stmt.executeQuery(sql);

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
 	   }
 	  
		try{
			while(rs.next()) {
				result.add(rs.getString("tno")+";"+rs.getString("mn")+";"+rs.getString("ano")+";"+rs.getString("od")+" "+rs.getString("ot"));
				System.out.println(result.get(x));
				x++;
			}
		}
		catch( SQLException ex ) {       
		}
		
		return result;
    }
   
   public static ArrayList<String> showReservationList(int mno){

	   String sql = "select reservation.rno, movie.mn, timetable.ano, timetable.od, timetable.ot, seat.line, seat.row, reservation.op, reservation.rdate from movie, timetable, seat, reservation where reservation.mno = "+mno+" and reservation.sno = seat.sno and seat.tno = timetable.tno and timetable.mnum = movie.mnum";
	   ArrayList<String> result = new ArrayList<String>();
	   
 	   try {
 		   // Statement 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
 		   stmt = con.createStatement();
 		   rs = stmt.executeQuery(sql);

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
 	   }
 	  
		try{
			while(rs.next()) {
				result.add(rs.getString("reservation.rno")+";"+rs.getString("movie.mn")+";"+rs.getString("timetable.ano")+";"+rs.getString("timetable.od")+" "+rs.getString("timetable.ot")+";"+rs.getString("seat.line")+";"+rs.getString("seat.row")+";"+rs.getString("reservation.op")+";"+rs.getString("reservation.rdate"));
			}
		}
		catch( SQLException ex ) {       
		}
		
		return result;
    }
   
   public static ArrayList<String> showTicket(String rno){

	   String sql = "select reservation.rno, movie.mn, timetable.ano, timetable.od, timetable.ot, seat.line, seat.row, reservation.op, reservation.rdate from movie, timetable, seat, reservation where reservation.rno = "+rno+" and reservation.sno = seat.sno and seat.tno = timetable.tno and timetable.mnum = movie.mnum";
	   ArrayList<String> result = new ArrayList<String>();
	   
 	   try {
 		   // Statement 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
 		   stmt = con.createStatement();
 		   rs = stmt.executeQuery(sql);

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
 	   }
 	  
		try{
			while(rs.next()) {
				result.add(rs.getString("reservation.rno")+";"+rs.getString("movie.mn")+";"+rs.getString("timetable.ano")+";"+rs.getString("timetable.od")+" "+rs.getString("timetable.ot")+";"+rs.getString("seat.line")+";"+rs.getString("seat.row")+";"+rs.getString("reservation.op")+";"+rs.getString("reservation.rdate"));
			}
		}
		catch( SQLException ex ) {       
		}
		
		return result;
    }
   
   public static ArrayList<String> showSeat(String tno){

	   String sql = "select line, row from seat where tno ="+tno+";";
	   ArrayList<String> result = new ArrayList<String>();
	   int x = 0;
	   
 	   try {
 		   // Statement 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
 		   stmt = con.createStatement();
 		   rs = stmt.executeQuery(sql);

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
 	   }
 	  
		try{
			while(rs.next()) {
				result.add(rs.getString("line")+";"+rs.getString("row")+";");
				System.out.println(result.get(x));
				x++;
			}
		}
		catch( SQLException ex ) {       
		}
		return result;
    }
   
   public static String movieTitle(String tno){
	   String sql = " select movie.mn from movie, timetable where timetable.tno ="+tno+" and movie.mnum = timetable.mnum;";
	   String mn = "";
 	   try {
 		   // Statement 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
 		   stmt = con.createStatement();
 		   rs = stmt.executeQuery(sql);

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
 	   }
 	  
		try{
			while(rs.next()) {
				mn = rs.getString("mn");
			}
		}
		catch( SQLException ex ) {       
		}
	   
	return mn;
   }
   
   public static String ano(String tno){
	   String sql = "select ano from timetable where tno ="+tno;
	   String ano = "";
 	   try {
 		   // Statement 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
 		   stmt = con.createStatement();
 		   rs = stmt.executeQuery(sql);

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
 	   }
 	  
		try{
			while(rs.next()) {
				ano = rs.getString("ano");
			}
		}
		catch( SQLException ex ) {       
		}
	   
	return ano;
   }
   
   public static String snoLast() {
	   String sql = "select max(sno) as s from seat;";
	   String sno = "";
 	   try {
 		   // Statement 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
 		   stmt = con.createStatement();
 		   rs = stmt.executeQuery(sql);

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
 	   }
 	  
		try{
			while(rs.next()) {
				sno = rs.getString("s");
			}
		}
		catch( SQLException ex ) {       
		}
	   
	return sno;
   }
   
   public static int point(int mno){
	   String sql = "select point from member where mno ="+mno;
	   int pt = 0;
 	   try {
 		   // Statement 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 
 		   stmt = con.createStatement();
 		   rs = stmt.executeQuery(sql);

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
 	   }
 	  
		try{
			while(rs.next()) {
				pt = rs.getInt("point");
			}
		}
		catch( SQLException ex ) {       
		}
	   
	return pt;
   }
   
   public static int seatInsert(String tno, int mno, String l, String r) {
	   int cnt = 0;
		try {
			// SQL �뜝�룞�삕�뜝�떎諭꾩삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕�뜝�떬�뙋�삕.
			cnt = stmt.executeUpdate("insert into seat(tno,mno,line,row) "+
					"values(\""+tno+"\",\""+mno+"\",\""+l+"\",\""+r+"\");");

		} catch( SQLException ex ) 
		{              
			System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
		}
		return cnt;
   }
   
   public static int reservationInsert(int mno, String rdate, String op, String mn, String sno) {
	   int cnt = 0;
		try {
			// SQL �뜝�룞�삕�뜝�떎諭꾩삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕�뜝�떬�뙋�삕.
			cnt = stmt.executeUpdate("insert into reservation(mno, rdate, op, mn, sno) "+
					"values(\""+mno+"\",\""+rdate+"\",\""+op+"\",\""+mn+"\",\""+sno+"\");");

		} catch( SQLException ex ) 
		{              
			System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
		}
		return cnt;
   }
   
   public static int pointUpdate(int mno) {
	   int cnt = 0;
		try {
			// SQL �뜝�룞�삕�뜝�떎諭꾩삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕�뜝�떬�뙋�삕.
			cnt = stmt.executeUpdate("update member set point = point - 11000 where mno="+mno+" and point >= 11000");
		} catch( SQLException ex ) 
		{              
			System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
		}
		return cnt;
   }
   public static int pointUpdate2(int mno) {
	   int cnt = 0;
		try {
			// SQL �뜝�룞�삕�뜝�떎諭꾩삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕�뜝�떬�뙋�삕.
			cnt = stmt.executeUpdate("update member set point = point + 1100 where mno="+mno);
		} catch( SQLException ex ) 
		{              
			System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
		}
		return cnt;
   }
   public static int pointUpdate3(int mno) {
	   int cnt = 0;
		try {
			// SQL �뜝�룞�삕�뜝�떎諭꾩삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕�뜝�떬�뙋�삕.
			cnt = stmt.executeUpdate("update member set point = point + 11000 where mno="+mno);
		} catch( SQLException ex ) 
		{              
			System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
		}
		return cnt;
   }
   
   public static int deleteReservation(String rno) {
	   int cnt = 0;
		try {
			// SQL �뜝�룞�삕�뜝�떎諭꾩삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦怨ㅼ삕 �뜝�룞�삕�뜝�룞�삕�뜝�떬�뙋�삕.
			cnt = stmt.executeUpdate("delete r, s from reservation r join seat as s on r.sno = s.sno where r.rno ="+rno);
		} catch( SQLException ex ) 
		{              
			System.err.println("  !! <JDBC Error > SQL�뜝�룞�삕 exec �뜝�룞�삕�뜝�룞�삕: " + ex.getMessage() );
		}
		return cnt;
   }
   
}

