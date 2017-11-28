package Classes;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Stock extends Thread{

	String stockName;
	private URL url;
	private String[] dates = new String[60];
	private String[] values = new String[61];

	public Stock(String stockName) {
		this.stockName = stockName;
		String urlLink = "https://www.quandl.com/api/v3/datasets/WIKI/" + stockName + "/data.csv?limit=10&collapse=daily&column_index=4&api_key=3Qj2kvyibg-RE-SCceZj";
		try {
			url = new URL(urlLink);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * Returns dates
	 */
	public String[] getDates() {
		return dates;
	}
	
	/*
	 * Returns values
	 */
	public String[] getValues() {
		return values;
	}

	/* (non-Javadoc)
	 * @see java.lang.Thread#run()
	 */
	@Override
	public void run() {
		int retryCount = 0;
		while(true) {
			try (BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"))) {
				reader.readLine();
				int i = 0;
				for (String line; (line = reader.readLine()) != null;) {
					Pattern p = Pattern.compile("([^,]+),(.+)\n");
					Matcher m = p.matcher(line);
					dates[i] = m.group(1);
					values[i++] = m.group(2);
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				if(retryCount < 5) {
					retryCount++;
					continue;
				}
			}
			
			try{
				Thread.sleep(1000*60*60);
			}catch (InterruptedException e) {
				e.printStackTrace();
			}
			retryCount = 0;
		}
	}

}
