//
//  DonationPageVC.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/20/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
import SwiftQRCode
import FirebaseDatabase
import Kingfisher

class DonationPageVC : UIViewController {
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var creatorLabel : UILabel!
    @IBOutlet weak var barcodeImage : UIImageView!
    var pageRef : DatabaseReference?
    var userKeyRef : String?
    var page : DonationPage?
    var barcodeService = CreateBarcodeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userKeyRef = userKeyRef {
            CreatorService.showPage(for: Constants.PagePointer.page().child("pages").child("\(userKeyRef)")) { (page) in
                self.page = page
                self.nameLabel.text = page?.name
                self.creatorLabel.text = page?.creator
                print(Constants.PagePointer.page().child("pages").child("\(userKeyRef)"))
                self.barcodeService.createBarcode(stringRef: userKeyRef){ (barcodeImg) in
                    
                    self.barcodeImage.image = barcodeImg
                }
            }
        }
        
        
        
    }
   
}
