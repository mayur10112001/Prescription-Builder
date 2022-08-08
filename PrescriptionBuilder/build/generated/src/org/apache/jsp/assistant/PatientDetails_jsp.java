package org.apache.jsp.assistant;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class PatientDetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");


String e1="",ut="";
session=request.getSession(false); //use only existing session
if(session==null)
{
    response.sendRedirect("../AuthError.jsp");
}
else
{
    try
    {
        e1=session.getAttribute("email").toString();

        ut=session.getAttribute("usertype").toString();
        if(ut.equalsIgnoreCase("assistant")==false)
        {
            response.sendRedirect("../AuthError.jsp");
        }
    }
    catch(NullPointerException e)
    {
        response.sendRedirect("../AuthError.jsp");
    }
}

      out.write("\n");
      out.write("<style>\n");
      out.write("\t#form1\n");
      out.write("\t{\n");
      out.write("\t\tbackground-color:#0FC;\n");
      out.write("\t\twidth:850px;\n");
      out.write("\t\theight:350px;\n");
      out.write("\t\tborder:3px solid #000;\n");
      out.write("\t\tpadding-top:32px;\n");
      out.write("\t\tfont-family:Copperplate Gothic Light;\n");
      out.write("\t\tborder-radius:10px;\n");
      out.write("\t\ttext-align:center;\n");
      out.write("                padding-left: 28px;\n");
      out.write("\t}\n");
      out.write("\t#btn1\n");
      out.write("\t{\n");
      out.write("\t\tfont-family:Copperplate Gothic Light;\n");
      out.write("\t\tpadding:5px;\n");
      out.write("\t}\n");
      out.write("\t#txt1_err,#txt2_err,#txt3_err,#txt4_err,#txt5_err,#txt6_err\n");
      out.write("\t{\n");
      out.write("\t\tcolor:#F00;\n");
      out.write("\t\tfont-family:Arial;\n");
      out.write("\t}\n");
      out.write("        #a1,#btn1\n");
      out.write("        {\n");
      out.write("            margin-right: 80px;\n");
      out.write("        }\n");
      out.write("  \n");
      out.write("</style>\n");
      out.write("<form id=\"form1\" onSubmit=\"return A()\" method=\"post\" action=\"PatientDetails1.jsp\">\n");
      out.write("  <h1 id=\"a1\">PATIENT DETAILS</h1>\n");
      out.write("  <table border=\"0\" width=\"800\" border-color=\"black\">\n");
      out.write("    <tr>\n");
      out.write("    \t<td>NAME:</td>\n");
      out.write("        <td><input type=\"text\" name=\"txt1\" id=\"txt1\" /></td>\n");
      out.write("        <td><span id=\"txt1_err\"></span></td>\n");
      out.write("        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("    \t<td>HEIGHT:</td>\n");
      out.write("        <td> <input type=\"text\" name=\"txt4\" id=\"txt4\" /></td>\n");
      out.write("        <td><span id=\"txt4_err\"></span> </td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("        <td>&nbsp;</td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("    \t<td>ADDRESS:</td>\n");
      out.write("        <td><input type=\"text\" name=\"txt2\" id=\"txt2\" /></td>\n");
      out.write("        <td><span id=\"txt2_err\"></span></td>\n");
      out.write("        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("        <td>WEIGHT:</td>\n");
      out.write("        <td> <input type=\"text\" name=\"txt5\" id=\"txt5\" /></td>\n");
      out.write("        <td><span id=\"txt5_err\"></span> </td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("        <td>&nbsp;</td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("    \t<td>PHONE NO.:</td>\n");
      out.write("        <td><input type=\"text\" name=\"txt3\" id=\"txt3\" /></td>\n");
      out.write("        <td><span id=\"txt3_err\"></span></td>\n");
      out.write("    </tr>\n");
      out.write("  </table>\n");
      out.write("  <br>\n");
      out.write("  <br>\n");
      out.write("  <p><input type=\"submit\" name=\"B1\" id=\"btn1\" value=\"Register\" /></p>\n");
      out.write("</form>\n");
      out.write("<script>\n");
      out.write("\n");
      out.write("       function A()\n");
      out.write("\t   {\n");
      out.write("\t\t\t var t1=document.getElementById(\"txt1\");\n");
      out.write("\t\t\t var s1=document.getElementById(\"txt1_err\");\n");
      out.write("\t\t\t var t2=document.getElementById(\"txt2\");\n");
      out.write("\t\t\t var s2=document.getElementById(\"txt2_err\");\n");
      out.write("\t\t\t var t3=document.getElementById(\"txt3\");  \n");
      out.write("\t\t\t var s3=document.getElementById(\"txt3_err\");\n");
      out.write("\t\t\t var t4=document.getElementById(\"txt4\");\n");
      out.write("\t\t\t var s4=document.getElementById(\"txt4_err\");\n");
      out.write("                         var t5=document.getElementById(\"txt5\");\n");
      out.write("\t\t\t var s5=document.getElementById(\"txt5_err\");\n");
      out.write("\t\t\t \n");
      out.write("\t\t\t var a=t1.value;\n");
      out.write("\t\t\t var b=t2.value;\n");
      out.write("\t\t\t var c=t3.value;\n");
      out.write("\t\t\t var d=t4.value;\n");
      out.write("                         var e=t5.value;\n");
      out.write("\t\t\t \n");
      out.write("\t\t\t s1.innerHTML=\"\";\n");
      out.write("\t\t\t s2.innerHTML=\"\";\n");
      out.write("\t\t\t s3.innerHTML=\"\";\n");
      out.write("\t\t\t s4.innerHTML=\"\";\n");
      out.write("                         s5.innerHTML=\"\";\n");
      out.write("\t\t\t \n");
      out.write("\t\t\tif(a==null || a==\"\")\n");
      out.write("                        {\n");
      out.write("                            s1.innerHTML=\"*Enter Name\";\n");
      out.write("                            t1.focus();\n");
      out.write("                            return false;\n");
      out.write("                        }\n");
      out.write("                        else if(b==null || b==\"\")\n");
      out.write("                        {\n");
      out.write("                            s2.innerHTML=\"*Enter Address\";\n");
      out.write("                            t2.focus();\n");
      out.write("                            return false;\n");
      out.write("                        }\n");
      out.write("                        else if(c==null || c==\"\")\n");
      out.write("                        {\n");
      out.write("                            s3.innerHTML=\"*Enter Contact\";\n");
      out.write("                            t3.focus();\n");
      out.write("                            return false;\n");
      out.write("                        }\n");
      out.write("                        else if(check_number(c)==false)\n");
      out.write("                        {\n");
      out.write("                            s3.innerHTML=\"!Only digits\";\n");
      out.write("                            t3.select();\n");
      out.write("                            return false;\n");
      out.write("                        }\n");
      out.write("                        else if(d==null || d==\"\")\n");
      out.write("                        {\n");
      out.write("                            s4.innerHTML=\"*Enter Height\";\n");
      out.write("                            t4.focus();\n");
      out.write("                            return false;\n");
      out.write("                        }\n");
      out.write("                        else if(e==null || e==\"\")\n");
      out.write("                        {\n");
      out.write("                            s5.innerHTML=\"*Enter Weight\";\n");
      out.write("                            t5.focus();\n");
      out.write("                            return false;\n");
      out.write("                        }\n");
      out.write("                }\n");
      out.write("                function check_number(val)\t\n");
      out.write("\t\t{\n");
      out.write("\t\t\tvar f=true;\n");
      out.write("\t\t\tfor(i=0; i<val.length && f==true; i++)\n");
      out.write("\t\t\t{\n");
      out.write("\t\t\t\tvar ch=val.charAt(i);\n");
      out.write("\t\t\t\tif(!(ch>='0'&&ch<='9'))\n");
      out.write("\t\t\t\t{\n");
      out.write("\t\t\t\t\tf=false;\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t}\n");
      out.write("\t\t\treturn f;\n");
      out.write("\t\t}\n");
      out.write("\n");
      out.write("</script>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
