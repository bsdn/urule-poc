package com.shineway.urule.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 发货基础信息
 * 
 * @author Andy
 *
 */
@Entity
@Table(name = "POC_SEND_OUT")
public class SendOut implements Serializable {

	@Id
	@Column(name = "UUID_", length = 40)
	private String uuid;
	
	
	

}
