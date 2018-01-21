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
        self.navigationController?.setNavigationBarHidden(true, animated: true)
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

    @IBAction func paymentSelected(sender : Any) {
        guard let page = page else {return}
        guard let ref = ref else {return}
        BackendService.showDropIn(clientTokenOrTokenizationKey: BackendService.clientToken ?? "", page: page, ref: ref, amt: amount, viewController: self)

    }
    @IBAction func scanner(sender : Any) {
        barcodeScanner.presentBarcodeScanner(from: self)

    }
    
    @IBAction func changeAmount(_ sender: Any) {
        switch (amountSegmentedControl.selectedSegmentIndex) {
        case 0:
            self.amount = 1
        case 1:
            self.amount = 5
        case 2:
            self.amount = 10
        case 3:
            self.amount = 20
        default:
            break
        }
    }
    
}
