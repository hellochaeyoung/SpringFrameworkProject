package lotte.com.a.poll;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PollDaoImpl implements PollDao{

    @Autowired
    SqlSession session;

    String ns = "Poll."; // nameSpace

    @Override
    public List<PollDto> polllist() {
        return session.selectList(ns + "polllist");
    }

    @Override
    public int isVoter(Voter voter) {
        return session.selectOne(ns + "isVoter", voter);
    }
}
