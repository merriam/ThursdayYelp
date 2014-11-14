//
//  YelpClient.swift
//  ThursdayYelp
//
//  Created by Peter Bohnert on 11/13/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

class YelpClient: BDBOAuth1RequestOperationManager {
    // our Yelp keys
    let yelpConsumerKey = "WxM1ynG7wdd032qyipfagQ"
    let yelpConsumerSecret = "8lrED6F1gWOb1XSwr3FfkSbeNX8"
    let yelpToken = "J89lj9umCgqWyfByF6E6QsoTEZA01ejv"
    let yelpTokenSecret = "Q82qHm43iwDe-2ECP6du7NplfRk"
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        var baseUrl = NSURL(string: "http://api.yelp.com/v2/")
        super.init(baseURL: baseUrl, consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret);
        
        var token = BDBOAuthToken(token: yelpToken, secret: yelpTokenSecret, expiration: nil)
        self.requestSerializer.saveAccessToken(token)
    }
   
    func searchWithTerm(term: String, success: (AFHTTPRequestOperation!, AnyObject!) -> Void, failure: (AFHTTPRequestOperation!, NSError!) -> Void) -> AFHTTPRequestOperation! {
        // For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
        var parameters = ["term": term, "location": "San Francisco"]
        return self.GET("search", parameters: parameters, success: success, failure: failure)
    }
    
    func reviewFromRawReview(raw: NSDictionary) -> Review {
        var review = Review.dummy()
        review.name = raw["name"]! as String
        return review
    }    
}
