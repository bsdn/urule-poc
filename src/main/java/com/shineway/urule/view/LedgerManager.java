package com.shineway.urule.view;

import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Component;

import com.bstek.bdf2.core.orm.hibernate.HibernateDao;
import com.bstek.dorado.annotation.DataProvider;
import com.bstek.dorado.annotation.Expose;
import com.bstek.dorado.data.provider.Page;
import com.shineway.urule.model.FlowDire;
import com.shineway.urule.model.Ledger;
import com.shineway.urule.model.Sales;
import com.shineway.urule.model.SendOut;
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
	@DataProvider
	public void pagingSales(Page<Sales> page){
		DetachedCriteria dc = DetachedCriteria.forClass(Sales.class);
    	this.pagingQuery(page, dc);
    }
	@DataProvider
	public void pagingSendOut(Page<SendOut> page){
		DetachedCriteria dc = DetachedCriteria.forClass(SendOut.class);
    	this.pagingQuery(page, dc);
    }
	@DataProvider
	public void pagingFlowDire(Page<FlowDire> page){
		DetachedCriteria dc = DetachedCriteria.forClass(FlowDire.class);
    	this.pagingQuery(page, dc);
    }
	
    @Expose
	public void callRule(Map<String,Object> params){
    	ruleInvokeService.invove(params);
	}
    
    @Expose
   	public void callRuleHasOverplus(Map<String,Object> params){
       	ruleInvokeService.invoveRuleHasOverplus(params);
   	}
    @Expose
   	public void callRuleTheroySale(Map<String,Object> params){
       	ruleInvokeService.invoveRuleTheroySale(params);
   	}
    @Expose
    public void resetLedger(Map<String,Object> params){
    	String id = (String) params.get("id");
    	Ledger ledger = (com.shineway.urule.model.Ledger) this.getSession().get(Ledger.class, id);
    	ledger.setCalcLevel1(null);
    	ledger.setCalcLevel2(null);
    	ledger.setSalesTheory(null);
    	ledger.setCalcResult1(null);
    	ledger.setCalcResult2(null);
    	ledger.setHasOverplusCurMonth(null);
    	ledger.setHasOverplusDec(null);
    	ledger.setHasOverplusJanToNov(null);
    	ledger.setMoreLevel1(null);
    	ledger.setMoreLevel2(null);
    	this.getSession().update(ledger);
    }
    @Expose
    public void callRuleHighFlow(Map<String,Object> params){
    }
    @Expose
   	public void callRuleCalcLevel(Map<String,Object> params){
   	}
    @Expose
   	public void callRuleMoreLevel(Map<String,Object> params){
   	}
    @Expose
   	public void callRuleCalcResultLevel(Map<String,Object> params){
   	}
}
