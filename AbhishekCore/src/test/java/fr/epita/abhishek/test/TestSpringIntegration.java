package fr.epita.abhishek.test;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.inject.Named;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"/applicationContext.xml"})
public class TestSpringIntegration {

	@Inject
	@Named("hello2")
	private String helloFromSpring;
	
	@Inject
	DataSource ds;
	
	private static final Logger LOGGER = LogManager.getLogger( TestSpringIntegration.class);
	
	
	@Test
	public void testSpringHello() {
		LOGGER.info("Spring says: {} ", helloFromSpring);
		
	}
	
	@Test
	public void testSpringDataSource() throws SQLException {
		//given ds (injected)
		
		//when ds.getConnection();
		Connection connection = ds.getConnection();
		
		//then connection.getSchema() should not be null
		LOGGER.info("connection schema: {} ", connection.getSchema() );
		
	}

}
