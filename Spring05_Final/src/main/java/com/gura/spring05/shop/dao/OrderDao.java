package com.gura.spring05.shop.dao;

import com.gura.spring05.shop.dto.OrderDto;

public interface OrderDao {
	//배송정보를 추가하는메소드
	public void addOrder(OrderDto dto);
}
