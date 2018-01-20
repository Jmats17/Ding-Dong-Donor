//
//  DonationPage.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/19/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import EFQRCode


class DonationPage  {
    
    var name : String?
    var creator : String?
    var currentAmtRaised : Int?
    var qrCode : UIImage?
    
    init(name : String, creator : String, currentAmtRaised : Int, qrCode : UIImage) {
        self.name = name
        self.creator = creator
        self.currentAmtRaised = currentAmtRaised
        self.qrCode = qrCode
    }
    
    
}
