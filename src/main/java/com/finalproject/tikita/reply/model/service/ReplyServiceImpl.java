package com.finalproject.tikita.reply.model.service;
 
 
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.finalproject.tikita.reply.model.dao.ReplyDAO;
import com.finalproject.tikita.reply.model.vo.Reply;
  
//@Component // bean으로 등록


@Service("rService")
public class ReplyServiceImpl implements ReplyService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReplyDAO rDAO;	 
	
	 
	@Override
	public int getReplyCount(int bNum) {

		return rDAO.getReplyCount(sqlSession, bNum);
	}


	@Override
	public ArrayList<Reply> getReply(int bNum) {
		 
		return rDAO.getReply(sqlSession, bNum); 
	}


	@Override
	public int replyInsert(Reply reply) {
		 
		return rDAO.replyInsert(sqlSession, reply);
	}
	@Override
	   public int replyInsert2(Reply reply) {
	      return rDAO.replyInsert2(sqlSession, reply);
	   }
	  @Override
	   public int replydelete(int rNum) {
	       
	      return rDAO.replydelete(sqlSession, rNum);
	   }


	@Override
	public int replydeleteTogether(int rNum) {
	 
		return rDAO.replydeleteTogether(sqlSession, rNum);
	}
	 

}








