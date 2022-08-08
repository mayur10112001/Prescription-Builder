<% 
    session=request.getSession(false); //Open existing session
    if(session==null)
    {
        response.sendRedirect("index.jsp");
    }
    else
    {
        try
        {
            session.removeAttribute("email");
            session.removeAttribute("usertype");
            session.invalidate();
            response.sendRedirect("index.jsp");
        }
        catch(NullPointerException e)
        {
            response.sendRedirect("index.jsp");
        }
    }
%>