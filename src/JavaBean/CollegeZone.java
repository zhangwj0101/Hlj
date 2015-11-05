package JavaBean;

public class CollegeZone {
	private int id;
	private String name;
	private String address;
	private String level;
	private String phone;
	private String description;
	private double x;
	private double y;
	private String link;

	public CollegeZone() {
		super();
	}

	public CollegeZone(int id, String name, String address, String level,
			String phone, String description, double x, double y, String link) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.level = level;
		this.phone = phone;
		this.description = description;
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

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
