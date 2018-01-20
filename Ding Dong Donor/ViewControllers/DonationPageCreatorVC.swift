//
//  DonationPageCreatorVC.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/19/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
import ImagePicker
import EFQRCode

class DonationPageCreatorVC : UIViewController {
    
    @IBOutlet weak var nameLabel : UITextField!
    @IBOutlet weak var creatorLabel : UITextField!
    @IBOutlet weak var barcodeImage : UIImageView!
    @IBOutlet weak var submitButton : UIButton!
    let photoService = PhotoService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoService.completionHandler = { img in
            self.barcodeImage.image = img
        }
    }
    
    @IBAction func addImage() {
        photoService.presentImagePickerController(from: self)
      
    }
    
    @IBAction func createPage() {
        guard let name = nameLabel.text else { return}
        guard let creator = creatorLabel.text else {return}
        guard let barcodePic = barcodeImage.image else {return}
        CreatePageService.create(for: barcodePic, name: name, creator: creator, currentAmtRaised: 0)
        
    }

    
    
}
