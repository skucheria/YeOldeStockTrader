package Classes;

public class Answer {
	private String author;
	private String response;
	private String date;
	private String time;
	private int downVotes;
	private int upVotes;
	
	public Answer(String author, String response, String date, String time) {
		this.author = author;
		this.response = response;
		this.date = date;
		this.time = time;
		this.downVotes = 0;
		this.upVotes = 0;
	}
	
	public void upVote() {
		this.upVotes++;
	}
	
	public void downVote() {
		this.downVotes++;
	}
	
	public int getRating() {
		return (upVotes-downVotes);
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
	public int getDownVotes() {
		return downVotes;
	}

	/**
	 * @param downVotes the downVotes to set
	 */
	public void setDownVotes(int downVotes) {
		this.downVotes = downVotes;
	}

	/**
	 * @return the upVotes
	 */
	public int getUpVotes() {
		return upVotes;
	}

	/**
	 * @param upVotes the upVotes to set
	 */
	public void setUpVotes(int upVotes) {
		this.upVotes = upVotes;
	}
}
