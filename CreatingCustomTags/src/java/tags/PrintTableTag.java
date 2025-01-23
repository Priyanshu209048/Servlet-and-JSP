package tags;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;

public class PrintTableTag extends TagSupport{

    public int number;
    public String color;

    public void setColor(String color) {
        this.color = color;
    }

    public void setNumber(int number) {
        this.number = number;
    }
    
    @Override
    public int doStartTag() throws JspException {
        try {
            
            JspWriter out = pageContext.getOut();
            //print table
            out.print("<div style='color:" + color + "'>");
            out.print("<br/>");
            for (int i = 0; i < 10; i++) {
                out.println((i * number) + "<br/>");
            }
            out.print("</div>");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return SKIP_BODY;
    }
    
    
    
}
