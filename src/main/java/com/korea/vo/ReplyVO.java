package com.korea.vo;

import lombok.Data;

@Data
public class ReplyVO {

	private long rno;
	private long bno;
	private String reply;
	private String replyer;
	private String replydate;
	private String updatedate;
}
