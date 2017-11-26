package Classes;

import java.sql.SQLException;

import Database.DatabaseFunction;

public class Answer {
	
	private String author;
	private String response;
	private String date;
	private String time;
	private int postID;
	private int rating;
	private int answerID;
	
	/*
	 * Creates new Answer object and assigns all local variables
	 */
	public Answer(String author, String response, String date, String time, int postID, int answerID) {
		this.author = author;
		this.response = response;
		this.date = date;
		this.time = time;
		this.postID = postID;
		this.answerID = answerID;
	}
	

	/*
	 * @return rating of the answer from the database
	 * @throws SQLException if the answer doesn't have a rating or the command is broken
	 */
	public int getRating() throws SQLException {
		return DatabaseFunction.getAnswerRating(this.answerID);
	}

	/*
	 * @return ID of the answer
	 */
	public int getAnswerID() {
		return this.answerID;
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
	 * @return the response
	 */
	public String getResponse() {
		return response;
	}

	/**
	 * @param response the response to set
	 */
	public void setResponse(String response) {
		this.response = response;
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
	 * @return the downVotes
	 */
	public int getPostID() {
		return postID;
	}
}
