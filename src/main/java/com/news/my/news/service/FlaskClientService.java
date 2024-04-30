package com.news.my.news.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class FlaskClientService {

    private final RestTemplate restTemplate;

    @Autowired
    public FlaskClientService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }
    // 뉴스 검색
    public String getData(String query) {
        String url = "http://192.168.0.31:5000/get_data?query={query}";
        return restTemplate.getForObject(url, String.class, query);
    }
   
}