//
//  SearchResultsViewController.swift
//  ThursdayYelp
//
//  Created by Charles Merriam on 11/13/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate  {
    
        var client: YelpClient!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        client = YelpClient()
        
        client.searchWithTerm("Thai", success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            // response is dictionary with 'businesses' being an array of dictionaries.
            println(response)
            println("========")
            reviews = []
            let rawReviews = ((response as NSDictionary)["businesses"]!) as NSArray
            for r in rawReviews {
                let raw = r as NSDictionary
                var review = self.client.reviewFromRawReview(raw)
                reviews.append(review)
            }
                
            
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("review") as ReviewCell
        var review = Review.dummy()
        cell.set(review, indexPath: indexPath)
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
