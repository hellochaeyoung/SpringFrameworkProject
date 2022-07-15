package lotte.com.a.poll;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import lotte.com.a.controller.PdsController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PollController {

    Logger logger = LoggerFactory.getLogger(PollController.class);

    @Autowired
    PollService service;

    @RequestMapping(value = "polllist.do", method = RequestMethod.GET)
    public String polllist(Model model, HttpServletRequest req) {
        logger.info("PollController polllist() " + new Date());

        String id = req.getSession().getAttribute("loginId").toString();

        List<PollDto> list = service.polllist(id);
        model.addAttribute("plist", list);

        return "polllist.tiles";
    }

    @RequestMapping(value = "pollmake.do", method = RequestMethod.GET)
    public String pollmake(Model model, HttpServletRequest req) {
        logger.info("PollController pollmake() " + new Date());

        String id = req.getSession().getAttribute("loginId").toString();

        model.addAttribute("id", id);

        return "pollmake.tiles";

    }

    @RequestMapping(value = "pollmakeAf.do", method = RequestMethod.GET)
    public String pollmakeAf(PollBean pollBean, Model model) {
        logger.info("PollController pollmakeAf() " + new Date());
        model.addAttribute("doc_title", "투표목록");

        service.makePoll(pollBean);

        return "redirect:/polllist.do";

    }

    @RequestMapping(value = "polldetail.do", method = RequestMethod.GET)
    public String polldetail(PollDto poll, Model model) {

        // 투표 주제
        PollDto dto = service.getPoll(poll);

        // 투표 보기
        List<PollSubDto> list = service.getPollSubList(poll);

        model.addAttribute("poll", dto);
        model.addAttribute("pollsublist", list);

        return "polldetail.tiles";
    }
}
