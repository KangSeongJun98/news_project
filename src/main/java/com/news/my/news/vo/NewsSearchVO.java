package com.news.my.news.vo;

public class NewsSearchVO{
	private String title;
	private String description;
	private String link;
	private String originallink;
	private String pubDate;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getOriginallink() {
		return originallink;
	}

	public void setOriginallink(String originallink) {
		this.originallink = originallink;
	}

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}

	
	@Override
	public String toString() {
		return "NewsSearchVO [title=" + title + ", description=" + description + ", link=" + link + ", originallink="
				+ originallink + ", pubDate=" + pubDate + "]";
	}

}
