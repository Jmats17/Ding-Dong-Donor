//
//  ScannerViewController.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/21/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit


class ScannerViewController : UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        
    }
    
    @IBAction func scanner(sender : Any) {
        self.performSegue(withIdentifier: "paymentScreen", sender: self)
    }

}



