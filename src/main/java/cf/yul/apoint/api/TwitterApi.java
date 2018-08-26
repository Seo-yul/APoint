package cf.yul.apoint.api;

import java.util.ArrayList;
import java.util.List;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class TwitterApi {
	 private Twitter twitter;
	
	 public TwitterApi() {
		super();
		twitter = getInstance();
	}
	    public List<Status> getTweetList(Query query, int totalCount) throws Exception{
	        List<Status> result = null;
	        if(totalCount < 100){
	            query.setCount(totalCount);
	            result = this.getTweetBlock(query);
	        }else{
	            result = this.getTweetBlock(query, totalCount);
	        }
	         return result;
	    }

	    private List<Status> getTweetBlock(Query query){
	        if(query.getMaxId() != 0){
	            query.setMaxId(query.getMaxId());
	        }
	        List<Status> result = null;
	        QueryResult queryResult = null;
	        try{
	            queryResult = twitter.search(query);
	        }catch (TwitterException e){
	            e.printStackTrace();
	        }
	         if(queryResult != null){
	            result = new ArrayList();
	            for (Status status : queryResult.getTweets()) {
	                result.add(status);
	            }
	        }
	        return result;
	    }

	    private List<Status> getTweetBlock(Query query, int totalCount) throws Exception{
	        List<Status> result = null;
	        query.setCount(100);
	        boolean finished = false;
	        int processCount = 0;
	        while (!finished) {
	            if(result == null){
	                result = new ArrayList();
	            }
	            List<Status> statuses = this.getTweetBlock(query);
	            long lowestStatusId = Long.MAX_VALUE;
	            for (Status status : statuses) {
	                lowestStatusId = Math.min(status.getId(), lowestStatusId);
	                result.add(status);
	            }
	            query.setMaxId(lowestStatusId - 1);
	            processCount = processCount+statuses.size();
	             if((totalCount-processCount) < 100){
	                query.setCount(totalCount-processCount);
	            }
	             if(statuses == null || (totalCount-processCount) <= 0){
	                finished = true;
	            }
	        }
	        return result;
	    }

	public Twitter getInstance(){
		 String consumerKey = "5XQa4HgyUcG9vow3dlSyhHyCz";
		 String consumerSecret = "ZGnEc16lIDDlIjqGdrVEmJYC8VKccCEMaPZYsopGUdK9zKuTLZ";
		 String acessToken = "3246273367-9wviMEBU6bgcxSoxk32NmoeFbAQ4aujC4ad6An7";
		 String acessTokenSecret = "gQpQB8BaQTsmrSxcDWYugINaN6skMOAc6dn1UXc4ste0g";

	        ConfigurationBuilder configurationBuilder = new ConfigurationBuilder();
	        configurationBuilder.setDebugEnabled(true)
	                .setOAuthConsumerKey(consumerKey)
	                .setOAuthConsumerSecret(consumerSecret)
	                .setOAuthAccessToken(acessToken)
	                .setOAuthAccessTokenSecret(acessTokenSecret);
	        TwitterFactory tf = new TwitterFactory(configurationBuilder.build());
	        Twitter twitter = tf.getInstance();
	        return twitter;
	    }
	
	
	
}
