//
//  YelpClient.swift
//  ThursdayYelp
//
//  Created by Peter Bohnert on 11/13/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

var theYelpClient = YelpClient()

class YelpClient: BDBOAuth1RequestOperationManager {
    // our Yelp keys
    let yelpConsumerKey = "WxM1ynG7wdd032qyipfagQ"
    let yelpConsumerSecret = "8lrED6F1gWOb1XSwr3FfkSbeNX8"
    let yelpToken = "J89lj9umCgqWyfByF6E6QsoTEZA01ejv"
    let yelpTokenSecret = "Q82qHm43iwDe-2ECP6du7NplfRk"
   
    // this initializer is listed as required; it must be implemented.  But really it doesn't.  The
    // 'required' keyword is a red herring and it just means that it could be implemented without using
    // the 'override' keyword.  But it does.   Swift is confusing.
    
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
    
    func reviewsFromRawResponse(response: NSDictionary) -> [Review] {
        // response is dictionary, with 'businesses' being an array of dictionaries.
        // that is, response[businesses] = [raw_review]
        var reviews : [Review] = []
        let rawReviews = response["businesses"]! as NSArray
        for r in rawReviews {
            let raw = r as NSDictionary
            var review = reviewFromRawReview(raw)
            reviews.append(review)
        }
        return reviews
    }

    func reviewFromRawReview(raw: NSDictionary) -> Review {
        var review = Review.dummy()
        review.name = raw["name"]! as String
        // print("name \(review.name)")

        // ["categories"] is array of array of strings, each array of strings is [human name, search tag] of one category.
        var category_list : [[String]] = raw["categories"] as [[String]]
        // let categories = category_list.map { (var cats) -> String in return cats[0]; }
        let categories = category_list.map { $0[0] }  // more concise
        review.category = ", ".join(categories)

        var image_url = NSURL(string: raw["image_url"] as String)
        var addresses = (raw["location"] as NSDictionary)["display_address"] as [String]
        review.address = ", ".join(addresses)
        review.numReviews = raw["review_count"] as Int
        review.rating = raw["rating"] as Float
        
        return review
    }    
}
