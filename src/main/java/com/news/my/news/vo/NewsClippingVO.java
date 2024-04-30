package com.news.my.news.vo;

public class NewsClippingVO {
	private String memId;
	private String newsTitle;
	private String newsContent;
	private String newsLink;
	private String clippingDate;
	
	public NewsClippingVO() {
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public String getNewsLink() {
		return newsLink;
	}
	public void setNewsLink(String newsLink) {
		this.newsLink = newsLink;
	}
	public String getClippingDate() {
		return clippingDate;
	}
	public void setClippingDate(String clippingDate) {
		this.clippingDate = clippingDate;
	}
	@Override
	public String toString() {
		return "NewsClipping [memId=" + memId + ", newsTitle=" + newsTitle + ", newsContent=" + newsContent
				+ ", newsLink=" + newsLink + ", clippingDate=" + clippingDate + "]";
	}
}
