package com.model2.mvc.service.kakao;

import com.model2.mvc.service.domain.KakaoUser;
import com.model2.mvc.service.domain.User;

public interface KakaoDao {
	public void addUser(KakaoUser user) throws Exception ;
	
	public KakaoUser getUser(String userId) throws Exception;
	
	public boolean checkDuplication(String userId) throws Exception;
}
