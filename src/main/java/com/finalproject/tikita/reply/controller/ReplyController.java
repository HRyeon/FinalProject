package com.finalproject.tikita.reply.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.tikita.board.model.service.BoardService;
import com.finalproject.tikita.board.model.vo.Alarm;
import com.finalproject.tikita.member.model.service.MemberService;
import com.finalproject.tikita.reply.model.service.ReplyService;
import com.finalproject.tikita.reply.model.vo.Reply; 


/**
 * Handles requests for the application home page.
 */

@Controller 
public class ReplyController {

	@Autowired
	private ReplyService rService;
	
	@Autowired
	private MemberService mService; // 성은추가------------------------------
	
	@Autowired
	private BoardService bService; // 성은추가------------------------------


	@RequestMapping("rInsert")
	public void unfollow(@RequestParam("rContent") String rContent, @RequestParam("bNum") int bNum, ModelAndView mv, HttpSession session, HttpServletResponse response) {	

		int mNum = (int)session.getAttribute("sessionId");

		Reply reply = new Reply();
		reply.setbNum(bNum);
		reply.setrContent(rContent);
		reply.setmNum(mNum);

		int result = rService.replyInsert(reply); 

		ArrayList<Reply> Reply = rService.getReply(bNum);
		mv.addObject("Reply",Reply);
		
		// 좋아요 추가시 알림테이블에도 데이터 추가
		int aMem = mService.selectAmem(bNum); // 알림받을 회원
		String aUrl = "bDetail.bo?bNum="+bNum;
				
		Alarm a = new Alarm(aMem, mNum, "reply", bNum, aUrl);
		int aResult = bService.insertLoveAlarm(a);


		String ajaxreturn = "error";
		if(result > 0) {
			ajaxreturn = "success";
		}
		
		try {
			response.getWriter().print(ajaxreturn);
		} catch (IOException e) { 
			e.printStackTrace();
		}
	}
	
	@RequestMapping("rInsert2")
	   public void ReplyInsert2(@RequestParam("rContent") String rContent, @RequestParam("bNum") int bNum,@RequestParam("rNum") int rNum, ModelAndView mv, HttpSession session, HttpServletResponse response) {   

	      int mNum = (int)session.getAttribute("sessionId");

	      Reply reply = new Reply();
	      reply.setbNum(bNum);
	      reply.setrContent(rContent);
	      reply.setmNum(mNum);
	      reply.setRef_rNum(rNum);
 
	  

	      int result = rService.replyInsert2(reply); 
	   

	      ArrayList<Reply> Reply = rService.getReply(bNum);
	      mv.addObject("Reply",Reply);
	      
	      // 좋아요 추가시 알림테이블에도 데이터 추가
	      int aMem = mService.selectAmem(bNum); // 알림받을 회원
	      String aUrl = "bDetail.bo?bNum="+bNum;
					
	      Alarm a = new Alarm(aMem, mNum, "reply", bNum, aUrl);
	      int aResult = bService.insertLoveAlarm(a);


	      String ajaxreturn = "error";
	      if(result > 0) {
	         ajaxreturn = "success";
	      }
	      
	      try {
	         response.getWriter().print(ajaxreturn);
	      } catch (IOException e) { 
	         e.printStackTrace();
	      }
	   }
	
    @RequestMapping("rdelete") //댓글 삭제  
      private void replyDelete(Reply reply, @RequestParam("rNum") int rNum, ModelAndView mv,HttpServletResponse response) throws Exception{
       
        rService.replydelete(rNum);
        rService.replydeleteTogether(rNum);
       
       
       ArrayList<Reply> Reply = rService.getReply(reply.getbNum());
    
       mv.addObject("Reply",Reply); 
     
       String ajaxreturn = "success";
	     
	      
	      try {
	         response.getWriter().print(ajaxreturn);
	      } catch (IOException e) { 
	         e.printStackTrace();
	      }
    }
    
}