package Classes;

import java.util.concurrent.TimeUnit;

public class StockList {

	String[] stockList = {"FB","AAPL","JPM","BAC","FL","WMT","KO","TWTR"};
	Stock[] stocks = new Stock[stockList.length];

	public StockList() throws InterruptedException {
		int i = 0;
		for(String stock:stockList) {
			stocks[i++] = new Stock(stock);
		}
		for(Stock s:stocks)
			s.start();
		TimeUnit.SECONDS.sleep(5);
	}

	public String[][] getTable(){
		String[][] toReturn = new String[stockList.length+1][61];
		toReturn[0] = stocks[0].getDates();
		int i = 1;
		for(Stock stock:stocks)
			toReturn[i++] = stock.getValues();
		for(int j = 1; j < i; j++)
			toReturn[j][60] = stockList[j-1];
		return toReturn;
	}
}
