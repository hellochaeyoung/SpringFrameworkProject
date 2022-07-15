package lotte.com.a.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String mainFunc(HttpServletRequest req) {
		logger.info("MainController mainFunc() " + new Date());

		req.getSession().setAttribute("loginId", "abc");
		
		return "main.tiles";
	}
	
	
}






