package fr.epita.iam.controllers;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.exception.DataException;

import fr.epita.iam.datamodel.Identity;
import fr.epita.iam.services.HibernateIdentityDAO;




/**
 * Servlet implementation class SearchIdentity
 */
public class SearchIdentity extends AbstractSpringServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	HibernateIdentityDAO dao; 
	private static final Logger LOGGER = LogManager.getLogger(SearchIdentity.class);     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdentity() {
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
{
			
			String displayName = request.getParameter("displayName");
			String email = request.getParameter("email");
			LOGGER.info("displayname"+displayName+ "email"+email);
			
			try {
				List<Identity> identitiesList = (List<Identity>) dao.search(new Identity(displayName, email, null));
				request.getSession().setAttribute("identitiesList", identitiesList);
				response.sendRedirect("searchResult.jsp");
				
			} catch (DataException e) {
				
				e.printStackTrace();
			}
	}

	}}
