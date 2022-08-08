<%@page import="java.sql.*" %>
<%
    String email,password;
    email=request.getParameter("T1");
    password=request.getParameter("T2");
    if(email==null || password==null)
    {
        response.sendRedirect("Login.jsp");
    }
    else
    {
        //Load jdbc mysql driver
        Class.forName("com.mysql.jdbc.Driver");
        String path="jdbc:mysql://localhost:3306/prescription";
        String dbuser="root";
        String dbpass="";
        
        //Create connection
        Connection cn=DriverManager.getConnection(path, dbuser, dbpass);

        //Create sql
        String s1="select * from login_data where username=? AND password=?";

        //Create dynamic statement
        PreparedStatement p1=cn.prepareStatement(s1);
        p1.setString(1, email);
        p1.setString(2, password);

        //Execute statement
        ResultSet r1=p1.executeQuery();

        //Fetch row one by one
        if(r1.next())
        {
            //Fetch usertype 
            String ut=r1.getString("usertype");
            
            //create session
            session=request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("usertype", ut);
            
            //send to page
            if(ut.equalsIgnoreCase("doctor"))
            {
                response.sendRedirect("doctor/DoctorHomecss.jsp");
            }
            else if(ut.equalsIgnoreCase("assistant"))
            {
                response.sendRedirect("assistant/AssistantHomecss.jsp");
            }
        }
        else
        {
            response.sendRedirect("LoginError.jsp");
        }
    }
%>