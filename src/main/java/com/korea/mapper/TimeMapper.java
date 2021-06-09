package com.korea.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	@Select("select now()")
	public String getTime();
	
	
	public String getTime2();
	
	public String getName(HashMap<String, String> map);
	
	
	
}
