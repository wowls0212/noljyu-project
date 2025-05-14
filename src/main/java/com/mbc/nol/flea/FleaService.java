package com.mbc.nol.flea;

import java.util.ArrayList;


public interface FleaService {

	void fleainsert(String id, String fleatitle, String fleadetail, String fleaimg, String fleatype);

	ArrayList<FleaDTO> fleaout(FleaPageDTO dto);

	FleaDTO fleadetailout(int fleanum);

	ArrayList<FleaReviewDTO> fleareviewout(int fleanum, FleaPageDTO pdto);

	void fleareview(int fleanum, String id, String review, String posttype);

	FleaReviewDTO flearere(int reviewnum);

	void fleareinsert(int fleanum, String id, String fleareview, int fleagroups, int fleastep, int fleaindent, String posttype);

	FleaDTO fleaupdateout(int fleanum);

	void fleaupdate(int fleanum, String fleatitle, String fleadetail);

	void fleaupdateimg(int fleanum, String fleatitle, String fleadetail, String fleaimg);

	void fleadelete(int fleanum);

	int fleadeletecheck(int fleanum);

	ArrayList<FleaDTO> fleasearchall(String fleavalue);

	ArrayList<FleaDTO> fleasearch(String fleakey, String fleavalue);

	int fleatotal();

	int fleareviewtotal(int fleanum);

	FleaReviewDTO rereout(int reviewnum);

	void fleastepup(int groups, int step);

	int rerecheck(String review);


	void fleareviewupdate(int reviewnum, String review);

	int fleareviewcheck(String review);

	void fleareviewdelete(int reviewnum);

	int fleareviewdeletecheck(int reviewnum);

	void fleacnt(int fleanum);

	FleaDTO fbest();

	void good(int postnum);

}
