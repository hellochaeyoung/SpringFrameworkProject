package lotte.com.a.dao;

import lotte.com.a.dto.PdsDto;
import java.util.List;



public interface PdsDao {

	List<PdsDto> pdslist();
	
	int uploadPds(PdsDto dto);

	PdsDto pdsDetail(int seq);
}
