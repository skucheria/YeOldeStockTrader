package Comparators;

import java.sql.SQLException;
import java.util.Comparator;

import Classes.*;

public class TopAnswerComparator implements Comparator<Answer> {
	@Override
	public int compare(Answer a1, Answer a2) {
		int s1 = -10;
		int s2 = -10;
		try {
			s1 = ((Integer)a1.getRating());
			s2 = ((Integer)a2.getRating());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return  (Integer.valueOf(s1)).compareTo(Integer.valueOf(s2));
	}
}
