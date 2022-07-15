package lotte.com.a.poll;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PollServiceImpl implements PollService {

    @Autowired
    PollDao dao;


    @Override
    public List<PollDto> polllist(String id) {

        // 모든 투표 목록을 갖고온다.
        List<PollDto> list = dao.polllist();

        // 편집을 통해서 투표가 가능한지 설정해서 목록을 제작
        List<PollDto> plist = new ArrayList<>();

        for (PollDto poll : list) {
            int pollid = poll.getPollId();

            // 1 : 투표했음, 0 : 투표안함
            int count = dao.isVoter(new Voter(pollid, id));
            if(count == 1) {
                poll.setVote(true);
            }else {
                poll.setVote(false);
            }

            plist.add(poll);

        }

        return plist;

    }
}
