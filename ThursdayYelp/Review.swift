//
//  Review.swift
//  ThursdayYelp
//
//  Created by Charles Merriam on 11/13/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

var theReviews: [Review] = []

class Review: NSObject {
    var name, address, category: String
    var numReviews : Int
    var rating : Float
    var image_url : NSURL
    
    
    init(name: String, address: String, numReviews: Int, category: String, rating : Float, image_url_string : String) {
        self.name = name
        self.address = address
        self.category = category
        self.numReviews = numReviews
        self.rating = rating
        self.image_url = NSURL(string: image_url_string)!
        super.init()
    }
    
    class func dummy() -> Review {
        return Review(name: "Grand Pu Bah",
            address: " 88 Division St.  Mission Bay",
            numReviews: 469,
            category: "Thai, Seafood, Salad",
            rating: 3.5,
            image_url_string :  "http://s3-media2.fl.yelpcdn.com/photo/u0-tGrv-LjYBhCIZgNWeBA/ms.jpg")
    }
  
}
