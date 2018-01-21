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
    }
    
    @IBAction func scan(sender : Any) {
        barcodeScanner.presentBarcodeScanner(from: self)
        
    }
    
    @IBAction func applyPaySelected(sender : Any) {

    }
    @IBAction func venmoSelected(sender : Any) {
        
    }
    @IBAction func cardSelected(sender : Any) {


    }
    @IBAction func bitcoinSelected(sender : Any) {
        
    }
}
