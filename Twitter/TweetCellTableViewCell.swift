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
    
    @IBOutlet weak var retweetButton: UIView!
    @IBOutlet weak var favButton: UIView!
    @IBAction func favoriteTweet(_ sender: Any) {
    }
    @IBAction func retweet(_ sender: Any) {
    }
    
    var favorited:Bool = false
    
    func setFavorited (_ isFavorited :Bool){
        
        favorited = isFavorited
        if (favorited){
            
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
