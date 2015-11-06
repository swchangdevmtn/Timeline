//
//  PostCommentTableViewCell.swift
//  Timeline
//
//  Created by Sean Chang on 11/5/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit

class PostCommentTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!

    func updateWithComment(comment: Comment) {
        
        usernameLabel.text = comment.username
        commentLabel.text = comment.text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
