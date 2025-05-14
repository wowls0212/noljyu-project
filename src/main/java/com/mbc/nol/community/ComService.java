package com.mbc.nol.community;

import java.util.ArrayList;

public interface ComService {

	void comsave(String id, String comtitle, String comdetail, String comimg, String comtype);

	ArrayList<ComDTO> comout(ComPageDTO dto);

	ComDTO comdetail(int comnum);

	void comreview(int comnum, String id, String review, String posttype);

	ArrayList<ComReviewDTO> comreviewout(int comnum, ComPageDTO pdto);

	ComReviewDTO comrere(int comreviewnum);

	void comstepup(int groups, int step);

	void comreinsert(int comnum, String id, String comreview, int comgroups, int comstep, int comindent, String posttype);

	ComDTO comupdateout(int comnum);

	void comupdate(int comnum, String comtitle, String comdetail);

	void comupdateimg(int comnum, String comtitle, String comdetail, String comimg);

	void comdelete(int comnum);

	int comdeletecheck(int comnum);

	ArrayList<ComDTO> comsearchall(String comvalue);

	ArrayList<ComDTO> comsearch(String comkey, String comvalue);

	int comtotal();

	int comreviewtotal(int comnum);

	ComReviewDTO comrereout(int reviewnum);

	int comrerecheck(String review);

	void comreviewupdate(int reviewnum, String review);

	int comreviewcheck(String review);

	void comreviewdelete(int reviewnum);

	int comreviewdeletecheck(int reviewnum);

	void comcnt(int comnum);

	void good(int postnum);

	ComDTO cbest();

	
}
