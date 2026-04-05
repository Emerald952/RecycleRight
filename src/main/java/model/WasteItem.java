package model;

public class WasteItem{
	private int id;
	private String name;
	private String category;
	private String subcategory;
	private boolean recyclable;
	private String disposal;
	
	public WasteItem() {}
	
	public int getId() {return id; }
	public void setId(int id) {this.id = id;}
	
	public String getName() {return name; }
	public void setName(String name) {this.name = name;}
	
	public String getCategory() {return category; }
	public void setCategory(String category) {this.category = category;}
	
	public String getSubcategory() {return subcategory; }
	public void setSubcategory(String subcategory) {this.subcategory = subcategory;}
	
	public boolean isRecyclable() {return recyclable; }
	public void setRecyclable(boolean recyclable) {this.recyclable = recyclable;}
	
	public String getDisposal() {return disposal; }
	public void setDisposal(String disposal) {this.disposal = disposal;}
}
