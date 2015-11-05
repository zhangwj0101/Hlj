package JavaBean;

public class Agricultural {
	private int id;
	private String name;
	private String address;
	private String phone;
	private String description;
	private String district;
	private double x;
	private double y;
	private String link;

	public Agricultural() {
		super();
	}

	public Agricultural(int id, String name, String address, String phone,
			String description, String district, double x, double y, String link) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.description = description;
		this.district = district;
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

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
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
