package Classes;

import java.util.ArrayList;

public class Post {
	public int postId;
	private User author;
	private String stockName;
	private String ticker;
	private String direction;
	private String date;
	private String time;
	private String category;
	ArrayList<Answer> answers;
	
	public User getAuthor() {
		return author;
	}
	public void setAuthor(User author) {
		this.author = author;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public String getTicker() {
		return ticker;
	}
	public void setTicker(String ticker) {
		this.ticker = ticker;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public ArrayList<Answer> getAnswers() {
		return answers;
	}
	public void setAnswers(ArrayList<Answer> answers) {
		this.answers = answers;
	}
	public Post(User author, String stockName, String ticker, String direction, String date, String time,
			String category) {
		this.author = author;
		this.stockName = stockName;
		this.ticker = ticker;
		this.direction = direction;
		this.date = date;
		this.time = time;
		this.category = category;
		answers = new ArrayList<Answer>();
	}
	
	

}
