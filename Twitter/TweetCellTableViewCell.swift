//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Getnet Mekuriyaw on 4/4/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit
import BDBOAuth1Manager
import AlamofireImage

class TweetCellTableViewCell: UITableViewCell {
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    var favorited:Bool = false
     var tweetId: Int = -1
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
               if(toBeFavorited){
                   TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                       self.setFavorited(true)
                   }, failure: { (Error) in
                       print("Favorite did not succeed\(Error)")
                   })
               }
               else {

                   TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                       self.setFavorited(false)
                   }, failure: { (Error) in
                       print("unfavorited did not succeed: \(Error)")
                   })
               }
    }
    @IBAction func retweet(_ sender: Any) {
        
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
                   self.setRetweeted(true)
               }, failure: { (Error) in
                   print("Error is retweeting: \(Error)")
               })
    }
    func setRetweeted(_ isRetweeted: Bool){
           
           if(isRetweeted) {
               retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
               retweetButton.isEnabled = false
           }
               
           else{

               retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
               retweetButton.isEnabled = true
           }
       }
    
    func setFavorited (_ isFavorited :Bool){
        
        favorited = isFavorited
            if (favorited){
                favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)

            }
            else{
                favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
            }
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
