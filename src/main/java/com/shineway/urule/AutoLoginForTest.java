package com.shineway.urule;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import com.bstek.bdf2.core.business.IUser;
import com.bstek.bdf2.core.model.DefaultUser;
import com.bstek.bdf2.core.security.IRetrivePreAuthenticatedUser;
@Component
public class AutoLoginForTest implements IRetrivePreAuthenticatedUser {

	@Override
	public IUser retrive(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		DefaultUser user = new DefaultUser();
		user.setUsername("admin");
		user.setCompanyId("bstek");
		user.setAdministrator(true);
		return user;
	}

}
