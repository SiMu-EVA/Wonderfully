package Bean;

public class UesrBean {
	private int id;
	private String name;
	private String sex;
	private String phone;
	private String mail;
	private String address;
	private String password;
	
	
	public void setUser(int id,String name,String sex,String phone,String mail,String address,String password) {
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.phone = phone;
		this.mail = mail;
		this.address = address;
		this.password = password;
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


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


}
