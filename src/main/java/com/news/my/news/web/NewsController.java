package com.news.my.news.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.news.my.member.vo.MemberVO;
import com.news.my.news.service.FlaskClientService;
import com.news.my.news.service.NewsService;
import com.news.my.news.vo.NewsClippingVO;
import com.news.my.news.vo.NewsSearchVO;
import com.news.my.news.vo.RealTimeVO;

@Controller
public class NewsController {

	@Autowired
	NewsService newsService;

	@Autowired
	private FlaskClientService flaskClientService;

	// 뉴스 조회
	@RequestMapping("/newsView")
	public String newsView(HttpServletRequest request, Model model, HttpSession session) {
		String query = request.getParameter("query");
		System.out.println("쿼리: " + query);
		// 검색 키워드가 없으면 실검으로 가지게
		if (query == null || query.equals("")) {
			return "redirect:/realTimeView";
		}
		// 로그인 돼있으면 내 스크랩 리스트를 세션에 저장
		if (session.getAttribute("login") != null) {
			MemberVO login = (MemberVO) session.getAttribute("login");
			NewsClippingVO vo = new NewsClippingVO();
			vo.setMemId(login.getMemId());
			ArrayList<NewsClippingVO> scrapedNews = newsService.getClipping(vo);
			System.out.println(scrapedNews);
			model.addAttribute("scrapedNews", scrapedNews);
		}

		String response = flaskClientService.getData(query);
		ObjectMapper mapper = new ObjectMapper();
		try {
			ArrayList<NewsSearchVO> newsList = mapper.readValue(response, new TypeReference<ArrayList<NewsSearchVO>>() {
			});

			for (int i = 0; i < newsList.size(); i++) {
				String pubDate = newsList.get(i).getPubDate();
				newsList.get(i).setPubDate(strToDate(pubDate));
			}

			model.addAttribute("newsList", newsList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("query", query);
		return "news/newsView";
	}

	// 실시간 조회
	@RequestMapping("/realTimeView")
	public String realTimeView(RealTimeVO vo, Model model) {
		ArrayList<RealTimeVO> realTimeList = newsService.getRealTime(vo);
		model.addAttribute("realTimeList", realTimeList);

		return "news/realTimeView";
	}

	// 스크랩된 뉴스 조회
	@RequestMapping("/getClipping")
	public String getClipping(NewsClippingVO vo, Model model, HttpSession session) {
		MemberVO login = (MemberVO) session.getAttribute("login");
		if(login == null) {
			return "member/loginView";
		}
		vo.setMemId(login.getMemId());
		ArrayList<NewsClippingVO> clippingList = newsService.getClipping(vo);
		model.addAttribute("clippingList", clippingList);

		return "news/clippingView";
	}
	

	// 뉴스 스크랩
	@ResponseBody
	@RequestMapping(value = "/clippingDo", method = RequestMethod.POST)
	public String clippingDo(@RequestBody NewsClippingVO vo, RedirectAttributes re, Model model) {
		try {
			newsService.newsClipping(vo);
			ArrayList<NewsClippingVO> clippingList = newsService.getClipping(vo);
			model.addAttribute("clippingList", clippingList);
			return "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "N";

	}
	
	// 스크랩된 뉴스 삭제
		@ResponseBody
		@RequestMapping(value = "/clippingDel", method = RequestMethod.POST)
		public String clippingDel(@RequestBody NewsClippingVO vo, RedirectAttributes re, Model model) {
			try {
				newsService.delClipping(vo);
				return "Y";
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "N";
		}

	// 날짜 포맷 메소드
	public static String strToDate(String str) {
		SimpleDateFormat inputFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z", Locale.ENGLISH);
		SimpleDateFormat outputFormat = new SimpleDateFormat("yy-MM-dd HH:mm:ss", Locale.KOREA);
		Date date;
		try {
			date = inputFormat.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
			return null; // 파싱 실패 시 null 반환 또는 다른 처리
		}

		return outputFormat.format(date);
	}

}
