//
//  DisplayCell.swift
//  Back_Your_Watch
//
//  Created by Nathan Brewer on 12/7/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit

class DisplayCell: UICollectionViewCell {
    
    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imageDisplay: UIImageView!
    
    var starting: CGPoint?
    
    override func awakeFromNib() {
        
        let touches = Set<UITouch>()
        let touch = touches.first
        let position = touch?.location(in: self.imageDisplay)
        self.starting = position
        print("GG \(position)")

        imageDisplay.isUserInteractionEnabled = true
        
        layer.cornerRadius = 8
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
        
    }
    
    func configureCell(img: UIImage, title: String) {
        imageDisplay.image = img
        imageTitle.text = title
    }
    
    
}
