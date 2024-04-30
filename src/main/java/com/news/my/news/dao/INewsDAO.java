package com.news.my.news.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.news.my.news.vo.NewsClippingVO;
import com.news.my.news.vo.RealTimeVO;

@Mapper
public interface INewsDAO {
	// 실시간 검색어 가져오기
	public ArrayList<RealTimeVO> getRealTime(RealTimeVO vo);
	
	// 뉴스 스크랩
	public int newsClipping(NewsClippingVO vo);
	
	// 스크랩 된 뉴스 가져오기
	public ArrayList<NewsClippingVO> getClipping(NewsClippingVO vo);
	
	// 스크랩 된 뉴스 삭제
	public int delClipping(NewsClippingVO vo);
}
