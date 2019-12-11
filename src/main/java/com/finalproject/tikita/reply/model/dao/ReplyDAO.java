package com.finalproject.tikita.reply.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalproject.tikita.reply.model.vo.Reply;
 
@Repository("rDAO")
public class ReplyDAO   {

	public int getReplyCount(SqlSessionTemplate sqlSession, int bNum) {
		return sqlSession.selectOne("replyMapper.getReplyCount",bNum);
	}

	public ArrayList<Reply> getReply(SqlSessionTemplate sqlSession,int bNum) {
		return (ArrayList)sqlSession.selectList("replyMapper.getReplyInfo",bNum);
	}

	public int replyInsert(SqlSessionTemplate sqlSession, Reply reply) {
	 
		return sqlSession.insert("replyMapper.replyInsert",reply);
	}
	
	public int replyInsert2(SqlSessionTemplate sqlSession, Reply reply) {
	      
	      return sqlSession.insert("replyMapper.replyInsert2",reply);
	   }
	public int replydelete(SqlSessionTemplate sqlSession, int rNum) {
	      return sqlSession.delete("replyMapper.replyDelete",rNum);
	   }

	public int replydeleteTogether(SqlSessionTemplate sqlSession, int rNum) {
		 
		return sqlSession.delete("replyMapper.replyDeleteTogether",rNum);
	}

}









