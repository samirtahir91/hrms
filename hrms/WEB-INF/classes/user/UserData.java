package user;

public class UserData {

    String username;
    String password;
	 String emp_id;
    
    public void setUsername( String value )
    {
        username = value;
    }

    public void setPassword( String value )
    {
        password = value;
    }
	 
	  public void setEmp_id( String value )
    {
        emp_id = value;
    }


    public String getUsername() { return username; }

    public String getPassword() { return password; }
	 
	 public String getEmp_id() { return emp_id; }

}