package Database;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.xml.bind.DatatypeConverter;

import Classes.Answer;
import Classes.Post;
import Classes.User;

public class DatabaseFunction {
	private static Connection conn = null;
	private static ResultSet rs = null;
	private static PreparedStatement ps = null;
	
	public static void connect(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/YeOldeStockTrader?user=root&password=root&useSSL=false");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(){
		try{
			if (rs!=null){
				rs.close();
				rs = null;
			}
			if(conn != null){
				conn.close();
				conn = null;
			}
			if(ps != null ){
				ps = null;
			}
		}catch(SQLException sqle){
			System.out.println("connection close error");
			sqle.printStackTrace();
		}
	}
	
	public static ArrayList<Post> getPosts(String username) {
		ArrayList<Post> posts = new ArrayList<Post>();
		connect();
		try{
			ps = conn.prepareStatement("SELECT*FROM Post where userID = ?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()){	
				Post newPost = new Post(rs.getString("username"),rs.getString("stockName"), rs.getString("ticker"), 
						rs.getString("directino"), rs.getString("date"), rs.getString("time"), rs.getString("category") );
				posts.add(newPost);
			}
			rs.close();
		}catch(SQLException sqle){
			System.out.println("SQLException in function \"getPost\"");
			sqle.printStackTrace();
		}
		finally{
			close();
		}
		return posts;
	}
	
	public static ArrayList<Answer> getAnswers(String username) {
		ArrayList<Answer> answers = new ArrayList<Answer>();
		connect();
		try{
			ps = conn.prepareStatement("SELECT*FROM Answer where userID = ?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()){
				Answer newAnswer = new Answer(rs.getString("username"), rs.getString("response"), rs.getString("date"), rs.getString("time"));
				answers.add(newAnswer);
			}
			rs.close();
		}catch(SQLException sqle){
			System.out.println("SQLException in function \"getAnswers\"");
			sqle.printStackTrace();
		}
		finally{
			close();
		}
		return answers;
	}
	
	public static User getUserFromName(String username) {
		User returnUser = null;
		connect();
		try{
			ps = conn.prepareStatement("SELECT * FROM User WHERE userID =?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			if(rs.next()){
				returnUser = new User(rs.getString("userID"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("email"));
			}
			rs.close();
		}catch(SQLException sqle){
			System.out.println("SQLException in function \"getUserFromName\"");
			sqle.printStackTrace();
		}
		finally{
			close();
		}
		return returnUser;
	}
	
	public static Boolean authenticate(String username, String password) throws NoSuchAlgorithmException {
		User u = getUserFromName(username); //getting user object from username
		if(u == null) return false;
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
	    String hasedPassword = DatatypeConverter.printHexBinary(digest).toUpperCase();
	    String databaseHash = "";
	    try{
		    ps = conn.prepareStatement("SELECT  u.password From User u where userID = ?");
		    if(rs.next())
		    		databaseHash = rs.getString(password);
			rs.close();
		}
	    catch(SQLException sqle){
			System.out.println("SQLException in function \"authenticate\"");
			sqle.printStackTrace();
		}
		finally {
            close();
        }
	    return (hasedPassword.equals(databaseHash));
	}
	
	public static Boolean createAccount(String firstName, String lastName, String email, String username, String password) throws SQLException {
		User u = getUserFromName(username); //getting user object from username
		if(u == null) { //if user doesnt exist already, create an account
			ps = conn.prepareStatement("INSERT INTO User (userID, email, password, firstName, lastName) VALUES ('"+username+"', '"+email+"', '"+password+"', '"+firstName+"', '"+lastName+"') ");
			ps.executeUpdate();
			return true;
		}
		else
			return false;
	}
	
}
