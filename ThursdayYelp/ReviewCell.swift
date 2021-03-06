//
//  ReviewCell.swift
//  ThursdayYelp
//
//  Created by Charles Merriam on 11/13/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var numReviews: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var dollars: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var stars: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    func set(review : Review, indexPath : NSIndexPath) {
        name.text =  "\(indexPath.row+1).  \(review.name)"
        numReviews.text = "\(review.numReviews) Reviews"
        address.text = review.address
        category.text = review.category
        thumbnail.setImageWithURL(review.image_url)
        
        let starName : String = "star\(String(Int(review.rating * 10)))"
        let bundle = NSBundle.mainBundle()
        let fullPath = bundle.pathForResource(starName, ofType: "png")!
        let starURL = NSURL(fileURLWithPath: fullPath)
        stars.setImageWithURL(starURL)
    }

}
