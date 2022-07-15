package lotte.com.a.poll;

import java.util.List;

public interface PollDao {

    List<PollDto> polllist();

    int isVoter(Voter voter);

}
