package travel.searchview.command;

public class SearchViewDTO {
	int hits; 
	int count;	//단순 숫자를 보여주려고 만듬
	String key; 
	String fromLatitude; 
	String fromLongitude; 
	String toLatitude; 
	String toLongitude; 
	String title; 
	String content; 
	String fileName;	
	String fromName; 
	String toName;
	String toCountryCode;
	String fromCountryCode;
	
	
	public String getToCountryCode() {
		return toCountryCode;
	}
	public void setToCountryCode(String toCountryCode) {
		this.toCountryCode = toCountryCode;
	}
	public String getFromCountryCode() {
		return fromCountryCode;
	}
	public void setFromCountryCode(String fromCountryCode) {
		this.fromCountryCode = fromCountryCode;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getFromLatitude() {
		return fromLatitude;
	}
	public void setFromLatitude(String fromLatitude) {
		this.fromLatitude = fromLatitude;
	}
	public String getFromLongitude() {
		return fromLongitude;
	}
	public void setFromLongitude(String fromLongitude) {
		this.fromLongitude = fromLongitude;
	}
	public String getToLatitude() {
		return toLatitude;
	}
	public void setToLatitude(String toLatitude) {
		this.toLatitude = toLatitude;
	}
	public String getToLongitude() {
		return toLongitude;
	}
	public void setToLongitude(String toLongitude) {
		this.toLongitude = toLongitude;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}	

}
