package com.korea.mapper;

import java.util.List;
import java.util.Map;

import com.korea.vo.BoardVO;
import com.korea.vo.ReplyVO;

public interface BoardMapper {

	public List<BoardVO> getList();
	
	public List<BoardVO> getList(Map<String, String> map);
	
	public BoardVO read(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	public boolean register(BoardVO board);
	
	public List<ReplyVO> getReply(long bno);
	
}
