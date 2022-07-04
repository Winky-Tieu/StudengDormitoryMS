package com.AWR.mapper;

import java.util.List;

import com.AWR.entity.Exchange;


public interface ExchangeMapper {

	public int create(Exchange exchange);

	public int delete(Integer id);

	public int update(Exchange exchange);

	public int updateSelective(Exchange exchange);

	public List<Exchange> query(Exchange exchange);

	public Exchange detail(Integer id);

	public int count(Exchange exchange);

}