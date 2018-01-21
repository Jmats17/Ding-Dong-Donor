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
    
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var creatorLabel : UILabel!
    @IBOutlet weak var amountSegmentedControl : UISegmentedControl!
    var amount : Int = 0
    var ref : String?
    var page : DonationPage?
    let barcodeScanner = Scanner()

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Scan a charity!"
        creatorLabel.text = "Even the smallest amount can make a big difference."
        barcodeScanner.completionHandler = { ref in
            CreatorService.showPage(for: Constants.PagePointer.page().child("pages").child(ref), completion: { (page) in
                self.nameLabel.text = page?.name
                self.creatorLabel.text = page?.creator
                self.page = page
                self.ref = ref
            })
            
        }
        BackendService.fetchClientToken()
    }
    
    @IBAction func switchAmount(_ sender: UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex) {
        case 0:
            amount = 1
        case 1:
            amount = 5
        case 2:
            amount = 10
        case 3:
            amount = 20
        default:
            amount = 1
            break
        }
        
    }
    @IBAction func paymentSelected(sender : Any) {
        guard let page = page else {return}
        guard let ref = ref else {return}
       // CreatePageService.updateAmount(page: page, ref: ref, currentAmtRaised: amount)

        BackendService.showDropIn(clientTokenOrTokenizationKey: BackendService.clientToken ?? "", amt: amount, viewController: self)

    }
    @IBAction func scanner(sender : Any) {
        barcodeScanner.presentBarcodeScanner(from: self)

    }
    
   
}
