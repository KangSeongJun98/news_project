package com.news.my.news.vo;

public class RealTimeVO{
	private int searchRank;
	private String searchContent;
	private String referenceDate;
	
	
	public int getSearchRank() {
		return searchRank;
	}
	public void setSearchRank(int searchRank) {
		this.searchRank = searchRank;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public String getReferenceDate() {
		return referenceDate;
	}
	public void setReferenceDate(String referenceDate) {
		this.referenceDate = referenceDate;
	}
	@Override
	public String toString() {
		return "RealTimeVO [searchRank=" + searchRank + ", searchContent=" + searchContent + ", referenceDate="
				+ referenceDate + "]";
	}
}