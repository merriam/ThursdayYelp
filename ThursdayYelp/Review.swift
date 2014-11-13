//
//  Review.swift
//  ThursdayYelp
//
//  Created by Charles Merriam on 11/13/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

class Review: NSObject {
    var rest, address, category, distance : String?
    var numReviews, dollars : Int?
    
    
    func setDummy() -> Review {
        rest = "Grand Pu Bah"
        address = " 88 Division St.  Mission Bay"
        numReviews = 469
        dollars = 2
        distance = "0.07 mi"
        category = "Tahi, Seaford, Salad"
        return self
    }
  
}
