//
//  Review.swift
//  ThursdayYelp
//
//  Created by Charles Merriam on 11/13/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

var reviews: [Review] = []

class Review: NSObject {
    var rest, address, category, distance : String
    var numReviews, dollars : Int
    
    init(rest: String, address: String, numReviews: Int, dollars: Int, distance : String, category: String) {
        self.rest = rest
        self.address = address
        self.category = category
        self.distance = distance
        self.numReviews = numReviews
        self.dollars = dollars
    }
    
    class func dummy() -> Review {
        return Review(rest: "Grand Pu Bah",
            address: " 88 Division St.  Mission Bay",
            numReviews: 469,
            dollars: 2,
            distance: "0.07 mi",
            category: "Thai, Seafood, Salad")
    }
  
}
