package Comparators;

import java.sql.SQLException;
import java.util.Comparator;

import Classes.*;

public class TopAnswerComparator implements Comparator<Answer> {
	@Override
	public int compare(Answer a1, Answer a2) {
		return ((Integer)a1.getRating()).compareTo((Integer)a2.getRating());
	}
}
