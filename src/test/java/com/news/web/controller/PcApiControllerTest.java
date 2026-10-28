package com.news.web.controller;

import org.junit.Before;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.test.web.client.MockRestServiceServer;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.client.RestTemplate;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.requestTo;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withSuccess;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

public class PcApiControllerTest {
    private MockMvc mvc;
    private MockRestServiceServer upstream;
    @Before public void setup() {
        RestTemplate rest = new RestTemplate();
        upstream = MockRestServiceServer.createServer(rest);
        mvc = standaloneSetup(new PcApiController(rest, "http://upstream/api/", "sz,sh")).build();
    }
    @Test public void listsNewsWithPagination() throws Exception {
        upstream.expect(requestTo("http://upstream/api/getnewslist?cityen=bj&platform=pc&page=2&pagesize=10&upper=1&order=0&isdesc=1"))
                .andRespond(withSuccess("{\"Success\":true,\"Result\":{\"NewsList\":[{\"ID\":7,\"Title\":\"标题\"}]},\"Total\":21}", MediaType.APPLICATION_JSON_UTF8));
        mvc.perform(get("/pc-api/v1/bj/news?page=2")).andExpect(status().isOk())
                .andExpect(jsonPath("$.items[0].ID").value(7)).andExpect(jsonPath("$.total").value(21)).andExpect(jsonPath("$.page").value(2));
        upstream.verify();
    }
    @Test public void blocksCitiesAndInvalidParameters() throws Exception {
        mvc.perform(get("/pc-api/v1/sz/news")).andExpect(status().isNotFound());
        mvc.perform(get("/pc-api/v1/bj/news?page=0")).andExpect(status().isBadRequest());
        mvc.perform(get("/pc-api/v1/bj/news?pageSize=1000")).andExpect(status().isBadRequest());
        mvc.perform(get("/pc-api/v1/bj/news?page=oops")).andExpect(status().isBadRequest());
        upstream.verify();
    }
    @Test public void distinguishesMissingAndRemovedArticles() throws Exception {
        upstream.expect(requestTo("http://upstream/api/getnewscontent?cityen=bj&platform=pc&newsid=7"))
                .andRespond(withSuccess("{\"Success\":true,\"Result\":{\"Title\":\"已下架\",\"Upper\":0}}", MediaType.APPLICATION_JSON_UTF8));
        upstream.expect(requestTo("http://upstream/api/getnewscontent?cityen=bj&platform=pc&newsid=8"))
                .andRespond(withSuccess("{\"Success\":true,\"Result\":{}}", MediaType.APPLICATION_JSON_UTF8));
        mvc.perform(get("/pc-api/v1/bj/news/7")).andExpect(status().isGone());
        mvc.perform(get("/pc-api/v1/bj/news/8")).andExpect(status().isNotFound());
        upstream.verify();
    }
    @Test public void filtersHiddenBeijingColumn() throws Exception {
        upstream.expect(requestTo("http://upstream/api/getcolumnlist?cityen=bj&platform=pc"))
                .andRespond(withSuccess("{\"Success\":true,\"Result\":[{\"Id\":659},{\"Id\":1}]}", MediaType.APPLICATION_JSON_UTF8));
        mvc.perform(get("/pc-api/v1/bj/columns")).andExpect(status().isOk())
                .andExpect(jsonPath("$.columns.length()").value(1)).andExpect(jsonPath("$.columns[0].Id").value(1));
        upstream.verify();
    }
    @Test public void reportsUpstreamFailureAsJson() throws Exception {
        upstream.expect(requestTo("http://upstream/api/getcolumnlist?cityen=bj&platform=pc"))
                .andRespond(withSuccess("{\"Success\":false,\"Msg\":\"private details\"}", MediaType.APPLICATION_JSON_UTF8));
        mvc.perform(get("/pc-api/v1/bj/columns")).andExpect(status().isBadGateway())
                .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON)).andExpect(jsonPath("$.message").exists());
        upstream.verify();
    }
}
