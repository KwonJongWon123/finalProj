package com.admin.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.model.DbMapper;
import com.model.ServiceFullDTO;
import com.model.ServiceNoticePageDTO;

@Service
public class Persqnapersqnanew implements PageeditService {
	@Resource
	DbMapper db;

	@Override
	public Object execute(Object obj) {
		HashMap<String, Object> orimap = (HashMap) obj;
		ServiceNoticePageDTO snpdto = (ServiceNoticePageDTO) orimap.get("snpdto");
		ServiceFullDTO sfdto = (ServiceFullDTO) orimap.get("sfdto");

		
		HashMap<String, Object> map = new HashMap<>();
		map.put("snpdto", snpdto);
		map.put("sfdto", sfdto);
		
		snpdto.persnew(db, map);

		ServiceNotiListDTO res = new ServiceNotiListDTO();
		res.setSfdto(db.perslist(map));
		res.setSnpdto(snpdto);

		return res;
	}

}
