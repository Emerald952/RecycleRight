package model;


public class DisposalPoint{
	private String name;
	private String address;
	private double latitude;
	private double longitude;
	private String contact;
	private String web_url;
	private String category;
	
	public DisposalPoint(String name, String address, double latitude, double longitude, String contact, String web_url, String category) {
		this.name = name;
		this.address = address;
		this.latitude = latitude;
		this.longitude = longitude;
		this.contact = contact;
		this.web_url = web_url;
		this.category = category;
	} 
	
	public String getName() {return name;}
	public String getAddress() {return address;}
	public double getLatitude() {return latitude;}
	public double getLongitude() {return longitude;}
	public String getContact() {return contact;}
	public String getWebURL() {return web_url;}
	public String getCategory() {return category;}
}