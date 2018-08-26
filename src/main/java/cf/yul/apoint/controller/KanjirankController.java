package cf.yul.apoint.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cf.yul.apoint.api.TwitterApi;
import cf.yul.apoint.dao.KanjiDAO;
import cf.yul.apoint.vo.KanjiRank;
import twitter4j.GeoLocation;
import twitter4j.MediaEntity;
import twitter4j.Query;
import twitter4j.Query.ResultType;
import twitter4j.Query.Unit;
import twitter4j.Status;

@Controller
public class KanjirankController {
	@Autowired
	KanjiDAO dao;
	
	@RequestMapping(value = "/refresh", method = RequestMethod.GET)
	public String twitterRefresh(Model model, String codes, HttpSession session) {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, -7);
		Date date = calendar.getTime();
		SimpleDateFormat todayFormat = new SimpleDateFormat("YYYY-MM-dd");
		String today = todayFormat.format(date);
		
		TwitterApi tw = new TwitterApi();
		GeoLocation location = new GeoLocation(35.68720035, 139.75592331);//도쿄 치요다
		Query query = new Query();
		query.setGeoCode(location, 10, Unit.km);
        query.setLang("ja");
        query.setQuery("日常");
        query.setSince(today);
        System.out.println(today);
        List<String> getTextArray = new ArrayList<String>();
        KanjiRank kanjirank = new KanjiRank();
        int resultSize = 0;
         try {
        	 int cnt = 0;
        	
            List<Status> result = tw.getTweetList(query,100);
//            System.out.println("전체개수 "+result.size());
            for(Status status : result){
//                System.out.println("< twitter > :" + status.getText());
                String regex = "[\u4E00-\u9FFF]"; //Kanji
        		Pattern pattern = Pattern.compile(regex);
        		Matcher matcher = pattern.matcher(status.getText());
        		while(matcher.find()){
//        			System.out.println(matcher.group(0));
        			getTextArray.add( matcher.group(0) );
        		}
               /* //팀플용 미디어 쿼리 실험
                MediaEntity[] media = status.getMediaEntities();
                for(MediaEntity m : media){ //search trough your entities
                    System.out.println("[media]: " +m.getMediaURL()); //get url
                }*/
            }
            
            for(String kanji : getTextArray) {
            	kanjirank.setKanji(kanji);
           	 String initUrl = "https://ja.dict.naver.com/search.nhn?range=all&q="+encodeURIComponent(kanji)+"&sm=jpd_hty";
    			Connection con = Jsoup.connect(initUrl);
    			Elements els = null;
    			try {	
    				Document doc = con.get();
    				els = doc.select("span.ft_col3"); //검색해서 나온한자
    				kanjirank.setKor(els.text());
    				
    				cnt = dao.insertKanjiRank(kanjirank);
    				if(cnt ==0) {
    					dao.updateKanjiRank(kanjirank.getKanji());
    				}
    				System.out.println(kanjirank);
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
    			resultSize++;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
         System.out.println("검색 된 총 한자 : "+resultSize);
		return "redirect:help";
	}
	
	public static String encodeURIComponent(String component)   {     
	    String result = null;      

	    try {       
	        result = URLEncoder.encode(component, "UTF-8"); 
	    }
	    catch (UnsupportedEncodingException e) {       
	        result = component;     
	    }      

	    return result;   
	}
	
	
	
	
	
}
