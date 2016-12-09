//
//  PurchaseVC.swift
//  Back_Your_Watch
//
//  Created by Nathan Brewer on 12/8/16.
//  Copyright © 2016 Nathan Brewer. All rights reserved.
//

import UIKit

class PurchaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "Back", sender: nil)
    }


}
