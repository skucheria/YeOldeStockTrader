package Classes;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import javax.xml.bind.DatatypeConverter;

public class User {
	private String username;
	private String firstName;
	private String lastName;
	private String email;
	//not sure how to make/if we need a data member for the profile picture
	ArrayList<Post> userPosts;
	ArrayList<Answer> userAnswers;
	
	public String getUsername() {
		return this.username;
	}
	
	public ArrayList<Post> getUserPosts(){
		return this.userPosts;
	}
	
	public ArrayList<Answer> getUserAnswers(){
		return this.userAnswers;
	}
	
	public void addUserPost(Post p) {
		this.userPosts.add(p);
	}
	
	public void addAnswer(Answer a) {
		this.userAnswers.add(a);

	}
	
	public User(String username, String firstName, String lastName, String email) {
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		userPosts = new ArrayList<Post>();
		userAnswers = new ArrayList<Answer>();
	}
	
//	public static void main(String[] args) throws NoSuchAlgorithmException {
//		String password = "password";
//		System.out.println("Original password: " + password);
//		MessageDigest md =MessageDigest.getInstance("MD5");
//		md.update(password.getBytes());
//		byte[] digest = md.digest();
//	    String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
//		System.out.println("Hashed password: " + myHash);
//	}
}
