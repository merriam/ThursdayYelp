//
//  ReviewCell.swift
//  ThursdayYelp
//
//  Created by Charles Merriam on 11/13/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    @IBOutlet weak var theText: UILabel!

    @IBOutlet weak var rest: UILabel!
    @IBOutlet weak var numReviews: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var dollars: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var category: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    func set(review : Review, indexPath : NSIndexPath) {
        rest.text =  "\(indexPath.row+1).  \(review.rest)"
        numReviews.text = "\(review.numReviews) Reviews"
        distance.text = review.distance
        dollars.text = "$$$$$$".substringToIndex(review.dollars)
        address.text = review.address
        category.text = review.category
        
    }

}
