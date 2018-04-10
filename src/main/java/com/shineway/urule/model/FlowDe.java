package com.shineway.urule.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 附件4-流向
 * 
 * @author Andy
 *
 */
@Entity
@Table(name = "POC_FLOWDE")
public class FlowDe implements Serializable {

	@Id
	@Column(name = "UUID_", length = 40)
	private String uuid;
	
	
	

}
