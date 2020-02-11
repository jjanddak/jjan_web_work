package com.gura.spring05.shop.dao;

import java.util.List;

import com.gura.spring05.shop.dto.ShopDto;

public interface ShopDao {
	//상품목록
	public List<ShopDto> getList();
	public void minusCount(int num);
	public void  minusMoney(ShopDto dto);
	public void plusPoint(ShopDto dto);
	public int getPrice(int num);
}
