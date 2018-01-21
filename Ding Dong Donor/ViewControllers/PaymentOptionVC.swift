//
//  PaymentOptionVC.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/20/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import BraintreeDropIn
import Braintree
class PaymentOptionVC : UIViewController {
    private var merchantID = "merchant.com.justinmatsnev.Ding-Dong-Donor.cannr"
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var creatorLabel : UILabel!
    @IBOutlet weak var amtRaisedLabel : UILabel!
    let barcodeScanner = Scanner()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barcodeScanner.completionHandler = { ref in
            CreatorService.showPage(for: Constants.PagePointer.page().child("pages").child(ref), completion: { (page) in
                self.nameLabel.text = page?.name
                self.creatorLabel.text = page?.creator
                self.amtRaisedLabel.text = "$\((page?.currentAmtRaised)!)"
            })
            
        }
        BackendService.fetchClientToken()
    }
    
    
    
    
    @IBAction func scan(sender : Any) {
        barcodeScanner.presentBarcodeScanner(from: self)
        //
    }

    @IBAction func cardSelected(sender : Any) {
      
        BackendService.showDropIn(clientTokenOrTokenizationKey: BackendService.clientToken ?? "", amt: 1, viewController: self)

    }
    
    
   
}
