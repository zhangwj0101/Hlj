package JavaBean;

public class ResearchOrg {
	private int id;
	private String name;
	private String address;
	private double x;
	private double y;
	private String link;

	public ResearchOrg() {
		super();
	}

	public ResearchOrg(int id, String name, String address, double x, double y,
			String link) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
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
