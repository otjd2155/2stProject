package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.FreeComments;

public interface FreeCommentsDao {
	public List<FreeComments> freeCommentsList(FreeComments f);
	public int freeCommentsWrite(FreeComments f);
	public int freeCommentsDelete(int c_no);
	public int freeCommentsCnt(int fb_no);
}
