package com.shineway.urule.model;

import java.util.Date;

import com.bstek.urule.model.Label;

/**
 * 测试类
 * 
 * @author Andy
 *
 */
public class Test {

	@Label("名称")
	private String name;
	@Label("年龄")
	private int age;
	@Label("出生日期")
	private Date birthday;
	@Label("等级")
	private int level;
	@Label("手机号")
	private String mobile;
	@Label("性别")
	private boolean gender;
	@Label("是否有车")
	private boolean car;
	@Label("婚否")
	private boolean married;
	@Label("是否有房")
	private boolean house;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public boolean isCar() {
		return car;
	}

	public void setCar(boolean car) {
		this.car = car;
	}

	public boolean isMarried() {
		return married;
	}

	public void setMarried(boolean married) {
		this.married = married;
	}

	public boolean isHouse() {
		return house;
	}

	public void setHouse(boolean house) {
		this.house = house;
	}
}
