package com.jr.studycafe.dao;

import java.util.List;

import com.jr.studycafe.dto.Messanger;

public interface MessangerDao {
	public int messangerSend(Messanger messanger);
	public List<Messanger> messangerList(Messanger messanger);
	public int unReadMsgCnt(String u_id);
	public int msgCnt(String u_id);
	public Messanger messageDetail(int m_no);
	public int deleteMessage(int m_no);
	public int readMessage(int m_no);
}
