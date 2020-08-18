package com.jr.studycafe.service;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jr.studycafe.dao.FreeCommentsDao;
import com.jr.studycafe.dto.FreeComments;
import com.jr.studycafe.dto.Users;
import com.jr.studycafe.util.Paging;
@Service
public class FreeCommentsServiceImpl implements FreeCommentsService {
	@Autowired
	private FreeCommentsDao fcDao;

	@Override
	public List<FreeComments> freeCommentsList(String pageNum2,Model model, FreeComments f) {
		Paging paging2 = new Paging(fcDao.freeCommentsCnt(f.getFb_no()), pageNum2,5,10);
		model.addAttribute("paging2", paging2);
		f.setStartRow(paging2.getStartRow());
		f.setEndRow(paging2.getEndRow());
		if (paging2.getCurrentPage()>paging2.getPageCnt()) {
			model.addAttribute("noMore", "등록된 댓글이 없습니다.");
		}
		model.addAttribute("fbCommentsCnt", freeCommentsCnt(f.getFb_no()));
		return fcDao.freeCommentsList(f);
	}

	@Override
	public int freeCommentsWrite(FreeComments f, HttpSession session, Model model) {
		int result = 0;
		String u_id = "";
		if(session.getAttribute("users")!=null) {
			u_id = ((Users)session.getAttribute("users")).getU_id();
		}
		f.setU_id(u_id);
		f.setC_rdate(new Timestamp(System.currentTimeMillis()));
		try {
			result = fcDao.freeCommentsWrite(f);
			System.out.println(f);
			model.addAttribute("freeComments", f);
			model.addAttribute("insert_list", fcDao.freeCommentsList(f));
			model.addAttribute("fbCommentsCnt", freeCommentsCnt(f.getFb_no()));
			model.addAttribute("insertResult", "댓글 작성이 완료되었습니다");
		}catch (Exception e) {
			model.addAttribute("insertResult", "댓글 작성에 실패했습니다");
		}
		return result;
	}

	@Override
	public int freeCommentsDelete(int c_no) {
		return fcDao.freeCommentsDelete(c_no);
	}

	@Override
	public int freeCommentsCnt(int fb_no) {
		return fcDao.freeCommentsCnt(fb_no);
	}

}
