package review.model;

public class reviews implements reviewInterface {  //model class for reviews 

	public int id;
	public String name;
	public String title;
	public String description;

	// Generating constructors for review class

	public reviews(int id, String name, String title, String description) {
		super();
		this.id = id;
		this.name = name;
		this.title = title;
		this.description = description;
	}

	public reviews(String name, String title, String description) {
		super();
		this.name = name;
		this.title = title;
		this.description = description;
	}

	// Generating getters and setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String toString() {
		return "reviews{" + "id=" + id + ", username=" + name + ", title=" + title + ", description=" + description
				+ '}';
	}

}
