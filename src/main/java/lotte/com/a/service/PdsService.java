package lotte.com.a.service;

import lotte.com.a.dto.PdsDto;
import java.util.List;



public interface PdsService {
	List<PdsDto> pdslist();
	int uploadPds(PdsDto dto);

	PdsDto pdsDetail(int seq);
}
