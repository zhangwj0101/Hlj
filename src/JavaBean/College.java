package JavaBean;

public class College {
	private int id;
	private String name;
	private String district;
	private double x;
	private double y;
	private String link;
	private String level;

	public College() {
		super();
	}

	public College(int id, String name, String district, double x, double y,
			String link, String level) {
		super();
		this.id = id;
		this.name = name;
		this.district = district;
		this.x = x;
		this.y = y;
		this.link = link;
		this.level = level;
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

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

}
