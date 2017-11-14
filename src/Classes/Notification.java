package Classes;

public class Notification {
	private String postName;
	private String action;
	private String origin;
	private boolean isAnswer;
	
	public Notification(String postName, String action, String origin, boolean isAnswer) {
		super();
		this.postName = postName;
		this.action = action;
		this.origin = origin;
		this.isAnswer = isAnswer;
	}
	
	public String getMessage() {
		return "Your " + ((isAnswer)?"answer for ":"") + "post \"" + postName + "\" is " + action + " by " + origin;
	}
}
