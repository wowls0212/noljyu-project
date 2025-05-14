package com.mbc.nol.report;

import java.util.ArrayList;

public interface ReportService {

	void postreport(int num, String id);

	void save(int postnum, String postid, String reason, String reportid ,String detail);

	ArrayList<ReportDTO> postreportout(ReportPageDTO dto);

	void redel(int reportnum);

	void resave(int postnum, int reviewnum, String id, String reason, String detail, String reportid);

	ArrayList<ReportDTO> rereportout(ReportPageDTO dto);

	void proresave(int productnum, int proreviewnum, String id, String reason, String detail, String reportid);

	ArrayList<ReportDTO> prorereportout(ReportPageDTO dto);

	int proreporttotal();

	int reporttotal();

	int reviewreporttotal();

	void reup(int postreportnum);

}
