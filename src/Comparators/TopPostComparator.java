package Comparators;

import java.sql.SQLException;
import java.util.Comparator;

import Classes.Post;

public class TopPostComparator implements Comparator<Post> { //sorting final project due dates
	@Override
	public int compare(Post p1, Post p2) {
		String s1 = "";
		String s2 = "";
		try {
			s1 = ((Integer)p1.getAnswers().size()).toString();
			s2 = ((Integer)p2.getAnswers().size()).toString();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (Integer.valueOf(s1).compareTo(Integer.valueOf(s2)));
	}
}
