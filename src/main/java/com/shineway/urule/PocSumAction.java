package com.shineway.urule;

import org.springframework.stereotype.Component;

import com.bstek.urule.model.library.action.annotation.ActionBean;
import com.bstek.urule.model.library.action.annotation.ActionMethod;
import com.bstek.urule.model.library.action.annotation.ActionMethodParameter;
@Component
@ActionBean(name = "条件计算")
public class PocSumAction {
	
	@ActionMethod(name = "求和")
    @ActionMethodParameter(names={"加数","被加数"})
	public int plus(int arg1, int arg2){
    	 return arg1 + arg2;
    }
	@ActionMethod(name = "求差")
	@ActionMethodParameter(names={"减数","被减数"})
    public int minus(int arg1, int arg2){
    	 return arg1 - arg2;
    }
     
}
