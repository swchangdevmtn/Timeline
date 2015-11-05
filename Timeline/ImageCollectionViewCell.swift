//
//  ImageCollectionViewCell.swift
//  Timeline
//
//  Created by Sean Chang on 11/4/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func updateWithImageIdentifier(identifier: String) {
        ImageController.imageForIdentifier(identifier) { (image) -> Void in
            self.imageView.image = image
        }
    }
    
}
