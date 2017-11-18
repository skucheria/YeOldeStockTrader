package Classes;

public class StockList {
	
	String[] stockList = {"FB","AAPL","GE","SQ","JPM","BAC","FL","WMT","KO","TWTR"};
	Stock[] stocks = new Stock[stockList.length];
	
	public StockList() {
		int i = 0;
		for(String stock:stockList) {
			stocks[i++] = new Stock(stock);
		}
		for(Stock s:stocks)
			s.start();
	}
	
	public String[][] getTable(){
		String[][] toReturn = new String[stockList.length+2][10];
		toReturn[0] = stockList;
		toReturn[1] = stocks[0].getDates();
		int i = 2;
		for(Stock stock:stocks)
			toReturn[i++] = stock.getValues();
		return toReturn;
	}
}
