package model;

public class Suggestion {
	private int id;
	private String name;
	private String category;
	private String subcategory;
	private boolean recyclable;
	private String disposal;
	private String submittedBy;
	private String status;

	public Suggestion() {}

	public int getId() { return id; }
	public void setId(int id) { this.id = id; }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	public String getCategory() { return category; }
	public void setCategory(String category) { this.category = category; }

	public String getSubcategory() { return subcategory; }
	public void setSubcategory(String subcategory) { this.subcategory = subcategory; }

	public boolean isRecyclable() { return recyclable; }
	public void setRecyclable(boolean recyclable) { this.recyclable = recyclable; }

	public String getDisposal() { return disposal; }
	public void setDisposal(String disposal) { this.disposal = disposal; }

	public String getSubmittedBy() { return submittedBy; }
	public void setSubmittedBy(String submittedBy) { this.submittedBy = submittedBy; }

	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }
}
