//
//  ViewController.swift
//  Back_Your_Watch
//
//  Created by Nathan Brewer on 12/7/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray = [#imageLiteral(resourceName: "watch0.5x"), #imageLiteral(resourceName: "casper"), #imageLiteral(resourceName: "zorn"), #imageLiteral(resourceName: "goblin")]
    var nameArray = ["App Logo", "Casper", "Zorn", "Goblin"]
    var startingTouch: CGPoint?
    
    var newImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.view)
            self.startingTouch = position
            print("JJ \(self.startingTouch)")
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DisplayCell
        
        let imageSelected = imageArray[indexPath.item]
        fullSizeImage(img: imageSelected)

        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 8.0, initialSpringVelocity: 2.0, options: .curveEaseIn, animations: {
        self.newImage.frame.origin = CGPoint(x: 0.0, y: 0.0)
        self.newImage.frame.size = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        }, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DisplayCell
        let images = imageArray[indexPath.row]
        let name = nameArray[indexPath.row]
        
        cell.configureCell(img: images, title: name)
        
        return cell
    }
    
    func dismissFullscreenImage(sender: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 8.0, initialSpringVelocity: 3.0, options: .curveEaseIn, animations: {
            sender.view?.frame = CGRect(origin: self.startingTouch!, size: CGSize(width: 0.0, height: 0.0))
            }, completion: nil)
    }
    
    func fullSizeImage(img: UIImage) {
        newImage = UIImageView(image: img)
        newImage.frame.size = CGSize(width: 0.0, height: 0.0)
        newImage.center = self.view.center
        newImage.backgroundColor = .black
        newImage.contentMode = .scaleAspectFit
        newImage.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage(sender:)))
        newImage.addGestureRecognizer(tap)
        self.view.addSubview(newImage)
        
        let button = UIButton()
        button.frame = CGRect(x: (self.view.frame.size.width / 2) - 100, y: self.view.frame.size.height - 60, width: 200, height: 44)
        button.backgroundColor = UIColor(red: 20/255, green: 175/255, blue: 50/255, alpha: 1.0)
        button.setTitle("Purchase", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.clipsToBounds = true
        
        newImage.addSubview(button)
    }
}

