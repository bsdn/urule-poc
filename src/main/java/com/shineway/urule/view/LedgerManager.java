package com.shineway.urule.view;

import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Component;

import com.bstek.bdf2.core.orm.hibernate.HibernateDao;
import com.bstek.dorado.annotation.DataProvider;
import com.bstek.dorado.annotation.Expose;
import com.bstek.dorado.data.provider.Page;
import com.shineway.urule.model.Ledger;
import com.shineway.urule.service.RuleInvokeService;

@Component
public class LedgerManager extends HibernateDao{
    @Resource
	private RuleInvokeService ruleInvokeService;
    
	@DataProvider
	public void paging(Page<Ledger> page){
		DetachedCriteria dc = DetachedCriteria.forClass(Ledger.class);
    	this.pagingQuery(page, dc);
    }
    @Expose
	public void callRule(Map<String,Object> params){
    	ruleInvokeService.invove(params);
	}
}
