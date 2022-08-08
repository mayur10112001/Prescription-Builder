package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LoginError_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<head>\r\n");
      out.write("<link href=\"styles/bootstrap.css\"\r\n");
      out.write("rel=\"stylesheet\" type=\"text/css\"/>\r\n");
      out.write("\r\n");
      out.write("<script src=\"styles/bootstrap.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("$(document).ready(function(e) {\r\n");
      out.write("    $(\"#b1\").click(function(e) {\r\n");
      out.write("        $(\"#menu1\").slideToggle();\r\n");
      out.write("    });\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<nav class=\"navbar navbar-expand-xl navbar-dark bg-danger\">\r\n");
      out.write("<marquee><a href=\"#\" class=\"navbar-brand\">LOGIN ERROR: EITHER USERNAME OR PASSWORD IS INCORRECT</a></marquee>\r\n");
      out.write("</nav>\r\n");
      out.write("<nav class=\"navbar navbar-expand-xl navbar-dark bg-dark\">\r\n");
      out.write("<a href=\"#\" class=\"navbar-brand\">OPD</a>\r\n");
      out.write("<div class=\"collapse navbar-collapse\" id=\"item\">\r\n");
      out.write("            <ul class=\"navbar-nav text-center ml-5 mr-auto\">\r\n");
      out.write("                <li class=\"nav-item\"><a class=\"nav-link\" href=\"Login.jsp\">TRY AGAIN</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("    </nav>\r\n");
      out.write("    <div class=\"container-fluid bg-dark\" style=\"min-height:648px;\" ></div>");
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
