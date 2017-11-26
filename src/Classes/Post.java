package Classes;

import java.sql.SQLException;
import java.util.ArrayList;

import Database.DatabaseFunction;

public class Post {
	private int postId;
	ArrayList<Answer> answers;
	private String author;
	private String stockName;
	private String ticker;
	private String direction;
	private String date;
	private String time;
	private String category;
	
	/*
	 * 
	 */
	public Post(String author, String stockName, String ticker, String direction, String date, String time,
			String category, int postID) {
		this.author = author;
		this.stockName = stockName;
		this.ticker = ticker;
		this.direction = direction;
		this.date = date;
		this.time = time;
		this.category = category;
		answers = new ArrayList<Answer>();
		this.postId = postID;
	}

	/**
	 * @return the postId
	 */
	public int getPostId() {
		return postId;
	}

	/**
	 * @param postId the postId to set
	 */
	public void setPostId(int postId) {
		this.postId = postId;
	}

	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}

	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}

	/**
	 * @return the stockName
	 */
	public String getStockName() {
		return stockName;
	}

	/**
	 * @param stockName the stockName to set
	 */
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}

	/**
	 * @return the ticker
	 */
	public String getTicker() {
		return ticker;
	}

	/**
	 * @param ticker the ticker to set
	 */
	public void setTicker(String ticker) {
		this.ticker = ticker;
	}

	/**
	 * @return the direction
	 */
	public String getDirection() {
		return direction;
	}

	/**
	 * @param direction the direction to set
	 */
	public void setDirection(String direction) {
		this.direction = direction;
	}

	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}

	/**
	 * @return the time
	 */
	public String getTime() {
		return time;
	}

	/**
	 * @param time the time to set
	 */
	public void setTime(String time) {
		this.time = time;
	}

	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}

	/**
	 * @param category the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}

	/**
	 * @return the answers
	 */
	public ArrayList<Answer> getAnswers() throws SQLException {
		return DatabaseFunction.getAnswersForPost(this.postId);
	}

	/**
	 * @param answers the answers to set
	 */
	public void setAnswers(ArrayList<Answer> answers) {
		this.answers = answers;
	}
	
	

}
