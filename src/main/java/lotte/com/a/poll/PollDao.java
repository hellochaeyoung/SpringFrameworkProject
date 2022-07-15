package lotte.com.a.poll;

import java.util.List;

public interface PollDao {

    List<PollDto> polllist();

    int isVoter(Voter voter);

    void makePoll(PollDto poll);
    void makePollSub(PollSubDto pollsub);

    PollDto getPoll(PollDto poll);
    List<PollSubDto> getPollSubList(PollDto poll);

}
