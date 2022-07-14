package lotte.com.a.service;

import lotte.com.a.dao.PdsDao;
import lotte.com.a.dto.PdsDto;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PdsServiceImpl implements PdsService{

	@Autowired
	PdsDao dao;

	@Override
	public List<PdsDto> pdslist() {
		return dao.pdslist();
	}

	@Override
	public int uploadPds(PdsDto dto) {		
		return dao.uploadPds(dto);
	}
		
	
}
