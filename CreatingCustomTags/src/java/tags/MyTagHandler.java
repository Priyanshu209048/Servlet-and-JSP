package tags;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;
import java.util.Date;

public class MyTagHandler extends TagSupport{

    @Override
    public int doStartTag() throws JspException {
        
        try {
            //task..tag
            JspWriter out = pageContext.getOut();   //returns the instance of JspWriter  
            out.println("<h1>Hello this is my custom tag</h1>");
            out.println("<p>This is custom paragraph</p>");
            out.print("<br/>");
            out.print(new Date().toString());
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return SKIP_BODY;   //will not evaluate the body content of the tag
    }
    
}
