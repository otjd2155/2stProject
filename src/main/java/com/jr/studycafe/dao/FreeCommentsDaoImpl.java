package com.jr.studycafe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jr.studycafe.dto.FreeComments;
@Repository
public class FreeCommentsDaoImpl implements FreeCommentsDao {
	@Autowired
	private SqlSessionTemplate template;
	@Override
	public List<FreeComments> freeCommentsList(FreeComments f) {
		return template.selectList("freeCommentsList", f);
	}

	@Override
	public int freeCommentsWrite(FreeComments f) {
		return template.insert("freeCommentsWrite", f);
	}

	@Override
	public int freeCommentsDelete(int c_no) {
		return template.update("freeCommentsDelete", c_no);
	}

	@Override
	public int freeCommentsCnt(int fb_no) {
		return template.selectOne("freeCommentsCnt", fb_no);
	}

}
