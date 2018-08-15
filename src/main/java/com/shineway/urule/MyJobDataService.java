package com.shineway.urule;

import java.util.List;

import org.springframework.stereotype.Component;

import com.bstek.bdf2.job.model.JobDefinition;
import com.bstek.bdf2.job.service.IJobDataService;

@Component
public class MyJobDataService implements IJobDataService {

	@Override
	public List<JobDefinition> filterJobs(List<JobDefinition> arg0) {
		// TODO Auto-generated method stub
		return arg0;
	}

	@Override
	public String getCompanyId() {
		// TODO Auto-generated method stub
		return "bstek";
	}

}
