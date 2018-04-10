package com.shineway.urule;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.bstek.urule.console.DefaultPrincipal;
import com.bstek.urule.console.EnvironmentProvider;
import com.bstek.urule.console.Principal;
import com.bstek.urule.console.servlet.RequestContext;

@Component
public class Environment implements EnvironmentProvider {

	/**
	 * @param context
	 *            请求上下文对象
	 * @return 返回当前登录主体对象（可能是用户或用户的角色）
	 */
	@Override
	public Principal getLoginPrincipal(RequestContext context) {
		DefaultPrincipal user = new DefaultPrincipal();
		user.setCompanyId("bstek");
		user.setName("admin");
		user.setAdmin(true);
		return user;
	}

	/**
	 * @return 返回当前系统当中权限判断主体集合 ，供配置资源库权限使用
	 */
	@Override
	public List<Principal> getPrincipals() {
		DefaultPrincipal user1 = new DefaultPrincipal();
		user1.setCompanyId("bstek");
		user1.setName("user1");
		user1.setDisplayName("张三");
		DefaultPrincipal user2 = new DefaultPrincipal();
		user2.setCompanyId("bstek");
		user2.setName("user2");
		user2.setDisplayName("李四");
		List<Principal> users = new ArrayList<Principal>();
		users.add(user1);
		users.add(user2);
		return users;
	}

}
