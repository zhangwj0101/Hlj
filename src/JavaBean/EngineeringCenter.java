package JavaBean;

public class EngineeringCenter {
	private int id;
	private String name;
	private String orgname;
	private String category;
	private double x;
	private double y;
	private String link;

	public EngineeringCenter() {
		super();
	}

	public EngineeringCenter(int id, String name, String orgname,
			String category, double x, double y, String link) {
		super();
		this.id = id;
		this.name = name;
		this.orgname = orgname;
		this.category = category;
		this.x = x;
		this.y = y;
		this.link = link;
	}

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

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getX() {
		return x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
		this.y = y;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

}
