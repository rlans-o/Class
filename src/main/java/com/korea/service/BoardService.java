package com.korea.service;

import java.util.List;
import java.util.Map;

import com.korea.vo.BoardVO;
import com.korea.vo.ReplyVO;

public interface BoardService {
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getList(Map<String, String> map);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	public boolean register(BoardVO board);
	
	public List<ReplyVO> getReplyList(Long bno);
	
}
