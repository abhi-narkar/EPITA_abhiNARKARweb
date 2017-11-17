/**
 * Copyright Thomas Broussard
 */
package fr.epita.abhishek.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import fr.epita.iam.datamodel.Identity;
import fr.epita.iam.services.HibernateIdentityDAO;


/**
 * <h3>Description</h3>
 * <p>Cette classe permet de ...</p>
 *
 * <h3>Utilisation</h3>
 * <p>Elle s'utilise de la manière suivante :
 *   <pre><code>${type_name} instance = new ${type_name}();</code></pre>
 * </p>
 *
 * @since $${version}
 * @see Voir aussi $${link}
 * @author ${user}
 *
 * ${tags}
 */

// integrate spring and junit
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/applicationContext.xml" })
public class TestHibernateDAO {

	private static final Logger LOGGER = LogManager.getLogger(TestHibernateDAO.class);

	@Inject
	HibernateIdentityDAO dao;

	@Inject
	DataSource ds;

	@Test
	public void testCreateThroughSave() throws SQLException {
		LOGGER.info("beginning test");
		// GIVEN
		final Identity identity = new Identity("tbr", "tbr@tbr.com", new Date());

		// WHEN
		dao.save(identity);

		// THEN
		final int count = executeQuery("SELECT count(*)  FROM IDENTITIES WHERE IDENTITIES.IDENTITY_EMAIL='tbr@tbr.com'");
		Assert.assertEquals(1, count);
		LOGGER.info("got this count {}", count);
		LOGGER.info("test successful");

	}

	/**
	 * <h3>Description</h3>
	 * <p>Cette méthode permet de ...</p>
	 *
	 * <h3>Utilisation</h3>
	 * <p>Elle s'utilise de la manière suivante :
	 *
	 * <pre><code> ${enclosing_type} sample;
	 *
	 * //...
	 *
	 * sample.${enclosing_method}();
	 *</code></pre>
	 * </p>
	 *
	 * @since $${version}
	 * @see Voir aussi $${link}
	 * @author ${user}
	 *
	 * ${tags}
	 */
	private <T> T executeQuery(String sqlQuery) throws SQLException {
		final Connection connection = ds.getConnection();
		final PreparedStatement prepareStatement = connection
				.prepareStatement(sqlQuery);
		final ResultSet rs = prepareStatement.executeQuery();
		rs.next();
		final T count = (T) rs.getObject(1);
		rs.close();
		prepareStatement.close();
		connection.close();
		return count;
	}

	@Test
	public void testUpdateThroughupdate() throws SQLException, ParseException {
		LOGGER.info("beginning test");
		// GIVEN
		final Identity identity = new Identity("tbr", "tbr@tbr.com", new Date());

		// WHEN
		dao.save(identity);
		final SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		identity.setBirthDate(sdf.parse("09/04/1986"));
		dao.update(identity);

		// THEN
		final Date date = executeQuery("SELECT IDENTITY_BIRTHDATE FROM IDENTITIES WHERE IDENTITIES.IDENTITY_EMAIL='tbr@tbr.com'");
		Assert.assertEquals("09/04/1986", sdf.format(date));
		LOGGER.info("got this modified {}", date);
		LOGGER.info("test successful");

	}
	@Test
	public void testdeleteThroughdelete() throws SQLException {
		LOGGER.info("beginning test");
		//GIVEN
		final Identity identity=new Identity("abhi","abhi@abhi.com" ,new Date());
		//WHEN
		dao.save(identity);
		final int count = executeQuery("SELECT count(*)  FROM IDENTITIES WHERE IDENTITIES.IDENTITY_EMAIL='abhi@abhi.com'");
		Assert.assertEquals(1, count);
		LOGGER.info("got this count {}", count);
		//THEN
		dao.delete(identity);
		final int count1 = executeQuery("SELECT count(*)  FROM IDENTITIES WHERE IDENTITIES.IDENTITY_EMAIL='abhi@abhi.com'");
		Assert.assertEquals(0, count1);
		LOGGER.info("got this count {}", count1);
		LOGGER.info("test successful");
	}
	
	
	@Test
	public void testsearchThroughsearch() throws SQLException {
		LOGGER.info("beginning test");
		//GIVEN
		final Identity identity=new Identity("abhi","abhi@abhi.com" ,new Date());
		
		//WHEN
		dao.save(identity);
		
		//THEN
		
		
		 
		LOGGER.info("Search item is {}", dao.search(identity));
		LOGGER.info("test successful");
		
	}

	@After
	public void clean() throws SQLException {
		LOGGER.info("beginning clean");
		final Connection connection = ds.getConnection();
		final PreparedStatement prepareStatement = connection.prepareStatement("DELETE FROM IDENTITIES");
		prepareStatement.execute();
		LOGGER.info("clean successful");

	}

}
