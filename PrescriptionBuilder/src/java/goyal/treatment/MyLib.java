package goyal.treatment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MyLib {
        public String getDatabaseName()
	{
		return "prescription";
	}
	public String getPassword()
	{
		return "";
	}
	public String getUserName()
	{
		return "root";
	}
	public String getDriver()
	{
		return "com.mysql.jdbc.Driver";
	}
	public String getConnectionString()
	{
		return "jdbc:mysql://localhost:3306/"+getDatabaseName();
	}
    public Connection getConnection()
    {
        Connection cn=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        
            //Create connection
            String path="jdbc:mysql://localhost:3306/prescription";
            String dbuser="root";
            String dbpass="";
            cn=DriverManager.getConnection(path, dbuser, dbpass);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return cn;
    }
    public ArrayList<String> getMedicines()
    {
        ArrayList<String> lst=new ArrayList<String>();
        try
        {
            Connection cn=getConnection();
            String s1="select medicine FROM medicine_data";
            PreparedStatement p1=cn.prepareStatement(s1);
            ResultSet r1=p1.executeQuery();
            while(r1.next())
            {
                String str=r1.getString("medicine");
                lst.add(str);
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return lst;
    }
    public String getDescription(int pid)
    {
        String str="NA";
        try
        {
            Connection cn=getConnection();
            String s1="select description FROM patient_description where patient_id=?";
            PreparedStatement p1=cn.prepareStatement(s1);
            p1.setInt(1, pid);
            ResultSet r1=p1.executeQuery();
            while(r1.next())
            {
                str=r1.getString("description");
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return str;
    }
    public ResultSet fetchData(String sql)
	{
		ResultSet rs=null;
		try
		{
                        Class.forName(getDriver()).newInstance();
			Connection cn=DriverManager.getConnection(getConnectionString(),getUserName(),getPassword());
			PreparedStatement pst=cn.prepareStatement(sql);
			rs=pst.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return rs;
	}
    public String getPhoto(String pid)
        {
            String photo="no";
            try
            {
                String sql="select photo from report_photos where patient_id='"+pid+"'";
                ResultSet r1=fetchData(sql);
                if(r1.next())
                {
                    photo=r1.getString("photo");
                }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
            System.out.println(photo);
            return photo;
        }
}
