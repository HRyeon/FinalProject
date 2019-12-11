package com.finalproject.tikita.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.tikita.board.model.service.BoardService;
import com.finalproject.tikita.board.model.vo.Alarm;
import com.finalproject.tikita.board.model.vo.Board;
import com.finalproject.tikita.member.model.service.MemberService;
import com.finalproject.tikita.member.model.vo.Follow;
import com.finalproject.tikita.member.model.vo.Member;
import com.finalproject.tikita.playlist.model.service.PlaylistService;
import com.finalproject.tikita.playlist.model.vo.Playlist;
import com.finalproject.tikita.reply.model.service.ReplyService; 


/**
 * Handles requests for the application home page.
 */

@Controller 
public class MemberController {

	@Autowired
	private MemberService mService;

	@Autowired
	private BoardService bService;

	@Autowired
	private ReplyService rService;
	@Autowired
	private PlaylistService pService;

	@RequestMapping("mypage")
	public ModelAndView goToMypage(@RequestParam("mNum") int mNum, ModelAndView mv, HttpSession session) {	

		Member m = mService.getMemberInfo(mNum); //페이지주인
		int sessionId = (int)session.getAttribute("sessionId");//로그인아이디

		mv.addObject("member", m);
		//1,2번
		ArrayList<Board> allMy = bService.getAllMyList(m.getmNum());
		ArrayList<Board> allLike = bService.getAllLikeList(m.getmNum());

		// allMy에 속한 각각의 board의 태그 조회, tlist에 담기
		for(int i=0; i<allMy.size(); i++) {
			ArrayList<String> tlist = bService.selectBoardTagList(allMy.get(i).getbNum());
//			System.out.println("tlist: " + tlist);
			allMy.get(i).setTlist(tlist);
		}

		// allLike에 속한 각각의 board의 태그 조회, tlist에 담기
		for(int i=0; i<allLike.size(); i++) {
			ArrayList<String> tlist = bService.selectBoardTagList(allLike.get(i).getbNum());
//			System.out.println("tlist: " + tlist);
			allLike.get(i).setTlist(tlist);
		}


		mv.addObject("allMy",allMy).addObject("allLike",allLike);

		ArrayList<Integer> allMyLikeCount = new ArrayList<>();
		ArrayList<Integer> allMyReplyCount = new ArrayList<>();

		for (int i=0;i<allMy.size();i++) {
			allMyLikeCount.add(bService.getFeedLikeCount(allMy.get(i).getbNum()));
			allMyReplyCount.add(bService.getFeedReplyCount(allMy.get(i).getbNum()));      
		}
		ArrayList<Integer> allLikeLikeCount = new ArrayList<>();
		ArrayList<Integer> allLikeReplyCount = new ArrayList<>();

		for (int i=0;i<allLike.size();i++) {
			allLikeLikeCount.add(bService.getFeedLikeCount(allLike.get(i).getbNum()));
			allLikeReplyCount.add(bService.getFeedReplyCount(allLike.get(i).getbNum()));      
		}



		mv.addObject("allMyLikeCount",allMyLikeCount).addObject("allMyReplyCount",allMyReplyCount)
		.addObject("allLikeLikeCount",allLikeLikeCount).addObject("allLikeReplyCount",allLikeReplyCount);


		//플레이리스트불러오기
		ArrayList<Playlist> playlist = pService.getPlaylist(m.getmNum());
		for(int i=0; i<playlist.size(); i++) {
			ArrayList<Board> blistInplist = pService.selectPlaylistBoardList(playlist.get(i).getpNum()); 
			playlist.get(i).setBlist(blistInplist);
		}
		mv.addObject("playlist",playlist);


		// 로그인한 회원이 좋아요한 게시글 번호 저장
		ArrayList<Integer> myLoveblist = bService.myLoveblist(sessionId);

		for(int i=0; i<myLoveblist.size(); i++) {
			for(int j=0; j<allMy.size(); j++) {
				if(myLoveblist.get(i) == allMy.get(j).getbNum()) {
					allMy.get(j).setLlike(true);
					break;
				}
			}
		}

		for(int i=0; i<myLoveblist.size(); i++) {
			for(int j=0; j<allLike.size(); j++) {
				if(myLoveblist.get(i) == allLike.get(j).getbNum()) {
					allLike.get(j).setLlike(true);
					break;
				}
			}
		}

		//사이드
		int trackCount = bService.getTrackCount(m.getmNum());
		int likedCount = bService.getLikedCount(m.getmNum()); //그 사람이 쓴글에 좋아요 눌린 갯수
		int followerCount = mService.getFollowerCount(m.getmNum());
		int followingCount = mService.getFollowingCount(m.getmNum());
		int likeCount = bService.getLikeCount(m.getmNum()); //그 사람이 좋아요 누른 글 갯수

		mv.addObject("followerC", followerCount ).addObject("followingC",followingCount)
		.addObject("trackC", trackCount).addObject("likeC",likeCount).addObject("likedC",likedCount);

		ArrayList<Board> likeList = bService.getBoardLikeList(m.getmNum());
		ArrayList<Member> FollowerList = mService.getFollowerList(m.getmNum());
		ArrayList<Member> FollowingList = mService.getFollowingList(m.getmNum());
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


		Follow followCheck = new Follow();
		followCheck.setFollowing(sessionId);
		followCheck.setFollowed(mNum);

		int followCheckResult = mService.followCheck(followCheck);

		mv.addObject("followCheckResult",followCheckResult);

		mv.setViewName("mypage");
		return mv;
	} 

	@RequestMapping("follow")
	public void follow(@ModelAttribute Follow f,@RequestParam("followed") int followed, ModelAndView mv, HttpSession session) {	

		int following = (int)session.getAttribute("sessionId");

		f.setFollowing(following);
		f.setFollowed(followed);

		mService.addFollow(f);

		//팔로우했을경우 알람테이블에 추가
		String aUrl = "mypage?mNum=" + followed;
		Alarm a = new Alarm(followed, following, "follow", aUrl);
		bService.insertFollowAlarm(a);

	}

	@RequestMapping("unfollow")
	public void unfollow(@ModelAttribute Follow f,@RequestParam("followed") int followed, ModelAndView mv, HttpSession session) {	

		int following = (int)session.getAttribute("sessionId");

		f.setFollowing(following);
		f.setFollowed(followed);

		mService.deleteFollow(f);
	}

	@RequestMapping("pdelete")
	public String playlistDelete(@RequestParam("pNum") int pNum,HttpSession session) {

		int mNum = (int)session.getAttribute("sessionId");
		pService.playlistDelete(pNum);
		return "redirect:mypage?mNum="+mNum;

	}


}
