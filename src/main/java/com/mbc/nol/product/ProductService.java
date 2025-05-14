package com.mbc.nol.product;

import java.util.ArrayList;

import com.mbc.nol.how.HowDTO;

public interface ProductService {

	void productinput(String id, String animal, String productlist, int price, String fname, String productdate, String productname);

	ArrayList<ProductDTO> productout(ProductPageDTO dto);

	void productcnt(int num);

	ProductDTO productdetail(int num);

	ProductDTO pmodify1(int unum);

	void pmodify2(int productnum, String id, String animal, String productlist, int price, String fname, String productdate, String productname);

	ProductDTO pdelete1(int dnum);

	void pdelete2(int dnum);

	ArrayList<ProductDTO> psearch2(String name, String value, String value2);

	ArrayList<ProductDTO> dogproductout(ProductPageDTO dto);
	
	ArrayList<ProductDTO> dogfoodsnack(ProductPageDTO dto);
	
	ArrayList<ProductDTO> dogtoyliving(ProductPageDTO dto);
	
	ArrayList<ProductDTO> doghealthtoilet(ProductPageDTO dto);

	ArrayList<ProductDTO> dogbeautyfashion(ProductPageDTO dto);

	ArrayList<ProductDTO> catproductout(ProductPageDTO dto);
	
	ArrayList<ProductDTO> catfoodsnack(ProductPageDTO dto);

	ArrayList<ProductDTO> cattoyliving(ProductPageDTO dto);

	ArrayList<ProductDTO> cathealthtoilet(ProductPageDTO dto);

	ArrayList<ProductDTO> catbeautyfashion(ProductPageDTO dto);

	ArrayList<ProductDTO> birdproductout(ProductPageDTO dto);
	
	ArrayList<ProductDTO> birdfoodsnack(ProductPageDTO dto);

	ArrayList<ProductDTO> birdtoyliving(ProductPageDTO dto);

	ArrayList<ProductDTO> birdhealthtoilet(ProductPageDTO dto);

	ArrayList<ProductDTO> birdbeautyfashion(ProductPageDTO dto);

	ArrayList<ProductDTO> fishproductout(ProductPageDTO dto);
	
	ArrayList<ProductDTO> fishfoodsnack(ProductPageDTO dto);

	ArrayList<ProductDTO> fishtoyliving(ProductPageDTO dto);

	ArrayList<ProductDTO> fishhealthtoilet(ProductPageDTO dto);

	ArrayList<ProductDTO> fishbeautyfashion(ProductPageDTO dto);

	ArrayList<ProductDTO> creepproductout(ProductPageDTO dto);

	ArrayList<ProductDTO> creepfoodsnack(ProductPageDTO dto);

	ArrayList<ProductDTO> creeptoyliving(ProductPageDTO dto);

	ArrayList<ProductDTO> creephealthtoilet(ProductPageDTO dto);

	ArrayList<ProductDTO> creepbeautyfashion(ProductPageDTO dto);

	ArrayList<ProductDTO> productbuy(int num);

	ArrayList<ProreviewDTO> proreviewout(int num, ProductPageDTO pdto);

	void proreview(int productnum, String id, String proreview);

	ProreviewDTO prorere(int proreviewnum);

	ProreviewDTO prorereout(int proreviewnum);

	void prostepup(int groups, int step);

	void proreinsert(int productnum, String id, String review, int groups, int step, int indent);

	int prorerecheck(String review);

	void proreviewupdate(int proreviewnum, String proreview);

	int proreviewcheck(String proreview);

	void proreviewdelete(int proreviewnum);

	int proreviewdeletecheck(int proreviewnum);

	ProreviewDTO proreport(int num, String id);

	void redel(int proreviewnum);

	int proreviewtotal(int num);

	int prototal();

	int birdmaintotal();

	int birdfoodtotal();

	int birdlivingtotal();

	int birdhealthtotal();

	int birdbeautytotal();

	int catmaintotal();

	int catfoodtotal();

	int catlivingtotal();

	int cathealthtotal();

	int catbeautytotal();

	int creepmaintotal();

	int creepfoodtotal();

	int creeplivingtotal();

	int creephealthtotal();

	int creepbeautytotal();

	int dogmaintotal();

	int dogfoodtotal();

	int doglivingtotal();

	int doghealthtotal();

	int dogbeautytotal();

	int fishmaintotal();

	int fishfoodtotal();

	int fishlivingtotal();

	int fishhealthtotal();

	int fishbeautytotal();

	ArrayList<ProductDTO> producttotal(ProductPageDTO dto);

	int listtotal();



	









	

	

	

	

}
