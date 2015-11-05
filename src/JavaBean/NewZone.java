package JavaBean;

public class NewZone {
	private int id;
	private String name;
	private String level;
	private String address;
	private String description;
	private double x;
	private double y;

	public NewZone() {
		super();
	}

	public NewZone(int id, String name, String level, String address,
			String description, double x, double y) {
		super();
		this.id = id;
		this.name = name;
		this.level = level;
		this.address = address;
		this.description = description;
		this.x = x;
		this.y = y;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

}
