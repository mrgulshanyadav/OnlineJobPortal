package org.apache.jsp.WEB_002dINF;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<link rel=\"stylesheet\" href=\"styles.css\" type=\"text/css\"/>\n");
      out.write("<title>Login</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write(" <fieldset><legend>Login</legend>\n");
      out.write("<form name=\"form1\" method=\"post\" action=\"loginaction.jsp\">\n");
      out.write("<table> \n");
      out.write("<tr>\n");
      out.write(" <td align='center' colspan=2><input type=\"radio\" name=\"usertype\" value=\"jobseeker\" required>JobSeeker <input type=\"radio\" name=\"usertype\" value=\"recruiter\" required>Recruiter <input type=\"radio\" name=\"usertype\" value=\"admin\" required>Admin </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>&nbsp</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>Username</td>\n");
      out.write("<td><input name=\"username\" type=\"text\" placeholder=\"Username\" required></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td>Password</td>\n");
      out.write("<td><input name=\"password\" type=\"password\" placeholder=\"Password\" required></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td></td>\n");
      out.write("<td align=\"center\" colspan=2><input type=\"submit\" name=\"Submit\" value=\"Login\"></td>\n");
      out.write("</tr>\n");
      out.write("</table>                                          \n");
      out.write("</form>\n");
      out.write("<a href=\"registration.jsp\">Click here to register an Account</a>\n");
      out.write("</fieldset>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
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
