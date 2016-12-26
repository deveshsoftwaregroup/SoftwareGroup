package com.sportmgmt.controller.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.scribe.builder.api.FacebookApi;
import org.scribe.model.Verifier;
import org.scribe.oauth.OAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.sportmgmt.utility.common.FacebookUtil;
import com.sportmgmt.utility.common.OAuthServiceProvider;
import org.scribe.model.Token;

@Controller
@RequestMapping(value = "/social")
public class SocailAction {
	
	/*private static final Logger LOGGER = Logger.
			.getLogger(FacebookController.class);*/
	private Logger logger = Logger.getLogger(SocailAction.class);
	private static final String FACEBOOK = "facebook";
	private static final String PUBLISH_SUCCESS = "facebookSuccess";
	private static final String PUBLISH_ERROR = "error";

	@Autowired
	private ConnectionFactoryRegistry connectionFactoryRegistry;

	@Autowired
	private OAuth2Parameters oAuth2Parameters;

	@Autowired
	FacebookUtil facebookUtil;

	@Autowired
	@Qualifier("facebookServiceProvider")
	private OAuthServiceProvider<FacebookApi> facebookServiceProvider;

	@RequestMapping(value = "/facebook/signin", method = RequestMethod.GET)
	public ModelAndView signin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		FacebookConnectionFactory facebookConnectionFactory = (FacebookConnectionFactory) connectionFactoryRegistry
				.getConnectionFactory(FACEBOOK);
		OAuth2Operations oauthOperations = facebookConnectionFactory
				.getOAuthOperations();
		oAuth2Parameters.setState("recivedfromfacebooktoken");
		String authorizeUrl = oauthOperations.buildAuthorizeUrl(
				GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
		logger.debug("Authorization URL: "+authorizeUrl);
		System.out.println("authorizeUrl: "+authorizeUrl);
		RedirectView redirectView = new RedirectView(authorizeUrl, true, true,
				true);

		return new ModelAndView(redirectView);
	}

	@RequestMapping(value = "facebook/callback", method = RequestMethod.GET)
	public String postOnWall(@RequestParam("code") String code,
			@RequestParam("state") String state, HttpServletRequest request,
			HttpServletResponse response,ModelMap modelMap) throws Exception {

		logger.debug("----------------- Started call back method:");
		OAuthService oAuthService = facebookServiceProvider.getService();

		Verifier verifier = new Verifier(code);
		Token accessToken = oAuthService
				.getAccessToken(Token.empty(), verifier);

		/*FacebookTemplate template = new FacebookTemplate(accessToken.getToken());
		
		template.userOperations().G

		FacebookProfile facebookProfile = template.userOperations()
				.getUserProfile();

		String userId = facebookProfile.getId();*/

		//LOGGER.info("Logged in User Id : {}", userId);
		
		
		URL url = new URL("https://graph.facebook.com/me?access_token="
                + accessToken.getToken());
        System.out.println(url);
        URLConnection conn1 = url.openConnection();
        String outputString = "", line="";
        BufferedReader reader = new BufferedReader(new InputStreamReader(
                conn1.getInputStream()));
        while ((line = reader.readLine()) != null) {
            outputString += line;
        }
        reader.close();

		logger.debug("logged in user: "+outputString);
		modelMap.put("userId", outputString);

		/*MultiValueMap<String, Object> map = facebookUtil
				.publishLinkWithVisiblityRestriction(state);
		try {
			template.publish(facebookProfile.getId(), "feed", map);
		} catch (Exception ex) {
			
			return PUBLISH_ERROR;
		}*/

		return PUBLISH_SUCCESS;
	}

	@RequestMapping(value = "/callback", params = "error_reason", method = RequestMethod.GET)
	@ResponseBody
	public void error(@RequestParam("error_reason") String errorReason,
			@RequestParam("error") String error,
			@RequestParam("error_description") String description,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		try {
			/*LOGGER.error(
					"Error occurred while validating user, reason is : {}",
					errorReason);*/
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, description);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
