/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.15
 * Generated at: 2017-10-09 11:59:23 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.io.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <link rel=\"icon\" href=\"../../QAminiLogo.ico\">\n");
      out.write("\n");
      out.write("    <title>Gale Reports</title>\n");
      out.write("\n");
      out.write("    <!-- Bootstrap core CSS -->\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("        $('ul.nav.navbar-nav.navbar-right li a').click(function() {\n");
      out.write("            $(this).parent().addClass('active').siblings().removeClass('active');\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        $(document).ready(function(){\n");
      out.write("          // Add smooth scrolling to all links\n");
      out.write("          $(\"a\").on('click', function(event) {\n");
      out.write("\n");
      out.write("            // Make sure this.hash has a value before overriding default behavior\n");
      out.write("            if (this.hash !== \"\") {\n");
      out.write("              // Prevent default anchor click behavior\n");
      out.write("              event.preventDefault();\n");
      out.write("\n");
      out.write("              // Store hash\n");
      out.write("              var hash = this.hash;\n");
      out.write("\n");
      out.write("              // Using jQuery's animate() method to add smooth page scroll\n");
      out.write("              // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area\n");
      out.write("              $('html, body').animate({\n");
      out.write("                scrollTop: $(hash).offset().top\n");
      out.write("              }, 800, function(){\n");
      out.write("\n");
      out.write("                // Add hash (#) to URL when done scrolling (default click behavior)\n");
      out.write("                window.location.hash = hash;\n");
      out.write("              });\n");
      out.write("            } // End if\n");
      out.write("          });\n");
      out.write("        });\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("    <style>\n");
      out.write("    .btn{\n");
      out.write("      font-size:14px;\n");
      out.write("      padding:4px 8px;\n");
      out.write("    }\n");
      out.write("    li.addHoverManager:hover{\n");
      out.write("        background-color: #e3e3e3;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    .boldMaker{\n");
      out.write("     font-weight:600;\n");
      out.write("    }\n");
      out.write("    </style>\n");
      out.write("</head>\n");

     //String binDir                       = System.getProperty("user.dir").toString();
     String currDir                        = "..\\webapps\\ROOT";
     String name                           = request.getParameter("testNumber");
     String fullFolderLocationAggregate    = "";
     String fullFolderLocationResponseTime = "";
     String desiredFolder                  = "";
     File mainFolder                       = new File(currDir);
     File[] mainFolders                    = mainFolder.listFiles();
     String testTime = "";String testValue = "";
     String errorMsg = "";String fileName  = "";
     for(int j=0; j < mainFolders.length;j++)
          {
             fileName = mainFolders[j].getName().toString();
             if(fileName.startsWith(name.toString()))
             {
                if(fileName.endsWith("28800"))
                    {testTime = "8 Hours";testValue = "28800";}
                else if(fileName.endsWith("7200"))
                    {testTime = "2 Hours";testValue = "7200";}
                else
                    errorMsg = "<strong color='red'>Unable to fetch data! Please check the folder with load test number exists!</strong>";
                break;
             }
          }

      out.write("\n");
      out.write("<body>\n");
      out.write("      <nav class=\"navbar navbar-default\">\n");
      out.write("        <div class=\"container\" style=\"padding-left:0px;\">\n");
      out.write("          <div class=\"navbar-header\">\n");
      out.write("            <a href=\"#\" id=\"goTop\"><img src=\"../../qaLogo.jpg\" height=\"50px\" style=\"float:left;margin-left:-80px;\"/></a>\n");
      out.write("            <a class=\"navbar-brand\" href=\"#\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GALE REPORTS</a>\n");
      out.write("            <a class=\"navbar-brand\" href=\"#\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOAD TEST NUMBER : ");
      out.print(name);
      out.write("</a>\n");
      out.write("            <a class=\"navbar-brand\" href=\"#\">DURATION : ");
      out.print(testTime);
      out.write("</a>\n");
      out.write("          </div>\n");
      out.write("          <div id=\"navbar\">\n");
      out.write("            <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("              <li class=\"active\"><a href=\"#AggregateReports\" data-toggle=\"tab\">Aggregate Reports</a></li>\n");
      out.write("              <li><a href=\"#ResponseTime\" data-toggle=\"tab\">Response Time Graphs</a></li>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </nav>\n");
      out.write("\n");
      out.write("   <div class=\"footer\" style=\"position:fixed;z-index:999999;bottom:0;left:0;\">\n");
      out.write("   <a href=\"#goTop\" style=\"text-decoration:none;\">\n");
      out.write("   <button type=\"button\" class=\"btn btn-secondary\" data-toggle=\"tooltip\" data-placement=\"right\" title=\"GO TOP\">\n");
      out.write("     <span class=\"glyphicon glyphicon glyphicon-triangle-top\" aria-hidden=\"true\"></span>\n");
      out.write("     <strong>TOP</strong>\n");
      out.write("   </button></a>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"tab-content\">\n");
      out.write("      <div class=\"tab-pane active\" id=\"AggregateReports\">\n");
      out.write("      <div class=\"row\" style=\"margin-right:0;\">\n");
      out.write("      <div class=\"col-md-2\" style=\"position:absolute;background-color:#f8f8f8;\">\n");
      out.write("        <h4 class=\"text-center\" style=\"color:#111;\">PRODUCT NAME</h4>\n");
      out.write("\n");
      out.write("\n");

          if(errorMsg=="")
               {
                  desiredFolder                      = name + "_" + testValue;
                  fullFolderLocationAggregate        = currDir +"\\"+desiredFolder+"\\AggregateReport";
                  fullFolderLocationResponseTime     = currDir +"\\"+desiredFolder+"\\ResponseTime";
                  File folderAggregate               = new File(fullFolderLocationAggregate);
                  File folderResponseTime            = new File(fullFolderLocationResponseTime);
                  File[] listOfFoldersAggregate      = folderAggregate.listFiles();
                  File[] listOfFoldersResponseTime   = folderResponseTime.listFiles();
                  String prodNameWithExtension="";String prodName="";String pathProductAggregate="";
                  String prodResTimeWithExtension="";String prodResTime="";String pathProductResTime="";
           
      out.write("\n");
      out.write("           <ul style=\"list-style:none;\">\n");
      out.write("           ");

                  for(int i=0; i < listOfFoldersAggregate.length;i++)
                    {
                     prodNameWithExtension  = listOfFoldersAggregate[i].getName();
                     prodName               = prodNameWithExtension.replace(".csv","");
                     pathProductAggregate   = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
             
      out.write("\n");
      out.write("           <li class=\"addHoverManager\">\n");
      out.write("             <a class=\"btn cont\" id=\"transit\" href=\"#");
      out.print(prodName);
      out.write("\" style=\"color:#777;cursor:pointer;text-decoration:none;padding-left:40px;\">\n");
      out.write("                ");
      out.print(prodName);
      out.write("\n");
      out.write("             </a>\n");
      out.write("           </li>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("         </ul>\n");
      out.write("         </div>\n");
      out.write("         ");

            for(int i=0; i < listOfFoldersAggregate.length;i++)
            {
                    prodNameWithExtension = listOfFoldersAggregate[i].getName();
                    prodName              = prodNameWithExtension.replace(".csv","");
                    pathProductAggregate  = fullFolderLocationAggregate+"\\"+prodNameWithExtension;
         
      out.write("\n");
      out.write("         <div class=\"col-md-10\" style=\"margin-left:16%;\">\n");
      out.write("         <h3 class=\"text-center\" id=\"");
      out.print(prodName);
      out.write('"');
      out.write('>');
      out.print(prodName);
      out.write("</h3>\n");
      out.write("         <table class=\"table table-bordered table-hover\" style=\"font-size:16px;\"> <!-- table-striped -->\n");
      out.write("           <thead>\n");
      out.write("             <tr>\n");
      out.write("               <th>Label</th>\n");
      out.write("               <th>Sample</th>\n");
      out.write("               <th>Average(Sec.)</th>\n");
      out.write("               <th>Median(Sec.)</th>\n");
      out.write("               <th>90% Line</th>\n");
      out.write("               <th>Min(Sec.)</th>\n");
      out.write("               <th>Max(Sec.)</th>\n");
      out.write("               <th>Error%</th>\n");
      out.write("               <th>Throughput</th>\n");
      out.write("               <th>KB/Sec</th>\n");
      out.write("             </tr>\n");
      out.write("           </thead>\n");
      out.write("           <tbody>\n");
      out.write("         ");

         String line;
         String[] dataInLine;
         FileReader fileReader         = new FileReader(pathProductAggregate);
         BufferedReader bufferedReader = new BufferedReader(fileReader);
         while ((line = bufferedReader.readLine()) != null) {
                   if(line.startsWith("sampler_label"))
                        continue;

                   String bold = "";

                   dataInLine        = line.split(",");
                   String label      = dataInLine[0];

                    if(label.equals("TOTAL"))
                        bold = "class='boldMaker'";

                   int sample        = Integer.parseInt(dataInLine[1]);
                   float avg         = Float.parseFloat(dataInLine[2])/1000;
                   float median      = Float.parseFloat(dataInLine[3])/1000;
                   float ninetyline  = Float.parseFloat(dataInLine[4])/1000;
                   float min         = Float.parseFloat(dataInLine[5])/1000;
                   float max         = Float.parseFloat(dataInLine[6])/1000;
                   String error      = dataInLine[7];
                   String throughput = dataInLine[8];
                   String kbpersec   = dataInLine[9];
                   String errorString=error.replace("%","");
                   float errorFloat=Float.parseFloat(errorString);
                   if(errorFloat>=2.0)
                      errorString = "<td style='color:red;font-weight:600;'>"+error+"</td>";
                   else
                      errorString = "<td>"+error+"</td>";
                   String avgString;
                   if(avg>=3.0)
                    avgString = "<td style='color:red;font-weight:600;'>"+avg+"</td>";
                   else
                    avgString = "<td>"+avg+"</td>";
          
      out.write("\n");
      out.write("             <tr ");
      out.print(bold);
      out.write(">\n");
      out.write("                <td>");
      out.print(label);
      out.write("</td>\n");
      out.write("                <td>");
      out.print(sample);
      out.write("</td>\n");
      out.write("                ");
      out.print(avgString);
      out.write("\n");
      out.write("                <td>");
      out.print(median);
      out.write("</td>\n");
      out.write("                <td>");
      out.print(ninetyline);
      out.write("</td>\n");
      out.write("                <td>");
      out.print(min);
      out.write("</td>\n");
      out.write("                <td>");
      out.print(max);
      out.write("</td>\n");
      out.write("                ");
      out.print(errorString);
      out.write("\n");
      out.write("                <td>");
      out.print(throughput);
      out.write("</td>\n");
      out.write("                <td>");
      out.print(kbpersec);
      out.write("</td>\n");
      out.write("              </tr>\n");
      out.write("          ");

          }
          bufferedReader.close();
          fileReader.close();
          
      out.write("\n");
      out.write("         </tbody>\n");
      out.write("         </table>\n");
      out.write("              <hr/>\n");
      out.write("      </div>\n");
      out.write("         ");
}
      out.write("\n");
      out.write("      </div>\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("      <div class=\"tab-pane\" id=\"ResponseTime\">\n");
      out.write("        <div class=\"row\" style=\"margin-right:0;\">\n");
      out.write("         <div class=\"col-md-2\" style=\"position:absolute;background-color:#f8f8f8;\">\n");
      out.write("          <h4 class=\"text-center\" style=\"color:#111;\">PRODUCT NAME</h4>\n");
      out.write("          <ul style=\"list-style:none;\">\n");
      out.write("                    ");

                           for(int i=0; i < listOfFoldersResponseTime.length;i++)
                             {
                              prodResTimeWithExtension  = listOfFoldersResponseTime[i].getName();
                              prodResTime               = prodResTimeWithExtension.replace(".png","");
                              pathProductResTime   = fullFolderLocationResponseTime+"\\"+prodResTimeWithExtension;
                      
      out.write("\n");
      out.write("                    <li class=\"addHoverManager\">\n");
      out.write("                      <a class=\"btn cont\" id=\"transit\" href=\"#");
      out.print(prodResTime);
      out.write("ResTime\" style=\"color:#777;cursor:pointer;text-decoration:none;padding-left:40px;\">\n");
      out.write("                         ");
      out.print(prodResTime);
      out.write("\n");
      out.write("                      </a>\n");
      out.write("                    </li>\n");
      out.write("                             ");
}
      out.write("\n");
      out.write("          </ul>\n");
      out.write("         </div>\n");
      out.write("\n");
      out.write("                <div class=\"col-md-10\" style=\"margin-left:16%;\">\n");
      out.write("                    ");

                          for(int i=0; i < listOfFoldersResponseTime.length;i++)
                             {
                               prodResTimeWithExtension  = listOfFoldersResponseTime[i].getName();
                               prodResTime               = prodResTimeWithExtension.replace(".png","");
                               pathProductResTime        = "\\"+desiredFolder+"\\ResponseTime\\"+prodResTimeWithExtension;

                    
      out.write("\n");
      out.write("                    <h3 class=\"text-center\" id=\"");
      out.print(prodResTime);
      out.write("ResTime\">");
      out.print(prodResTime);
      out.write("</h3>\n");
      out.write("                    <div class=\"text-center\">\n");
      out.write("                     <img src=\"");
      out.print(pathProductResTime);
      out.write("\" class=\"img-fluid img-thumbnail\" alt=\"");
      out.print(prodResTime);
      out.write(" : Response Time Graph\"/>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("      ");
}
      out.write("\n");
      out.write("   </div>\n");
      out.print(errorMsg);
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
