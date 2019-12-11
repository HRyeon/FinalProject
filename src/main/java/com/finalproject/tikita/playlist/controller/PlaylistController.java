package com.finalproject.tikita.playlist.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.tikita.board.model.service.BoardService;
import com.finalproject.tikita.board.model.vo.Board;
import com.finalproject.tikita.member.model.service.MemberService;
import com.finalproject.tikita.playlist.model.service.PlaylistService;
import com.finalproject.tikita.playlist.model.vo.Playlist;
import com.finalproject.tikita.reply.model.vo.Reply;

@Controller
public class PlaylistController {
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private PlaylistService pService;
	
	@RequestMapping("PlayList.pl")
	 
		public ModelAndView playList(HttpSession session) {
	
		
		ModelAndView mv = new ModelAndView();
		int mNum=(int)session.getAttribute("sessionId");
		 
		ArrayList<Playlist> list = pService.selectList(mNum);
		
		session.setAttribute("sessionList", list);
		mv.setViewName("player");
		return mv;
		
	}
	 
	@RequestMapping("nlist.pl")
    public void addSong(@RequestParam("bTitle") String bTitle,@RequestParam("bFileName") String bFileName, @RequestParam("bNum") int bNum, ModelAndView mv, HttpSession session, HttpServletResponse response) throws Exception {

	   
    
    //세션에잇는 플리 가져오기 . 
    ArrayList<Playlist> sessionList = new ArrayList<>();
  		  sessionList =(ArrayList<Playlist>) session.getAttribute("sessionList");
    //pnum찾기
    int pNum = pService.getPNum((int)session.getAttribute("sessionId"));
      
    
    //추가한 곡정보 세팅
    Playlist song = new Playlist(bNum, bTitle, bFileName);
    song.setpNum(pNum); 
    //0번에 넣기
    song.setpOrder(0);
    
//    System.out.println(song);
    //순서변경
    for (int i=0;i<sessionList.size();i++) {         
       sessionList.get(i).setpOrder(sessionList.get(i).getpOrder()+1);      
    }      
    
    //리스트에 추가
    sessionList.add(0,song);      
                
    //디비저장       
    for(Playlist pl : sessionList) {
		pl.setbFilename(URLEncoder.encode(pl.getbFilename(), "utf-8"));
	}
//    System.out.println(sessionList);
    
    //현재 다지우기(porder가 싹바뀌엇으니까)
    pService.deletePlaylistBoard(pNum);
    //하나씩 다넣기
    for (int i=0;i<sessionList.size();i++) {         
       pService.insertPlaylistBoard(sessionList.get(i));      
    }
    
    
    
    
    
    String ajaxreturn = "success";      
    try {
       response.getWriter().print(ajaxreturn);
    } catch (IOException e) { 
       e.printStackTrace();
    }
    
    
 
 
 }

		 
	
//	@RequestMapping("nlist1.p1")
//	public Playlist nlist1(HttpServletRequest request) {
//		Playlist p = new Playlist();
//		
//		p.setbTitle((String) request.getAttribute("bt"));
//		
//		
//		System.out.println(p);
//		
//		return p;
//	}

	
	@RequestMapping("pInsert.pl")
	public void addPlaylist(@RequestParam("pName") String pName,ModelAndView mv, HttpSession session, HttpServletResponse response) {
		
		
		int mNum = (int)session.getAttribute("sessionId");

		Playlist playlist = new Playlist();
		playlist.setmNum(mNum);
		playlist.setpName(pName);
		
//		Playlist check = new Playlist();
//		check.setpNum(-1);
		Playlist check = pService.checkpname(playlist);
		
		int result2=0;
		
		if (check==null) {
		
		result2 = pService.addPlaylist(playlist); 
		}

		ArrayList<Playlist> Playlist = pService.getPlaylist(mNum);
		mv.addObject("Playlist",Playlist);
		
		


		String ajaxreturn = "error";
		if(result2 > 0) {
			ajaxreturn = "success";
		}
		
		//여기서 실패해서 보내는것이 아니고 이미 데이터베이스에 들어온상태(성공한상태)로 ajax로 보내지기때문에 success만 보내진다!
		try {
			response.getWriter().print(ajaxreturn);
		} catch (IOException e) { 
			e.printStackTrace();
		}
	}
	@RequestMapping("playlistdetail.pl")
	public ModelAndView playlistDetail(HttpSession session, @RequestParam("pNum") int pNum, ModelAndView mv) {
		
		Playlist p = pService.playlistDetail(pNum);
		ArrayList<Board> blistInplist=pService.selectPlaylistBoardList(p.getpNum());
		p.setBlist(blistInplist);
		mv.addObject("p",p);
		
		int pfollowerCount = mService.getFollowerCount(p.getmNum());
		int ptrackCount = bService.getTrackCount(p.getmNum());
		mv.addObject("pfollowerCount",pfollowerCount).addObject("ptrackCount",ptrackCount);
		
		
		mv.setViewName("playlistDetail");
		return mv;
		
	}
	
	@RequestMapping("plistbyId.pl")
	public ModelAndView plistbyId(@RequestParam("bNum") int bNum, HttpSession session, ModelAndView mv) {
//		System.out.println(bNum);
		int mNum = (int)session.getAttribute("sessionId");
		
		ArrayList<Playlist> plist = pService.plistbyId(mNum);
//		System.out.println(plist);
		
		// plist에 속한 각각의 board 조회, blistInplist에 담기
		for(int i=0; i<plist.size(); i++) {
			ArrayList<Board> blistInplist = pService.selectPlaylistBoardList(plist.get(i).getpNum());
			 
//			System.out.println("blistInplist: " + blistInplist);
			
		 
			
			
			if(blistInplist.size() != 0) {
				
				  
				plist.get(i).setpImg(blistInplist.get(0).getbImgName()); // 플레이리스트 대표사진 설정
//				System.out.println(plist.get(i).getpImg());
				
			}else {
				plist.get(i).setpImg("\\uploadFiles\\imgs\\default.jpg");
			}
		}
		
		
		mv.addObject("plistbyId", plist).addObject("bNum",bNum)
		  .setViewName("jsonView");
		  //.setViewName("common/playlist_select");
		return mv;
		
	}
	
	 @RequestMapping("nowpldelete") //현재생목록삭제
		public void playlistDelete(@RequestParam("wNum")int wNum,HttpSession session,HttpServletResponse response){


//		   	System.out.println(pService.deletePlaylist(wNum));
		   
		   	  
		   	int mNum = (int)session.getAttribute("sessionId");
		   	int pNum = pService.getPNum(mNum);
		   	
			Playlist num = new Playlist();
			num.setpNum(pNum);
			num.setpOrder(wNum);
			int result = pService.deletePlaylist(num); 
			
			
		    pService.updatePlaylist(wNum);
		    


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
	
	@RequestMapping("mInsert.pl")
	public void mInsert(@RequestParam("bNum")int bNum,@RequestParam("pNum")int pNum, HttpServletResponse response) throws Exception {


		//세션에잇는 플리 가져오기 . 
	    ArrayList<Playlist> pList = new ArrayList<>();
	    pList = pService.getPlaylistBoard(pNum);
	    
	     
	     
	      
	    
	    //추가한 곡정보 세팅
	    
	    Playlist song = new Playlist();
	    song.setbNum(bNum);
	    song.setpNum(pNum);  
	    song.setpOrder(0);
	    
//	    System.out.println(song);
	    //순서변경
	    for (int i=0;i<pList.size();i++) {         
	    	pList.get(i).setpOrder(pList.get(i).getpOrder()+1);      
	    }      
	    
	    //리스트에 추가
	    pList.add(0,song);      
	                
	    //디비저장       
	   
//	    System.out.println(pList);
	    
	    //현재 다지우기(porder가 싹바뀌엇으니까)
	    pService.deletePlaylistBoard(pNum);
	    //하나씩 다넣기
	    for (int i=0;i<pList.size();i++) {         
	       pService.insertPlaylistBoard(pList.get(i));      
	    }
	    
	}

}
