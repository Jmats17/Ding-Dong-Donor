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
import SwiftQRCode

class DonationPageCreatorVC : UIViewController {
    
    @IBOutlet weak var nameLabel : UITextField!
    @IBOutlet weak var creatorLabel : UITextField!
    @IBOutlet weak var barcodeImage : UIImageView!
    @IBOutlet weak var submitButton : UIButton!
    let photoService = PhotoService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        nameLabel.delegate = self
        creatorLabel.delegate = self

    }
 

    
    @IBAction func createPage() {
        guard let name = nameLabel.text else { return}
        guard let creator = creatorLabel.text else {return}
        CreatePageService.create(forName: name, creator: creator, currentAmtRaised: 0)
        
    }

    
}

extension DonationPageCreatorVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
