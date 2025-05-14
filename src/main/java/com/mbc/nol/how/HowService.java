package com.mbc.nol.how;

import java.util.ArrayList;

public interface HowService {

	void howinsert(String id, String howtitle, String howdetail, String howimg, String howtype);

	ArrayList<HowDTO> howout(HowPageDTO dto);

	HowDTO howdetailout(int hownum);

	void howreview(int hownum, String id, String review, String posttype);

	ArrayList<HowReviewDTO> howreviewout(int hownum, HowPageDTO pdto);

	HowReviewDTO howrere(int hownum);

	void howstepup(int groups, int step);

	void howreinsert(int hownum, String id, String review, int groups, int step, int indent, String posttype);

	HowDTO howupdateout(int hownum);

	void howupdate(int hownum, String howtitle, String howdetail);

	void howupdateimg(int hownum, String howtitle, String howdetail, String howimg);

	void howdelete(int hownum);

	int howdeletecheck(int hownum);

	ArrayList<HowDTO> howsearch(String howkey, String howvalue);

	ArrayList<HowDTO> howsearchall(String howvalue);

	void howreviewupdate(int reviewnum, String reveiwContentUpdate);

	int howreviewcheck(String reveiwContentUpdate);

	void howreviewdelete(int reviewnum);

	int howreviewdeletecheck(int reviewnum);

	int howtotal();

	int howreviewtotal(int hownum);

	HowReviewDTO rereout(int reviewnum);

	int rerecheck(String review);

	HowDTO postreport(int num, String id);

	void reportsubmit(int rpostnum);

	HowReviewDTO reviewreport(int num, int postnum);

	void reviewreportdel(int postnum, int reviewnum);

	void howcnt(int hownum);

	void good(int postnum);

	HowDTO bestpost(int postnum);

	HowDTO best();

	ArrayList<HowDTO> mypost(String loginId);

	int goodtotal(String loginId);


}
