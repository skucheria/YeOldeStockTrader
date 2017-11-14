package Database;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import javax.xml.bind.DatatypeConverter;
import Classes.Answer;
import Classes.Post;
import Classes.User;
import Comparators.TopAnswerComparator;
import Comparators.TopPostComparator;

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
	
	public static void Test() throws SQLException {
		connect();
		ps = conn.prepareStatement("INSERT INTO User(userID, email, password, firstName, lastName) Values (\"test\", \"email\", \"sidisbest\", \"siddhath\", \"kucheria\")");
		ps.execute();
	}
	
	/*
	 * Returning a list of all posts in the database for specific user
	 */
	public static ArrayList<Post> getPosts(String username) {
		ArrayList<Post> posts = new ArrayList<Post>();
		connect();
		try{
			ps = conn.prepareStatement("SELECT*FROM Post where userID = ?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()){	
				Post newPost = new Post(rs.getString("userID"),rs.getString("stockName"), rs.getString("ticker"), 
						rs.getString("direction"), rs.getString("date"), rs.getString("time"), rs.getString("category"), rs.getInt("postID"));
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
	
	/*
	 * Returning a list of all answers in the database made by a specific user 
	 */
	public static ArrayList<Answer> getAnswers(String username) {
		ArrayList<Answer> answers = new ArrayList<Answer>();
		connect();
		try{
			ps = conn.prepareStatement("SELECT*FROM Answer where userID = ?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()){
				Answer newAnswer = new Answer(rs.getString("userID"), rs.getString("response"), rs.getString("date"), rs.getString("time"), rs.getInt("postID"), rs.getInt("answerID"));
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
	
	/*
	 * Returning a User object for a specfic username. Will be null is not in the database
	 */
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
	
	/*
	 * Authenticate login info by checking username and password 
	 */
	public static Boolean authenticate(String username, String password) throws NoSuchAlgorithmException {
		connect();
		User u = getUserFromName(username); 
		if(u == null) return false;
		connect(); //have to reconnect because getUserFromName closes the connection
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
	    String hashedPassword = DatatypeConverter.printHexBinary(digest).toUpperCase();
	    String databaseHash = "";
	    try{
		    ps = conn.prepareStatement("SELECT*FROM User WHERE userID = ?");
			ps.setString(1, username);
			rs = ps.executeQuery();
		    if(rs.next()) {
		    		databaseHash = rs.getString("password");
	    			rs.close();
		    }
		}
	    catch(SQLException sqle){
			System.out.println("SQLException in function \"authenticate\"");
			sqle.printStackTrace();
		}
		finally {
            close();
        }
		return (hashedPassword.equals(databaseHash));
	}
	
	/*
	 * Create an account using all provided fields. If username already exists, return false and have user enter another username
	 */
	public static Boolean createAccount(String firstName, String lastName, String email, String username, String password) throws SQLException, NoSuchAlgorithmException {
		connect();
		User u = getUserFromName(username); //getting user object from username
		connect();
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
	    String hashedPassword = DatatypeConverter.printHexBinary(digest).toUpperCase();
		if(u == null) { //if user doesnt exist already, create an account
			ps = conn.prepareStatement("INSERT INTO User (userID, email, password, firstName, lastName) VALUES ('"+username+"', '"+email+"', '"+hashedPassword+"', '"+firstName+"', '"+lastName+"') ");
			ps.execute();
			close();
			return true;
		}
		else {
			close();
			return false;
		}
	}
	
	/*
	 * Updating password for username 
	 */
	public static void updatePassword(String password, String username) throws SQLException, NoSuchAlgorithmException {
		connect();
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
	    String hashedPassword = DatatypeConverter.printHexBinary(digest).toUpperCase();
		ps = conn.prepareStatement("UPDATE User SET password = ?" + "WHERE userID = ?");
		ps.setString(1, hashedPassword);
		ps.setString(2, username);
		ps.execute();
	}
	
	/*
	 * Creating a post and storing it in database 
	 */
	public static void createPost(String author, String stockName, String ticker, String direction, String date, String time, String category) throws SQLException {
		connect();
		ps = conn.prepareStatement("INSERT INTO Post (stockName, direction, ticker, date, time, userID, category)"
				+ " VALUES ('"+stockName+"', '"+direction+"', '"+ticker+"', '"+date+"', '"+time+"', '"+author+"', '"+category+"') ");
		ps.execute();
		close();
	}
	
	/*
	 * Creating an answer and storing it in database 
	 */
	public static void createAnswer(String author, int postID, String response, String date, String time) throws SQLException {
		connect();
		ps = conn.prepareStatement("INSERT INTO Answer (response, date, time, postID, userID)"
				+ " VALUES ('"+response+"', '"+date+"', '"+time+"', '"+postID+"', '"+author+"') ");
		ps.execute();
		close();
	}
	
	/*
	 * Returning all answers for a specific post number
	 */
	public static ArrayList<Answer> getAnswersForPost(int postID) throws SQLException{
		ArrayList<Answer> answers = new ArrayList<Answer>();
		connect();
		ps = conn.prepareStatement("SELECT*FROM Answer where postID = ?");
		ps.setInt(1, postID);
		rs = ps.executeQuery();
		while(rs.next()){	
			Answer newAnswer = new Answer(rs.getString("userID"), rs.getString("response"), rs.getString("date"), rs.getString("time"), rs.getInt("postID"), rs.getInt("answerID"));
			answers.add(newAnswer);
		}
	    Collections.sort(answers, new TopAnswerComparator());
	    Collections.reverse(answers);
		close();
		return answers;
	}
	
	public static User getAuthorOfPost(int postID) throws SQLException {
		String name = " ";
		connect();
		ps = conn.prepareStatement("SELECT * FROM Post where postID = ?");
		ps.setInt(1, postID);
		rs = ps.executeQuery();
		if(rs.next()) {
			name = rs.getString("userID");
		}
		User u  = getUserFromName(name);
		close();
		return u;
	}
	
	/*
	 * Returning all posts sorted from most to least popular (by #answers and how recent)
	 */
	public static ArrayList<Post> getTopPosts() throws SQLException{
		ArrayList<Post> posts = new ArrayList<Post>();
		connect();
		ps = conn.prepareStatement("SELECT*FROM Post");
		rs = ps.executeQuery();
		while(rs.next()){	
			Post newPost = new Post(rs.getString("userID"),rs.getString("stockName"), rs.getString("ticker"), 
					rs.getString("direction"), rs.getString("date"), rs.getString("time"), rs.getString("category"), rs.getInt("postID") );
			posts.add(newPost);
		}
		rs.close();
	    Collections.sort(posts, new TopPostComparator());
	    Collections.reverse(posts);
	    close();
		return posts;
	}
	
	public static Answer getTopAnswer(int postID) throws SQLException {
		ArrayList<Answer> answers = getAnswersForPost(postID);
		System.out.println("Size of answers " + answers.size());
		if(answers!=null) {
			return answers.get(0);
		}
		return null;
		
	}
	
	/*
	 * Upvotes an answer
	 */
	public static void upVote(int answerID, String userID) throws SQLException{
		connect();
		ps = conn.prepareStatement("SELECT*FROM Answer_Rating where answerID = ?" + " and userID = ?");
		ps.setInt(1, answerID);
		ps.setString(2, userID);
		rs = ps.executeQuery();
		if(rs.next()) { //they have previously rated
			 ps = conn.prepareStatement("UPDATE Answer_Rating set upvote = 1, downvote = 0 where answerID = ?" + " and userID = ?");
			 ps.setInt(1, answerID);
			 ps.setString(2, userID);
			 ps.execute();
		}
		else {
			ps = conn.prepareStatement("insert into Answer_Rating(upvote, downvote, userID, answerID) values (1, 0, '"+userID+"', '"+answerID+"')");
			ps.execute();
		}
		close();
	}
	
	/*
	 * Downvotes an answer
	 */
	public static void downVote(int answerID, String userID) throws SQLException {
		connect();
		ps = conn.prepareStatement("SELECT*FROM Answer_Rating where answerID = ?" + " and userID = ?");
		ps.setInt(1, answerID);
		ps.setString(2, userID);
		rs = ps.executeQuery();
		if(rs.next()) { //they have previously rated
			 ps = conn.prepareStatement("UPDATE Answer_Rating set upvote = 0, downvote = 1 where answerID = ?" + " and userID = ?");
			 ps.setInt(1, answerID);
			 ps.setString(2, userID);
			 ps.execute();
		}
		else {
			ps = conn.prepareStatement("insert into Answer_Rating(upvote, downvote, userID, answerID) values (0, 1, '"+userID+"', '"+answerID+"')");
			ps.execute();
		}
		close();
	}
	
	/*
	 * Returns the rating for specific answer
	 */
	public static int getAnswerRating(int answerID) throws SQLException {
		Boolean hasAnswer = false;
		ArrayList<Integer> upvotes = new ArrayList<Integer>();
		ArrayList<Integer> downvotes = new ArrayList<Integer>();
		connect();
		ps = conn.prepareStatement("SELECT*FROM Answer_Rating where answerID = ?");
		ps.setInt(1, answerID);
		rs = ps.executeQuery();
		if(rs.next()) { //there exists a rating for this answerID
			hasAnswer = true;
		}
		if(hasAnswer) {
			rs = ps.executeQuery();
			while(rs.next()) {
				if(rs.getInt("upvote") == 1) 
					upvotes.add(rs.getInt("upvote"));
				else
					downvotes.add(rs.getInt("downvote"));
			}
			close();
			return (upvotes.size()-downvotes.size());
		}
		else {
			close();
			return 0;
		}
	}
	
}
