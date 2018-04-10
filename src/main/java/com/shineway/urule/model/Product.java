package com.shineway.urule.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 产品表
 * 
 * @author Andy
 *
 */
@Entity
@Table(name = "POC_PRODUCT")
public class Product implements Serializable {

	@Id
	@Column(name = "UUID_", length = 40)
	private String uuid;
	
	
	

}
