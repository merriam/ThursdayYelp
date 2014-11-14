//
//  SearchResultsViewController.swift
//  ThursdayYelp
//
//  Created by Charles Merriam on 11/13/14.
//  Copyright (c) 2014 Charles Merriam. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let client = theYelpClient

        client.searchWithTerm("Restaurant", success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            // response is dictionary with 'businesses' being an array of dictionaries.
            //println(response)
            theReviews = []  // remove old review list
            let rawReviews = ((response as NSDictionary)["businesses"]!) as NSArray
            for r in rawReviews {
                let raw = r as NSDictionary
                var review = client.reviewFromRawReview(raw)
                theReviews.append(review)
            }
            self.tableView.reloadData()
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theReviews.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("review") as ReviewCell
        var review = theReviews[indexPath.row]
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
