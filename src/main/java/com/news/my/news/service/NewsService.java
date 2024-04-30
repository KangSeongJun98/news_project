package com.news.my.news.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.news.my.news.dao.INewsDAO;
import com.news.my.news.vo.NewsClippingVO;
import com.news.my.news.vo.RealTimeVO;

@Service
public class NewsService {
	@Autowired
	INewsDAO dao;
	
	// 실시간 뉴스 가져오기
	public ArrayList<RealTimeVO> getRealTime(RealTimeVO vo) {
		return dao.getRealTime(vo);
	}
	
	// 뉴스 스크랩
	public void newsClipping (NewsClippingVO vo) throws Exception {
		int result = dao.newsClipping(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
	// 스크랩된 뉴스 가져오기
		public ArrayList<NewsClippingVO> getClipping(NewsClippingVO vo) {
			return dao.getClipping(vo);
		}
		
	// 스크랩 된 뉴스 삭제
	public void delClipping (NewsClippingVO vo) throws Exception {
		int result = dao.delClipping(vo);
		if(result == 0) {
			throw new Exception();
		}
	}	
}
