package lotte.com.a.poll;

import java.util.List;

public interface PollService {

    List<PollDto> polllist(String id);

    void makePoll(PollBean pbean);

    PollDto getPoll(PollDto poll);
    List<PollSubDto> getPollSubList(PollDto poll);


}
