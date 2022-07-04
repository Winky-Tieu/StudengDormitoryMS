package com.AWR.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.AWR.utils.Entity;

import java.util.List;


/**
 * @description 用户信息
 */
public class User extends Entity{

	private Integer id;
	private String userPwd;
	private String userName;
	private Integer sex;			// 用户性别：女=0；男=1
	private String telephone;
	private Integer roomId;
	private Integer userType;		// 角色类型：学生=0；宿舍管理员=1；后勤中心=2

	/**
	 * @silkTag 该数据域专为用户中的管理员所创建
	 * @description 作用：以List存储管理员所在楼栋的所有寝室水电账单付款情况
	 */
	private List<Integer> billPaidInfo;

	/**
	 * @silkTag 该数据域专为用户中的管理员所创建
	 * @description 作用：以List存储管理员所在楼栋的所有寝室水电账单付款情况
	 */
	private List<Double> billUsedAndFeeInfo;

	private Building building;
	private Room room;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@JsonIgnore						// 返回Json时不显示密码
	public String getUserPwd() {
		return userPwd;
	}

	@JsonProperty					// 提交时能够使用
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public List<Integer> getBillPaidInfo() {
		return billPaidInfo;
	}

	public void setBillPaidInfo(List<Integer> billPaidInfo) {
		this.billPaidInfo = billPaidInfo;
	}

	public List<Double> getBillUsedAndFeeInfo() {
		return billUsedAndFeeInfo;
	}

	public void setBillUsedAndFeeInfo(List<Double> billUsedAndFeeInfo) {
		this.billUsedAndFeeInfo = billUsedAndFeeInfo;
	}

	public Building getBuilding() {
		return building;
	}

	public void setBuilding(Building building) {
		this.building = building;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public User() {
	}

	public User(Integer id, String userPwd, String userName, Integer sex, String telephone, Integer roomId, Integer userType) {
		this.id = id;
		this.userPwd = userPwd;
		this.userName = userName;
		this.sex = sex;
		this.telephone = telephone;
		this.roomId = roomId;
		this.userType = userType;
	}
}