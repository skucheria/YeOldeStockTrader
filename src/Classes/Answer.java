package Classes;

public class Answer {
	private User author;
	private String response;
	private String date;
	private String time;
	private int downVotes;
	private int upVotes;
	
	public User getAuthor() {
		return author;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public String getDate() {
		return date;
	}
	public String getTime() {
		return time;
	}
	public int getRating() {
		return (this.upVotes-this.downVotes);
	}
	public int getDownVotes() {
		return downVotes;
	}
	public void downVote() {
		this.downVotes++;
	}
	public int getUpVotes() {
		return upVotes;
	}
	public void upVote() {
		this.upVotes++;
	}
	
	public Answer(User author, String response, String date, String time) {
		this.author = author;
		this.response = response;
		this.date = date;
		this.time = time;
		this.downVotes = 0;
		this.upVotes = 0;
	}
	
	
}
