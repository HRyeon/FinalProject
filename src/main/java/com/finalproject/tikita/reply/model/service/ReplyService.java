package com.finalproject.tikita.reply.model.service;

import java.util.ArrayList;

import com.finalproject.tikita.reply.model.vo.Reply;

public interface ReplyService {
	 
	int getReplyCount(int bNum); 
	 
	ArrayList<Reply> getReply(int bNum);

	int replyInsert(Reply reply); 
	
	int replyInsert2(Reply reply); 
	
	 int replydelete(int rNum);

	int replydeleteTogether(int rNum);
 
}
