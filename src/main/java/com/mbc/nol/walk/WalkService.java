package com.mbc.nol.walk;

import java.util.ArrayList;


public interface WalkService {

	void walkinsert(String id, String walktitle, String walkdetail, String walkimg);

	ArrayList<WalkDTO> walkout(WalkPageDTO dto);

	WalkDTO walkdetailout(int walknum);

	ArrayList<WalkReviewDTO> walkreviewout(int walknum);

	void walkreview(int walknum, String id, String walkreview);

	WalkReviewDTO walkrere(int walkreviewnum);

	void walkstepup(int walkgroups, int walkstep);

	void walkreinsert(int walknum, String id, String walkreview, int walkgroups, int walkstep, int walkindent);

	WalkDTO walkupdateout(int walknum);

	void walkupdate(int walknum, String walktitle, String walkdetail);

	void walkupdateimg(int walknum, String walktitle, String walkdetail, String walkimg);

	void walkdelete(int walknum);

	int walkdeletecheck(int walknum);

	ArrayList<WalkDTO> walksearchall(String walkvalue);

	ArrayList<WalkDTO> walksearch(String walkkey, String walkvalue);

	int walktotal();

	void updateWalkCnt(int walknum);

	void wsave(String id, String title, String detail);

	ArrayList<WalkDTO> walklist();

}
