package Classes;

import java.sql.SQLException;
import java.util.ArrayList;

import Database.DatabaseFunction;

public class User {
	private String username;
	private String firstName;
	private String lastName;
	private String email;
	private String profileUrl;
	//not sure how to make/if we need a data member for the profile picture
	
	ArrayList<Integer> bookmarks;
	private ArrayList<Notification> notifications;
	private ArrayList<Post> userPosts;
	private ArrayList<Answer> userAnswers;
	
	public User(String username, String firstName, String lastName, String email, String profileUrl) {
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.profileUrl = profileUrl;
		userPosts = new ArrayList<Post>();
		userAnswers = new ArrayList<Answer>();
		bookmarks = new ArrayList<Integer>();
	}
	
	public String getProf() {
		return this.profileUrl;
	}
	
	public void addUserPost(Post p) {
		this.userPosts.add(p);
	}
	
	public void addAnswer(Answer a) {
		this.userAnswers.add(a);
	}
	
	public void addNotification(Notification toAdd) {
		notifications.add(toAdd);
	}
	
	public int numberNotifications() {
		return notifications.size();
	}
	
	public void notificationsSeen() {
		notifications.clear();
	}
	
	public ArrayList<Integer> getBookmarks() throws SQLException{
		return DatabaseFunction.getBookmarks(this.username);
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the userPosts
	 */
	public ArrayList<Post> getUserPosts() {
		return DatabaseFunction.getPosts(this.username);
	}

	/**
	 * @param userPosts the userPosts to set
	 */
	public void setUserPosts(ArrayList<Post> userPosts) {
		this.userPosts = userPosts;
	}

	/**
	 * @return the userAnswers
	 */
	public ArrayList<Answer> getUserAnswers() {
		return DatabaseFunction.getAnswers(this.username);
	}

	/**
	 * @param userAnswers the userAnswers to set
	 */
	public void setUserAnswers(ArrayList<Answer> userAnswers) {
		this.userAnswers = userAnswers;
	}

	/**
	 * @return the notifications
	 */
	public ArrayList<Notification> getNotifications(){
		return notifications;
	}

	
}
