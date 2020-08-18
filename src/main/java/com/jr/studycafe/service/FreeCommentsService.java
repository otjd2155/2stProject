package com.jr.studycafe.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.jr.studycafe.dto.FreeComments;

public interface FreeCommentsService {
	public List<FreeComments> freeCommentsList(String pageNum2, Model model,FreeComments f);
	public int freeCommentsWrite(FreeComments f, HttpSession session, Model model);
	public int freeCommentsDelete(int c_no);
	public int freeCommentsCnt(int fb_no);
}
