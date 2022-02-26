//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Sajidah Wahdy on 2/22/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    var favorited:Bool = false
    var tweetID:Int = -1 //initialized to a negative number so know not set
    //var retweeted:Bool = false
    
//tying components to code
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetID, success: {
            self.setRetweeted(true)
        }, failure: {(error) in
            print("Error in retweeting: \(error)")
        })
    }
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBAction func favoriteTweet(_ sender: Any) {
        //toggles so if favorited, becomes unfavorited and vice versa
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(true)
            }, failure: {(error) in
            print("Favorite did not succeed: \(error)")
        })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(false)
            }, failure: {(error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
        }
    
    
    
    //will set colors if favorited
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for:
                                UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    //retweeted method
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for:
                UIControl.State.normal)
            retweetButton.isEnabled = true
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
