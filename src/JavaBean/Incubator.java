package JavaBean;

public class Incubator {
	private int id;
	private String district;
	private String projectname;
	private String orgname;
	private String connecter;
	private String phone;
	private String name;
	private String description;
	private double x;
	private double y;
	private String link;

	public Incubator() {
		super();
	}

	public Incubator(int id, String district, String projectname,
			String orgname, String connecter, String phone, String name,
			String description, double x, double y, String link) {
		super();
		this.id = id;
		this.district = district;
		this.projectname = projectname;
		this.orgname = orgname;
		this.connecter = connecter;
		this.phone = phone;
		this.name = name;
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

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public String getConnecter() {
		return connecter;
	}

	public void setConnecter(String connecter) {
		this.connecter = connecter;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
