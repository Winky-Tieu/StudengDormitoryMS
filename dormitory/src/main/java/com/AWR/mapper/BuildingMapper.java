package com.AWR.mapper;

import java.util.List;

import com.AWR.entity.Building;


public interface BuildingMapper {

	public int create(Building building);

	public int delete(Integer id);

	public int update(Building building);

	public int updateSelective(Building building);

	public List<Building> query(Building building);

	public Building detail(Integer id);

	public int count(Building building);

	public int querySex(Integer buildingId);

	public int queryDomersBuilding(Integer userId);

}