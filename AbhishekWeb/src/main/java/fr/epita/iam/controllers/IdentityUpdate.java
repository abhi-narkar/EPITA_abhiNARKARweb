package fr.epita.iam.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import fr.epita.iam.datamodel.Identity;
import fr.epita.iam.services.HibernateIdentityDAO;




/**
 * Servlet implementation class IdentityUpdate
 */
public class IdentityUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	HibernateIdentityDAO dao;
	
	
	private static final Logger LOGGER = LogManager.getLogger(IdentityUpdate.class);   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdentityUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {	
			    
			    final String displayName = request.getParameter("displayName");
				final String email = request.getParameter("email");
				final String rawDate = request.getParameter("birthDate");
				final String id = request.getParameter("id");
				
				
				
				final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				final Date date = sdf.parse(rawDate);

				Identity currentVersion = dao.getById(Integer.valueOf(id));
				currentVersion.setBirthDate(date);
				currentVersion.setDisplayName(displayName);
				currentVersion.setEmail(email);
				
				dao.update(currentVersion);
	            LOGGER.info("Identity Updated");
				

				response.sendRedirect("Update.jsp");

			} catch (final Exception pe) {
				pe.printStackTrace(System.out);;
				request.getSession().setAttribute("message",
						"A problem occured with the identity update, contact the admistrator at ...@admin.com");
				response.sendRedirect("search.jsp");
			
			}
	}

}
