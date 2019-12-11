package com.finalproject.tikita.board.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.tikita.board.model.service.BoardService;
import com.finalproject.tikita.board.model.vo.Alarm;
import com.finalproject.tikita.board.model.vo.Board;
import com.finalproject.tikita.board.model.vo.Love;
import com.finalproject.tikita.member.model.service.MemberService;
import com.finalproject.tikita.member.model.vo.Follow;
import com.finalproject.tikita.member.model.vo.Member;
import com.finalproject.tikita.playlist.model.service.PlaylistService;
import com.finalproject.tikita.playlist.model.vo.Playlist;
import com.finalproject.tikita.reply.model.service.ReplyService;
import com.finalproject.tikita.reply.model.vo.Reply;
import com.mpatric.mp3agic.ID3v2;
import com.mpatric.mp3agic.InvalidDataException;
import com.mpatric.mp3agic.Mp3File;
import com.mpatric.mp3agic.UnsupportedTagException; 

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	@Autowired
	private MemberService mService;

	@Autowired
	private PlaylistService pService;
	@Autowired
	private ReplyService rService;


	@RequestMapping("iframe")
	public String goToIframe() {		 		 
		return "iframe";
	} 	

	@RequestMapping("blist.me") 
	public ModelAndView boardList(HttpSession session, ModelAndView mv) {

		int mNum= (int) session.getAttribute("sessionId");
		ArrayList<Board> feed = bService.feedList(mNum);

		ArrayList<Integer> feedLikeCount = new ArrayList<>();
		ArrayList<Integer> feedReplyCount = new ArrayList<>();

		for (int i=0;i<feed.size();i++) {
			feedLikeCount.add(bService.getFeedLikeCount(feed.get(i).getbNum()));
			feedReplyCount.add(bService.getFeedReplyCount(feed.get(i).getbNum()));      
		}

		int sessionId= (int) session.getAttribute("sessionId");
		// 로그인한 회원이 좋아요한 게시글 번호 저장
		ArrayList<Integer> myLoveblist = bService.myLoveblist(sessionId);		
		for(int i=0; i<myLoveblist.size(); i++) {
			for(int j=0; j<feed.size(); j++) {
				if(myLoveblist.get(i) == feed.get(j).getbNum()) {
					feed.get(j).setLlike(true);
					break;
				}
			}
		}

		//사이드
		int trackCount = bService.getTrackCount(mNum);
		int likedCount = bService.getLikedCount(mNum); //그 사람이 쓴글에 좋아요 눌린 갯수
		int followerCount = mService.getFollowerCount(mNum);
		int followingCount = mService.getFollowingCount(mNum);
		int likeCount = bService.getLikeCount(mNum); //그 사람이 좋아요 누른 글 갯수



		ArrayList<Board> likeList = bService.getBoardLikeList(mNum);
		ArrayList<Member> FollowerList = mService.getFollowerList(mNum);
		ArrayList<Member> FollowingList = mService.getFollowingList(mNum);

		// feed에 속한 각각의 board의 태그 조회, tlist에 담기
		for(int i=0; i<feed.size(); i++) {
			ArrayList<String> tlist = bService.selectBoardTagList(feed.get(i).getbNum());
//			System.out.println("tlist: " + tlist);
			feed.get(i).setTlist(tlist);
		}

		ArrayList<Integer> followingTrackCount = new ArrayList<>();
		ArrayList<Integer> followingFollowerCount = new ArrayList<>();	
		ArrayList<Integer> followingLikedCount = new ArrayList<>();	

		ArrayList<Integer> followerTrackCount = new ArrayList<>();
		ArrayList<Integer> followerFollowerCount = new ArrayList<>();	
		ArrayList<Integer> followerLikedCount = new ArrayList<>();	

		ArrayList<Integer> likeListLikeCount = new ArrayList<>();
		ArrayList<Integer> likeListReplyCount = new ArrayList<>();

		for (int i =0;i<FollowingList.size();i++) { 
			followingLikedCount.add(bService.getLikedCount(FollowingList.get(i).getmNum()));
			followingTrackCount.add(bService.getTrackCount(FollowingList.get(i).getmNum()));
			followingFollowerCount.add(mService.getFollowerCount(FollowingList.get(i).getmNum()));
		}
		for (int i =0;i<FollowerList.size();i++) { 
			followerLikedCount.add(bService.getLikedCount(FollowerList.get(i).getmNum()));
			followerTrackCount.add(bService.getTrackCount(FollowerList.get(i).getmNum()));
			followerFollowerCount.add(mService.getFollowerCount(FollowerList.get(i).getmNum()));
		}		
		for (int i =0;i<likeList.size();i++) {
			likeListLikeCount.add(bService.getBoardLikeCount(likeList.get(i).getbNum()));
			likeListReplyCount.add(rService.getReplyCount(likeList.get(i).getbNum()));
		}

		mv.addObject("followerC", followerCount ).addObject("followingC",followingCount)
		.addObject("trackC", trackCount).addObject("likeC",likeCount).addObject("likedC",likedCount);
		mv.addObject("likeList",likeList).addObject("FollowerList",FollowerList).addObject("FollowingList",FollowingList);
		mv.addObject("feed", feed).addObject("feedLikeCount", feedLikeCount).addObject("feedReplyCount", feedReplyCount);
		mv.addObject("followingTrackCount",followingTrackCount ).addObject("followingFollowerCount",followingFollowerCount).addObject("followingLikedCount",followingLikedCount);
		mv.addObject("followerTrackCount",followerTrackCount ).addObject("followerFollowerCount",followerFollowerCount).addObject("followerLikedCount",followerLikedCount);
		mv.addObject("likeListLikeCount", likeListLikeCount).addObject("likeListReplyCount",likeListReplyCount );


		mv.setViewName("main");

		return mv;
	}

	@RequestMapping("bDetail.bo")
	public ModelAndView boardDetail(HttpSession session, @RequestParam("bNum") int bNum, ModelAndView mv) {

		Board b = bService.feedDetail(bNum);
		mv.addObject("b",b);
		int likeCount = bService.getFeedLikeCount(b.getbNum());
		int followerCount = mService.getFollowerCount(b.getmNum());
		int trackCount = bService.getTrackCount(b.getmNum());
		mv.addObject("likeCount",likeCount).addObject("followerCount",followerCount).addObject("trackCount",trackCount);

		int replyCount = bService.getFeedReplyCount(b.getbNum());     
		mv.addObject("replyCount",replyCount);

		ArrayList<Reply> Reply = rService.getReply(b.getbNum());
		mv.addObject("Reply",Reply);			
		int sessionId= (int) session.getAttribute("sessionId");		
		
		// 로그인한 회원이 좋아요한 게시글 번호 저장
		ArrayList<Integer> myLoveblist = bService.myLoveblist(sessionId);		
		for(int i=0; i<myLoveblist.size(); i++) {
			if(myLoveblist.get(i) == bNum) {
				b.setLlike(true);
				break;
			}
		}
		
		// blist에 속한 각각의 board의 태그 조회, tlist에 담기
		ArrayList<String> tlist = bService.selectBoardTagList(b.getbNum());
//		System.out.println("tlist: " + tlist);
		b.setTlist(tlist);
		
		Follow followCheck = new Follow();
		followCheck.setFollowing(sessionId);
		followCheck.setFollowed(b.getmNum());
		
		int followCheckResult = mService.followCheck(followCheck);
		mv.addObject("followCheckResult",followCheckResult);
	

		mv.setViewName("boardDetail");
		return mv;
	}

	@RequestMapping("bSearchList.bo")
	public ModelAndView boardSearchList(HttpSession session, @RequestParam("search")String search,ModelAndView mv) {
		int sessionId= (int) session.getAttribute("sessionId");
		
		
//		System.out.println("search: " + search); // 검색값이 제대로 들어갔는지 확인
		ArrayList<Board> blist = bService.selectSearchList(search);  // 검색결과 게시물 리스트를 가져옴
		ArrayList<Member> mlist = mService.selectSearchList(search); // 검색결과 사람 리스트를 가져옴
//		System.out.println("blist: " + blist);
//		System.out.println("mlist: " + mlist);
		
		//검색결과 회원이 팔로우 상태인지 확인 하는부분 
		ArrayList<Follow> followcheck = new ArrayList<>();
		for ( int i= 0;i<mlist.size();i++) {
			Follow f = new Follow();
			f.setFollowing(sessionId);
			f.setFollowed(mlist.get(i).getmNum());
			followcheck.add(f);
		}
		
		ArrayList<Integer> followcheckresult = new ArrayList<>();
		for ( int i= 0;i<mlist.size();i++) {
			int r = mService.followCheck(followcheck.get(i));
			followcheckresult.add(r);
		}
		
		ArrayList<Integer> trackCount = new ArrayList<>();
		for(int i=0;i<mlist.size();i++) {
			int trackResult = bService.getTrackCount(mlist.get(i).getmNum());
			trackCount.add(trackResult);
		}
		
		ArrayList<Integer> followerCount = new ArrayList<>();
		for(int i=0;i<mlist.size();i++) {
			int follwerResult = mService.getFollowerCount(mlist.get(i).getmNum());
			followerCount.add(follwerResult);
			
		}
		
		
		
		 
		mv.addObject("followcheckresult",followcheckresult)
		  .addObject("followerCount",followerCount)
		  .addObject("trackCount",trackCount);
		
		
		// blist에 속한 각각의 board의 태그 조회, tlist에 담기
		for(int i=0; i<blist.size(); i++) {
			ArrayList<String> tlist = bService.selectBoardTagList(blist.get(i).getbNum());
//			System.out.println("tlist: " + tlist);
			blist.get(i).setTlist(tlist);
		}
		
		// 관련 태그들 조회
		ArrayList<String> tSearchList = bService.selectTagSearchList(search);
//		System.out.println("tSearchList: " + tSearchList);
		
		// 특정 태그가 포함된 게시물 리스트
		ArrayList<Board> blistInTag = bService.selectTagBoardList(search);
//		System.out.println("blistInTag: " + blistInTag);
		
		// blistInTag에 속한 각각의 board의 태그 조회, tlist에 담기
		for(int i=0; i<blistInTag.size(); i++) {
			ArrayList<String> tlist = bService.selectBoardTagList(blistInTag.get(i).getbNum());
//			System.out.println("blistInTagtlist: " + tlist);
			blistInTag.get(i).setTlist(tlist);
		}
		
		// search로 Playlist 조회
		ArrayList<Playlist> pSearchList = pService.selectSearchList(search);
//		System.out.println("pSearchList: " + pSearchList);
		
		// plist에 속한 각각의 board 조회, blistInplist에 담기
		for(int i=0; i<pSearchList.size(); i++) {
			ArrayList<Board> blistInplist = pService.selectPlaylistBoardList(pSearchList.get(i).getpNum());
//			System.out.println("blistInplist: " + blistInplist);
			pSearchList.get(i).setBlist(blistInplist);
		}
		
		// 피드별 좋아요 숫자 받아오기
		ArrayList<Integer> feedLikeCount = new ArrayList<>();
		ArrayList<Integer> feedReplyCount = new ArrayList<>();
		for (int i=0;i<blist.size();i++) {
			feedLikeCount.add(bService.getFeedLikeCount(blist.get(i).getbNum()));
			feedReplyCount.add(bService.getFeedReplyCount(blist.get(i).getbNum()));
			
		}
//		System.out.println(feedLikeCount+"확인해주세요");
		
		//태그검색시 피드의 댓글수 받아오기
		ArrayList<Integer> feedLikeCount2 = new ArrayList<>();
		ArrayList<Integer> feedReplyCount2 = new ArrayList<>();
		for (int i=0;i<blistInTag.size();i++) {
			feedLikeCount2.add(bService.getFeedLikeCount(blistInTag.get(i).getbNum()));
			feedReplyCount2.add(bService.getFeedReplyCount(blistInTag.get(i).getbNum()));      
		}	
//		System.out.println(feedLikeCount2+"확인해볼까요");
		
		// 로그인한 회원이 좋아요한 게시글 번호 저장
		ArrayList<Integer> myLoveblist = bService.myLoveblist(sessionId);
		for(int i=0; i<myLoveblist.size(); i++) {
			for(int j=0; j<blist.size(); j++) {
				if(myLoveblist.get(i) == blist.get(j).getbNum()) {
					blist.get(j).setLlike(true);
					break;
				}
			}
		}		
		
		for(int i=0; i<myLoveblist.size(); i++) {
			for(int j=0; j<blistInTag.size(); j++) {
				if(myLoveblist.get(i) == blistInTag.get(j).getbNum()) {
					blistInTag.get(j).setLlike(true);
					break;
				}
			}
		}
		
		if(blist != null) { // 데이터가 잘 들어왔으면
			mv.addObject("search", search)
			.addObject("bSearchList", blist)
			.addObject("mSearchList", mlist)
			.addObject("tSearchList", tSearchList)
			.addObject("pSearchList", pSearchList)
			.addObject("blistInTag", blistInTag)
			.addObject("feedLikeCount", feedLikeCount)
			.addObject("feedReplyCount", feedReplyCount)
			.addObject("feedLikeCount2", feedLikeCount2)
			.addObject("feedReplyCount2", feedReplyCount2)
			.addObject("myLoveblist", myLoveblist)
			.setViewName("searchResult");
		}
		

		return mv;
	}

	@RequestMapping("boardform.me") 
	public ModelAndView boardform(HttpSession session, ModelAndView mv) {	 
		mv.setViewName("boardform");
		return mv;
	}
	@RequestMapping("boardwrite.me") 
	public ModelAndView boardwrite( HttpServletRequest request, 
			@RequestParam(value="upup", required = false) MultipartFile file, 
			@RequestParam("Artist") String Artist,
			@RequestParam("Title") String Title,
			@RequestParam("Content") String Content,
			@RequestParam("tagArea") String tagArea,
			HttpSession session,ModelAndView mv ) throws UnsupportedTagException, InvalidDataException, IOException {	 

		String bArtist = Artist;
		String bTitle = Title;
		String bContent = Content; 

		mv.setViewName("errorpage");
		//빠진거 있으면
		if(bTitle.equals("")) {
			String msg= "title을 입력해주세요";
			mv.addObject("msg",msg);return mv;}
		if(bArtist.equals("")) {
			String msg= "Artist를 입력해주세요";
			mv.addObject("msg",msg);  return mv;}		
		if(bContent.equals("")) {
			String msg= "content를 입력해주세요";
			mv.addObject("msg",msg);return mv;}		
		if(file.getOriginalFilename().equals("")) {
			String msg= "mp3 파일을 업로드 해주세요";
			mv.addObject("msg",msg);return mv;}	

		//mp3파일이 아니면
		String originFileName = file.getOriginalFilename(); 		 
		String ext = originFileName.substring(originFileName.lastIndexOf(".")); // 확장자 분리하기
		if(!ext.equals(".mp3")) { 
			String msg= "mp3 파일을 업로드 해주세요";
			mv.addObject("msg",msg); return mv;}

		//mp3파일이 맞으면  
		int mNum = (int)session.getAttribute("sessionId");

		//mp3 파일 저장하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles\\songs\\";
		String FileName = bArtist+"_"+bTitle+"_"+System.currentTimeMillis();  
		File temp = new File(filePath  + FileName+ext );	 
		try {
			file.transferTo(temp);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//이미지 뽑아서 저장하기
		Mp3File song = new Mp3File(filePath +  FileName+ext);
		String filePath2 = root + "\\uploadFiles\\imgs\\";
		String filePath3 = "\\uploadFiles\\songs\\"+FileName+ext;
		String filePath4 = "\\uploadFiles\\imgs\\" +"default"+".jpg";

		if (song.hasId3v2Tag()){
			ID3v2 id3v2tag = song.getId3v2Tag();
			try {
				byte[] imageData = id3v2tag.getAlbumImage();  
				BufferedImage img = ImageIO.read(new ByteArrayInputStream(imageData));
				try {				 
					ImageIO.write(img, "jpg", new File(filePath2 + FileName+".jpg"));
					filePath4 = "\\uploadFiles\\imgs\\" +FileName+".jpg";
				} catch(Exception e) {
					e.printStackTrace();
				}  
			}catch(Exception e) {
				e.printStackTrace();
			}  
		}


		//		db입력
		Board b = new Board();
		b.setbArtist(bArtist);
		b.setbContent(bContent);
		b.setbTitle(bTitle);
		b.setbFileName(filePath3);
		b.setbImgName(filePath4);
		b.setmNum(mNum);
		bService.boardWrite(b);

		String[] tagArray = tagArea.split("#");

		for(int i=1; i<tagArray.length; i++) {
			bService.insertTag(tagArray[i]);
		}

		mv.setViewName("redirect:mypage?mNum=" + mNum);
		return mv;
	}

	@RequestMapping("boardDelete") //게시물삭제
	public String boardDelete(@RequestParam("bNum")int bNum,HttpSession session){
		int mNum = (int)session.getAttribute("sessionId");

		bService.boardDelete(bNum);
		return "redirect:mypage?mNum="+mNum;

	}

	@RequestMapping("lInsert.lo")
	public ModelAndView insertLike(@RequestParam("bNum")int bNum,@RequestParam("mNum")int mNum, HttpServletRequest request, ModelAndView mv) {

//		System.out.println("lInsert bNum: " + bNum);

		Love l = new Love(mNum, bNum);	
		int result = bService.insertLike(l);

		// 좋아요 추가시 알림테이블에도 데이터 추가
		int aMem = mService.selectAmem(bNum); // 알림받을 회원
		String aUrl = "bDetail.bo?bNum="+bNum;

		System.out.println("aMem: " + aMem);

		Alarm a = new Alarm(aMem, mNum, "love", bNum, aUrl);
		int aResult = bService.insertLoveAlarm(a);

		mv.setViewName("jsonView");

		if(result > 0) {
			return mv;
		} else {
			System.out.println("에러");
			return null;
		}	
	}

	@RequestMapping("lDelete.lo")
	public ModelAndView deleteLike(@RequestParam("bNum")int bNum,@RequestParam("mNum")int mNum, HttpServletRequest request, ModelAndView mv) {

//		System.out.println("lDelete bNum: " + bNum);
		Love l = new Love(mNum, bNum);
		mv.setViewName("jsonView");
		int result = bService.deleteLike(l);
		if(result > 0) {
			return mv;
		} else {
			System.out.println("에러");
			return null;
		}		
	}

	//인기차트 불러오기
	@RequestMapping("best")
	public ModelAndView bestList(ModelAndView mv,HttpSession session) {
		int sessionId= (int) session.getAttribute("sessionId");

		ArrayList<Board> best = bService.bestList();

		for (int i = 0; i < best.size(); i++)
		{
			int bNum = best.get(i).getbNum();

			best.get(i).setrCount(bService.getFeedReplyCount(bNum));
		}

		// 로그인한 회원이 좋아요한 게시글 번호 저장
		ArrayList<Integer> myLoveblist = bService.myLoveblist(sessionId);

		for(int i=0; i<myLoveblist.size(); i++) {
			for(int j=0; j<best.size(); j++) {
				if(myLoveblist.get(i) == best.get(j).getbNum()) {
					best.get(j).setLlike(true);
					break;
				}
			}
		}

		// best에 속한 각각의 board의 태그 조회, tlist에 담기
		for(int i=0; i<best.size(); i++) {
			ArrayList<String> tlist = bService.selectBoardTagList(best.get(i).getbNum());
			System.out.println("tlist: " + tlist);
			best.get(i).setTlist(tlist);
		}
		
		if(best != null)
		{
			mv.addObject("best",best).setViewName("best");
		}


		//사이드
		int mNum = sessionId;
		int trackCount = bService.getTrackCount(mNum);
		int likedCount = bService.getLikedCount(mNum); //그 사람이 쓴글에 좋아요 눌린 갯수
		int followerCount = mService.getFollowerCount(mNum);
		int followingCount = mService.getFollowingCount(mNum);
		int likeCount = bService.getLikeCount(mNum); //그 사람이 좋아요 누른 글 갯수

		mv.addObject("followerC", followerCount ).addObject("followingC",followingCount)
		.addObject("trackC", trackCount).addObject("likeC",likeCount).addObject("likedC",likedCount);

		ArrayList<Board> likeList = bService.getBoardLikeList(mNum);
		ArrayList<Member> FollowerList = mService.getFollowerList(mNum);
		ArrayList<Member> FollowingList = mService.getFollowingList(mNum);

		mv.addObject("likeList",likeList).addObject("FollowerList",FollowerList).addObject("FollowingList",FollowingList);

		ArrayList<Integer> followingTrackCount = new ArrayList<>();
		ArrayList<Integer> followingFollowerCount = new ArrayList<>();	
		ArrayList<Integer> followingLikedCount = new ArrayList<>();	

		ArrayList<Integer> followerTrackCount = new ArrayList<>();
		ArrayList<Integer> followerFollowerCount = new ArrayList<>();	
		ArrayList<Integer> followerLikedCount = new ArrayList<>();	

		ArrayList<Integer> likeListLikeCount = new ArrayList<>();
		ArrayList<Integer> likeListReplyCount = new ArrayList<>();

		for (int i =0;i<FollowingList.size();i++) { 
			followingLikedCount.add(bService.getLikedCount(FollowingList.get(i).getmNum()));
			followingTrackCount.add(bService.getTrackCount(FollowingList.get(i).getmNum()));
			followingFollowerCount.add(mService.getFollowerCount(FollowingList.get(i).getmNum()));
		}
		for (int i =0;i<FollowerList.size();i++) { 
			followerLikedCount.add(bService.getLikedCount(FollowerList.get(i).getmNum()));
			followerTrackCount.add(bService.getTrackCount(FollowerList.get(i).getmNum()));
			followerFollowerCount.add(mService.getFollowerCount(FollowerList.get(i).getmNum()));
		}		
		for (int i =0;i<likeList.size();i++) {
			likeListLikeCount.add(bService.getBoardLikeCount(likeList.get(i).getbNum()));
			likeListReplyCount.add(rService.getReplyCount(likeList.get(i).getbNum()));
		}



		mv.addObject("followingTrackCount",followingTrackCount ).addObject("followingFollowerCount",followingFollowerCount).addObject("followingLikedCount",followingLikedCount);
		mv.addObject("followerTrackCount",followerTrackCount ).addObject("followerFollowerCount",followerFollowerCount).addObject("followerLikedCount",followerLikedCount);
		mv.addObject("likeListLikeCount", likeListLikeCount).addObject("likeListReplyCount",likeListReplyCount );

		return mv;
	}


	@RequestMapping("alarm")
	@ResponseBody
	public ModelAndView alarm(ModelAndView mv,@RequestParam("mNum")int mNum) {

		ArrayList<Alarm> alarm = bService.alarmList(mNum);

		if(alarm != null)
		{
			mv.addObject("alarm",alarm);
			mv.setViewName("jsonView");
		}

		return mv;
	}

	@RequestMapping("updateAlarm")
	public void updateAlarm(@RequestParam("aNum")int aNum) {

		int result = bService.updateAlarm(aNum);

		if (result > 0)
		{
//			System.out.println("update 성공");
		} else
		{
//			System.out.println("update 실패");
		}

	}
}
