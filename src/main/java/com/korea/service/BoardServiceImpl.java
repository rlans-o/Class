package com.korea.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korea.mapper.BoardMapper;
import com.korea.vo.BoardVO;
import com.korea.vo.ReplyVO;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList() {
		//비지니스 로직 처리
		
		return mapper.getList();
	}

	@Override
	public BoardVO get(Long bno) {
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		
		return mapper.modify(board);
	}

	@Override
	public boolean remove(Long bno) {
		
		return mapper.remove(bno);
	}

	@Override
	public boolean register(BoardVO board) {
		
		return mapper.register(board);
	}

	@Override
	public List<BoardVO> getList(Map<String, String> map) {
		
		return mapper.getList(map);
	}

	@Override
	public List<ReplyVO> getReplyList(Long bno) {
		
		return mapper.getReply(bno);
	}
	
	


	
}
