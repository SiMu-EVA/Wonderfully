package Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class filter
 */
public class filter implements Filter {
	private String charset;
	private boolean enable; 

    /**
     * Default constructor. 
     */
    public filter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		if(charset!=null&&enable){
			request.setCharacterEncoding(charset);
			response.setCharacterEncoding(charset);
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.print("±àÂë¹ýÂËÆ÷³õÊ¼»¯ÖÐ¡£¡£¡£");
		this.charset=config.getInitParameter("charset");
		this.enable="true".equals(config.getInitParameter("enable"));
		System.out.print("×Ö·û±àÂë"+charset+"      ÊÇ·ñÆôÓÃ"+enable);
	}

}
