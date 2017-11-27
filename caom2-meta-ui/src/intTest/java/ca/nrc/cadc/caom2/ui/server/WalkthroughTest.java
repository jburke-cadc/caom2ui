/*
 ************************************************************************
 ****  C A N A D I A N   A S T R O N O M Y   D A T A   C E N T R E  *****
 *
 * (c) 2013.                         (c) 2013.
 * National Research Council            Conseil national de recherches
 * Ottawa, Canada, K1A 0R6              Ottawa, Canada, K1A 0R6
 * All rights reserved                  Tous droits reserves
 *
 * NRC disclaims any warranties         Le CNRC denie toute garantie
 * expressed, implied, or statu-        enoncee, implicite ou legale,
 * tory, of any kind with respect       de quelque nature que se soit,
 * to the software, including           concernant le logiciel, y com-
 * without limitation any war-          pris sans restriction toute
 * ranty of merchantability or          garantie de valeur marchande
 * fitness for a particular pur-        ou de pertinence pour un usage
 * pose.  NRC shall not be liable       particulier.  Le CNRC ne
 * in any event for any damages,        pourra en aucun cas etre tenu
 * whether direct or indirect,          responsable de tout dommage,
 * special or general, consequen-       direct ou indirect, particul-
 * tial or incidental, arising          ier ou general, accessoire ou
 * from the use of the software.        fortuit, resultant de l'utili-
 *                                      sation du logiciel.
 *
 *
 * @author jenkinsd
 * 12/13/13 - 1:44 PM
 *
 *
 *
 ****  C A N A D I A N   A S T R O N O M Y   D A T A   C E N T R E  *****
 ************************************************************************
 */

package ca.nrc.cadc.caom2.ui.server;


import ca.nrc.cadc.caom2.PublisherID;
import ca.nrc.cadc.net.NetUtil;
import ca.nrc.cadc.util.StringUtil;
import ca.nrc.cadc.web.selenium.AbstractWebApplicationIntegrationTest;
import org.junit.Test;
import org.openqa.selenium.By;


public class WalkthroughTest extends AbstractAdvancedSearchIntegrationTest {

    public WalkthroughTest() throws Exception {
        super();
    }


    @Test
    public void observationViewTest() throws Exception {
        // TODO: need an observation that exists in dev, production and (beta?)
        final String publisherID = NetUtil.encode(PublisherID.SCHEME + "://com" +
            ".myauth/JCMT?scuba2_00049_20160410T133916/raw-450um");
        final ObservationViewPage observationViewPage = goTo(endpoint + "view/" + publisherID, null, ObservationViewPage
            .class);
        verifyTrue(observationViewPage.isObsLoaded());
    }

}
