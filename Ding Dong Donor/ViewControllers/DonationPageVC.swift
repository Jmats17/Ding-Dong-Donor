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
    var page : DonationPage?
    var barcodeService = CreateBarcodeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pageRef = pageRef {
            CreatorService.showPage(for: pageRef) { (page) in
                self.page = page
                self.nameLabel.text = page?.name
                self.creatorLabel.text = page?.creator
                let imageURL = URL(string: (page?.imageURL)!)
                self.barcodeService.createBarcode(imageUrl: imageURL!, ref: pageRef){ (barcodeImg) in
                    self.barcodeImage.image = barcodeImg
                }
                
            }
        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
}
